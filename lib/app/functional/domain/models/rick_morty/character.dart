import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:list_interface/app/functional/domain/models/rick_morty/character_location.dart';

part 'freezed/character.freezed.dart';
part 'g/character.g.dart';

@freezed
class Character with _$Character {
  factory Character({
    required int id,
    required String name,
    required String status,
    required String species,
    required String type,
    required String gender,
    required CharacterLocation origin,
    required CharacterLocation location,
    required String image,
    required List<String> episode,
    required String url,
    required DateTime created,
  }) = _Character;

  factory Character.fromJson(Map<String, dynamic> json) =>
      _$CharacterFromJson(json);
}
