import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart';
import 'package:list_interface/app/imperative/domain/models/crypto.dart';
import 'package:list_interface/app/imperative/domain/responses/imports.dart';

// https://api.coincap.io/v2/assets?ids=bitcoin,ethereum,litecoin,shiba-inu,cardano,dogecoin,usd-coin

class ExchangeAPI {
  final Client _client;

  ExchangeAPI(this._client);

  Future<GetPricesResp> getPrices(List<String> ids) async {
    try {
      final response = await _client.get(
        Uri.parse('https://api.coincap.io/v2/assets?ids=${ids.join(',')}'),
      );
      if (response.statusCode == 200) {
        final json = (jsonDecode(response.body)['data'] as List);
        final cryptos = json.map(
          (e) => Crypto(
            id: e["id"],
            symbol: e["symbol"],
            price: double.parse(e["priceUsd"]),
          ),
        );
        return GetPricesSuccess(cryptos.toList());
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
        failure = HttpRequestFailure.network;
      } else {
        failure = HttpRequestFailure.local;
      }
      return GetPricesFailure(failure);
    }
  }
}
