import 'package:list_interface/app/functional/domain/repository/crypto/imports.dart';
import 'package:list_interface/app/functional/data/services/exchange_api.dart';

class ExchangeRepositoryImpl implements ExchangeRepository {
  final ExchangeAPI _api;

  ExchangeRepositoryImpl(this._api);

  @override
  GetPricesFuture getPrices(List<String> cryptoIds) {
    return _api.getPrices(cryptoIds);
  }

  @override
  GetSingleCrypto getSingleCrypto(String id) {
    return _api.getSingleCrypto(id);
  }
}
