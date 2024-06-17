import 'package:flutter/material.dart';
import 'package:list_interface/app/imperative/domain/repositories/exchange.dart';
import 'package:list_interface/app/imperative/domain/responses/get_prices_resp.dart';
import 'home_state.dart';

class HomeProvider extends ChangeNotifier {
  final ExchangeRepository exchRepo;

  HomeProvider({required this.exchRepo});

  HomeState _state = HomeStateLoading();
  HomeState get state => _state;

  Future<void> init() async {
    if (state is! HomeStateLoading) {
      _state = HomeStateLoading();
      notifyListeners();
    }
    final result = await exchRepo.getPrices(
      [
        'bitcoin',
        'ethereum',
        'litecoin',
        'shiba-inu',
        'cardano',
        'dogecoin',
        'usd-coin',
      ],
    );

    if (result is GetPricesSuccess) {
      _state = HomeStateLoaded(result.cryptos);
    } else {
      _state = HomeStateFailed();
    }
    notifyListeners();
  }
}
