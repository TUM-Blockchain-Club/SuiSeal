import 'package:freezed_annotation/freezed_annotation.dart';

part 'sneaker.freezed.dart';

@freezed
class Sneaker with _$Sneaker {
  factory Sneaker({
    required String name,
    required String brand,
    required String imagePath,
    required String description,
    required DateTime releaseDate,
    required double price,
  }) = _Sneaker;
}
