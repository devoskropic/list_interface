import 'package:list_interface/app/imperative/domain/responses/get_prices_resp.dart';

abstract class ExchangeRepository {
  Future<GetPricesResp> getPrices(List<String> cryptoIds);
}
