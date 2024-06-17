import 'package:freezed_annotation/freezed_annotation.dart';

part 'crypto.freezed.dart';

@freezed
class Crypto with _$Crypto {
  factory Crypto({
    required String id,
    required String symbol,
    required double price,
    required String explorer,
  }) = _Crypto;
}

// 04 5:47
// 13 5:57