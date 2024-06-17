import 'dart:convert';
import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

import 'package:list_interface/app/functional/domain/repository/crypto/ws_repository.dart';
import 'package:list_interface/app/functional/domain/response/ws_status.dart';

class WsRepoImpl implements WsRepository {
  final WebSocketChannel Function(List<String>) builder;
  final Duration _reconnTime;

  WsRepoImpl(this.builder, [this._reconnTime = const Duration(seconds: 5)]);

  WebSocketChannel? _channel;
  StreamController<Map<String, double>>? _priceController;
  StreamController<WsStatus>? _wsController;
  StreamSubscription? _subscription;
  Timer? _timer;

  @override
  Future<bool> connect(List<String> ids) async {
    try {
      if (_subscription != null) {
        _notifyStatus(const WsStatus.reconnecting());
      } else {
        _notifyStatus(const WsStatus.connecting());
      }
      _channel = builder(ids);
      await _channel!.ready;
      _subscription = _channel!.stream.listen(
        (event) {
          final map = Map<String, String>.from(jsonDecode(event));
          // if (kDebugMode) {
          //   print(map);
          //   print(map.runtimeType);
          // }
          final data = <String, double>{}..addEntries(
              map.entries.map(
                (e) => MapEntry(e.key, double.parse(e.value)),
              ),
            );
          if (_priceController?.hasListener ?? false) {
            _priceController!.add(data);
          }
        },
        onDone: () => _reconnect(ids),
      );
      _notifyStatus(const WsStatus.connected());
      return true;
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      _reconnect(ids);
      return false;
    }
  }

  // 21
  @override
  Future<void> disconnect() async {
    _timer?.cancel();
    _timer = null;
    _subscription?.cancel();
    _subscription = null;
    await _priceController?.close();
    await _channel?.sink.close();
    _channel = null;
    await _wsController?.close();
  }

  // 21
  void _reconnect(List<String> ids) {
    if (kDebugMode) {
      print("Conn ended");
    }

    if (_subscription != null) {
      _timer?.cancel();
      _timer = Timer(
        _reconnTime,
        () {
          connect(ids);
        },
      );
    }
  }

  // 22
  void _notifyStatus(WsStatus status) {
    if (_subscription == null) {
      return;
    }
    if (_wsController?.hasListener ?? false) {
      _wsController!.add(status);
    }
  }

  @override
  Stream<Map<String, double>> get onPricesChanged {
    _priceController ??= StreamController.broadcast();
    return _priceController!.stream;
  }

  // 22
  @override
  Stream<WsStatus> get onStatusChanged {
    _wsController ??= StreamController.broadcast();
    return _wsController!.stream;
  }
}
