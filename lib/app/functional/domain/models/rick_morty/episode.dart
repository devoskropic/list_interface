import 'package:freezed_annotation/freezed_annotation.dart';

part 'freezed/episode.freezed.dart';
part 'g/episode.g.dart';

@freezed
class Episode with _$Episode {
  factory Episode({
    required int id,
    required String name,
    required String airDate,
    required String episode,
    required List<String> characters,
    required String url,
    required DateTime created,
  }) = _Episode;

  factory Episode.fromJson(Map<String, dynamic> json) =>
      _$EpisodeFromJson(json);
}
