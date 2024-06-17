// import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'dart:async';
import 'home_state.dart';

import 'package:list_interface/app/functional/domain/models/crypto/constants.dart';
import 'package:list_interface/app/functional/domain/repository/crypto/imports.dart';
import 'package:list_interface/app/functional/domain/response/imports.dart';

class CoincapProvider extends ChangeNotifier {
  final ExchangeRepository exchRepo;
  final WsRepository wsRepo;

  CoincapProvider({required this.exchRepo, required this.wsRepo});

  HomeState _state = const HomeState.loading();
  HomeState get state => _state;
  StreamSubscription? _pricesSubscription, _wsSubscription;

  Future<void> init() async {
    state.maybeWhen(
      orElse: () {
        _state = const HomeState.loading();
        notifyListeners();
      },
    );

    final result = await exchRepo.getPrices(shortList);

    _state = result.when(
      left: (failure) => HomeState.failed(failure),
      right: (cryptos) {
        startPricesListening();
        return HomeState.loaded(cryptos: cryptos);
      },
    );

    notifyListeners();
  }

  Future<bool> startPricesListening() async {
    final connected = await wsRepo.connect(shortList);

    state.mapOrNull(
      loaded: (state) {
        if (connected) {
          _onPricesChanged();
        }
        _state = state.copyWith(
          wsStatus:
              connected ? const WsStatus.connected() : const WsStatus.failed(),
        );
        notifyListeners();
      },
    );
    // state.whenOrNull(
    //   loaded: (cryptos, _) {
    //     _state = HomeState.loaded(
    //       cryptos: cryptos,
    //       wsStatus:
    //           connected ? const WsStatus.connected() : const WsStatus.failed(),
    //     );
    //     notifyListeners();
    //   },
    // );
    return connected;
  }

  void _onPricesChanged() {
    _pricesSubscription?.cancel();
    _wsSubscription?.cancel();
    _pricesSubscription = wsRepo.onPricesChanged.listen(
      (changes) {
        state.mapOrNull(
          loaded: (state) {
            final keys = changes.keys;
            // final cryptos = List<Crypto>.from(state.cryptos);
            // var cryptos = [...state.cryptos];

            // Imperative
            // for (int i = 0; i < cryptos.length; i++) {
            //   final crypto = cryptos[i];
            //   if (keys.contains(crypto.id)) {
            //     cryptos[i] = crypto.copyWith(
            //       price: changes[crypto.id]!,
            //     );
            //   }
            // }
            // Imperative

            // Functional
            // cryptos = cryptos.map(
            //   (crypto) {
            //     if (keys.contains(crypto.id)) {
            //       return crypto.copyWith(
            //         price: changes[crypto.id]!,
            //       );
            //     }
            //     return crypto;
            //   },
            // ).toList();
            // Functional

            // more Functional
            final cryptos = [
              ...state.cryptos.map(
                (crypto) {
                  if (keys.contains(crypto.id)) {
                    return crypto.copyWith(
                      price: changes[crypto.id]!,
                    );
                  }
                  return crypto;
                },
              ),
            ];
            // more Functional

            _state = state.copyWith(
              cryptos: cryptos,
            );
            notifyListeners();
          },
        );
      },
    );
    // 22
    _wsSubscription = wsRepo.onStatusChanged.listen(
      (status) {
        state.mapOrNull(
          loaded: (state) {
            _state = state.copyWith(wsStatus: status);
            notifyListeners();
          },
        );
      },
    );
  }

  var index = -1;

  void switchIndex(int val, String id) {
    if (kDebugMode) {
      print("index | previous: $index, future: $val");
    }
    index = val;
    if (index != 0) {
      singleCrypto(id);
    } else {
      init();
    }
    notifyListeners();
  }

  Future<void> singleCrypto(String id) async {
    state.maybeWhen(
      orElse: () {
        _state = const HomeState.loading();
        notifyListeners();
      },
    );

    final result = await exchRepo.getSingleCrypto(id);

    _state = result.when(
      left: (failure) => HomeState.failed(failure),
      right: (cryptos) {
        // startPricesListening();
        return HomeState.singleLoaded(cryptos: cryptos);
      },
    );

    notifyListeners();
  }

  @override
  void dispose() {
    _pricesSubscription?.cancel();
    _wsSubscription?.cancel();
    super.dispose();
  }
}
