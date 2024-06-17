import 'package:freezed_annotation/freezed_annotation.dart';

part 'freezed/character_location.freezed.dart';
part 'g/character_location.g.dart';

@freezed
class CharacterLocation with _$CharacterLocation {
  factory CharacterLocation({
    required String name,
    required String url,
  }) = _CharacterLocation;

  factory CharacterLocation.fromJson(Map<String, dynamic> json) =>
      _$CharacterLocationFromJson(json);
}
