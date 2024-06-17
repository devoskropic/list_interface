import 'package:list_interface/app/functional/domain/either/either.dart';
import 'package:list_interface/app/functional/domain/response/imports.dart';
import 'package:list_interface/app/functional/domain/models/crypto/crypto.dart';

typedef GetPricesFuture = Future<Either<HttpRequestFailure, List<Crypto>>>;
typedef GetSingleCrypto = Future<Either<HttpRequestFailure, List<Crypto>>>;

abstract class ExchangeRepository {
  GetPricesFuture getPrices(List<String> cryptoIds);
  GetSingleCrypto getSingleCrypto(String id);
}
