import 'dart:convert';
import 'package:http/http.dart';

import 'package:list_interface/app/functional/domain/either/either.dart';
import 'package:list_interface/app/functional/domain/models/rick_morty/constants.dart';
import 'package:list_interface/app/functional/domain/models/rick_morty/character.dart';
import 'package:list_interface/app/functional/domain/repository/rym/rym_repository.dart';
import 'package:list_interface/app/functional/domain/response/http_request_failure.dart';

class RickMortyAPI {
  final Client _client;

  RickMortyAPI(this._client);

  List<Map<String, dynamic>> objects = [];

  GetCharacterById getCharacterById(List<int> ids) async {
    try {
      List<Character> characters = [];
      List<Map<String, dynamic>> allEntities = [];
      final response = await _client.get(
        Uri.parse(baseURL + characterEndpoint + charIds.join(',')),
      );
      if (response.statusCode == 200) {
        final parsedJson = jsonDecode(response.body);
        allEntities.addAll(
          List<Map<String, dynamic>>.from(parsedJson),
        );
        characters = List<Character>.from(
          allEntities.map((e) => Character.fromJson(e)),
        );
      }
      if (response.statusCode == 404) {
        throw HttpRequestFailure.notFound();
      }
      if (response.statusCode == 500) {
        throw HttpRequestFailure.server;
      }
      return Either.right(characters);
    } catch (e) {
      late HttpRequestFailure failure;
      if (e is HttpRequestFailure) {
        failure = e;
      } else {
        failure = HttpRequestFailure.local();
      }
      return Either.left(failure);
    }
  }
}
