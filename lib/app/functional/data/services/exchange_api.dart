import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart';
import 'package:list_interface/app/functional/domain/either/either.dart';
import 'package:list_interface/app/functional/domain/models/crypto/crypto.dart';
import 'package:list_interface/app/functional/domain/models/crypto/constants.dart';
import 'package:list_interface/app/functional/domain/repository/crypto/imports.dart';
import 'package:list_interface/app/functional/domain/response/imports.dart';

// https://api.coincap.io/v2/assets?ids=bitcoin,shiba-inu,dogecoin,usd-coin

class ExchangeAPI {
  final Client _client;

  ExchangeAPI(this._client);

  // Future<GetPricesResp> getPrices(List<String> ids) async {
  GetPricesFuture getPrices(List<String> ids) async {
    try {
      // final response = await _client.get(
      //   Uri.parse(baseURL),
      // );
      final response = await _client.get(
        Uri.parse(baseURL2 + ids.join(',')),
      );
      if (response.statusCode == 200) {
        final json = (jsonDecode(response.body)['data'] as List);
        final cryptos = json.map(
          (e) => Crypto(
            id: e["id"],
            symbol: e["symbol"],
            price: double.parse(e["priceUsd"]),
            explorer: e["explorer"],
          ),
        );
        // return GetPricesSuccess(cryptos.toList());
        // return Right(cryptos.toList());
        return Either.right(cryptos.toList());
      }
      if (response.statusCode == 404) {
        throw HttpRequestFailure.notFound;
      }
      if (response.statusCode == 500) {
        throw HttpRequestFailure.server;
      }
      throw HttpRequestFailure.local;
    } catch (e) {
      late HttpRequestFailure failure;
      if (e is HttpRequestFailure) {
        failure = e;
      } else if (e is SocketException || e is ClientException) {
        failure = HttpRequestFailure.network();
      } else {
        failure = HttpRequestFailure.local();
      }
      // return GetPricesFailure(failure);
      // return Left(failure);
      return Either.left(failure);
    }
  }

  GetSingleCrypto getSingleCrypto(String id) async {
    try {
      final response = await _client.get(
        Uri.parse(baseURL2 + id),
      );
      if (response.statusCode == 200) {
        final json = (jsonDecode(response.body)['data'] as List);
        final cryptos = json.map(
          (e) => Crypto(
            id: e["id"],
            symbol: e["symbol"],
            price: double.parse(e["priceUsd"]),
            explorer: e["explorer"],
          ),
        );
        return Either.right(cryptos.toList());
      }
      if (response.statusCode == 404) {
        throw HttpRequestFailure.notFound;
      }
      if (response.statusCode == 500) {
        throw HttpRequestFailure.server;
      }
      throw HttpRequestFailure.local;
    } catch (e) {
      late HttpRequestFailure failure;
      if (e is HttpRequestFailure) {
        failure = e;
      } else if (e is SocketException || e is ClientException) {
        failure = HttpRequestFailure.network();
      } else {
        failure = HttpRequestFailure.local();
      }
      // return GetPricesFailure(failure);
      // return Left(failure);
      return Either.left(failure);
    }
  }
}
