import 'package:list_interface/app/functional/domain/response/imports.dart';

abstract class WsRepository {
  Future<bool> connect(List<String> ids);
  Future<void> disconnect();
  Stream<Map<String, double>> get onPricesChanged;
  Stream<WsStatus> get onStatusChanged;
}
