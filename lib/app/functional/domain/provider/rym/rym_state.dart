import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:list_interface/app/functional/domain/models/rick_morty/imports.dart';
import 'package:list_interface/app/functional/domain/response/http_request_failure.dart';

part 'rym_state.freezed.dart';

@freezed
class RymState with _$RymState {
  const factory RymState.loading() = _Loading;
  const factory RymState.failed(HttpRequestFailure failure) = _Failed;
  const factory RymState.characterLoaded({required List<Character> character}) =
      _CharacterLoaded;
  const factory RymState.episodeLoaded({required List<Episode> episode}) =
      _EpisodeLoaded;
  const factory RymState.locationLoaded({required List<Location> location}) =
      _LocationLoaded;
}
