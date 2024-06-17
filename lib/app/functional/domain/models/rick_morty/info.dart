import 'package:freezed_annotation/freezed_annotation.dart';

part 'freezed/info.freezed.dart';
part 'g/info.g.dart';

@freezed
class Info with _$Info {
  factory Info({
    required int count,
    required int pages,
    @Default('') String? next,
    @Default('') String? prev,
  }) = _Info;

  factory Info.fromJson(Map<String, dynamic> json) => _$InfoFromJson(json);
}


// dart run build_runner build --delete-conflicting-outputs
// flutter pub add json_serializable
// flutter pub add json_annotation