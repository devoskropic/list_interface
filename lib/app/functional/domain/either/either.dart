import 'package:freezed_annotation/freezed_annotation.dart';

part 'either.freezed.dart';

@freezed
class Either<L, R> with _$Either<L, R> {
  factory Either.left(L value) = _Left;
  factory Either.right(R value) = _Right;
}

// dart run build_runner build