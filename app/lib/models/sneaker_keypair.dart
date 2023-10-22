import 'package:freezed_annotation/freezed_annotation.dart';

part 'sneaker_keypair.freezed.dart';

@freezed
class SneakerKeypair with _$SneakerKeypair {
  const factory SneakerKeypair({
    required String publicKey,
    required String privateKey,
  }) = _SneakerKeypair;
}
