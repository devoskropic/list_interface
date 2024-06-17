import 'package:freezed_annotation/freezed_annotation.dart';

part 'freezed/location.freezed.dart';
part 'g/location.g.dart';

@freezed
class Location with _$Location {
  factory Location({
    required int id,
    required String name,
    required String type,
    required String dimension,
    required List<String> residents,
    required String url,
    required DateTime created,
  }) = _Location;

  factory Location.fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json);
}
