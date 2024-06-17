import 'package:list_interface/app/imperative/domain/models/crypto.dart';
import 'package:list_interface/app/imperative/domain/responses/http_request_failure.dart';

abstract class GetPricesResp {}

class GetPricesSuccess extends GetPricesResp {
  final List<Crypto> cryptos;

  GetPricesSuccess(this.cryptos);
}

class GetPricesFailure extends GetPricesResp {
  final HttpRequestFailure failure;

  GetPricesFailure(this.failure);
}
