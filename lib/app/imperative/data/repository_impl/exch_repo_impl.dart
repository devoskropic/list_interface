import 'package:list_interface/app/imperative/data/services/exchange_api.dart';
import 'package:list_interface/app/imperative/domain/repositories/exchange.dart';
import 'package:list_interface/app/imperative/domain/responses/get_prices_resp.dart';

class ExchangeRepositoryImpl implements ExchangeRepository {
  final ExchangeAPI _api;

  ExchangeRepositoryImpl(this._api);

  @override
  Future<GetPricesResp> getPrices(List<String> cryptoIds) {
    return _api.getPrices(cryptoIds);
  }
}
