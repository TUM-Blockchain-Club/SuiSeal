// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sneaker.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Sneaker {
  String get name => throw _privateConstructorUsedError;
  String get brand => throw _privateConstructorUsedError;
  String get imagePath => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  DateTime get releaseDate => throw _privateConstructorUsedError;
  double get price => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SneakerCopyWith<Sneaker> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SneakerCopyWith<$Res> {
  factory $SneakerCopyWith(Sneaker value, $Res Function(Sneaker) then) =
      _$SneakerCopyWithImpl<$Res, Sneaker>;
  @useResult
  $Res call(
      {String name,
      String brand,
      String imagePath,
      String description,
      DateTime releaseDate,
      double price});
}

/// @nodoc
class _$SneakerCopyWithImpl<$Res, $Val extends Sneaker>
    implements $SneakerCopyWith<$Res> {
  _$SneakerCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? brand = null,
    Object? imagePath = null,
    Object? description = null,
    Object? releaseDate = null,
    Object? price = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      brand: null == brand
          ? _value.brand
          : brand // ignore: cast_nullable_to_non_nullable
              as String,
      imagePath: null == imagePath
          ? _value.imagePath
          : imagePath // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      releaseDate: null == releaseDate
          ? _value.releaseDate
          : releaseDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SneakerImplCopyWith<$Res> implements $SneakerCopyWith<$Res> {
  factory _$$SneakerImplCopyWith(
          _$SneakerImpl value, $Res Function(_$SneakerImpl) then) =
      __$$SneakerImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      String brand,
      String imagePath,
      String description,
      DateTime releaseDate,
      double price});
}

/// @nodoc
class __$$SneakerImplCopyWithImpl<$Res>
    extends _$SneakerCopyWithImpl<$Res, _$SneakerImpl>
    implements _$$SneakerImplCopyWith<$Res> {
  __$$SneakerImplCopyWithImpl(
      _$SneakerImpl _value, $Res Function(_$SneakerImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? brand = null,
    Object? imagePath = null,
    Object? description = null,
    Object? releaseDate = null,
    Object? price = null,
  }) {
    return _then(_$SneakerImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      brand: null == brand
          ? _value.brand
          : brand // ignore: cast_nullable_to_non_nullable
              as String,
      imagePath: null == imagePath
          ? _value.imagePath
          : imagePath // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      releaseDate: null == releaseDate
          ? _value.releaseDate
          : releaseDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$SneakerImpl implements _Sneaker {
  _$SneakerImpl(
      {required this.name,
      required this.brand,
      required this.imagePath,
      required this.description,
      required this.releaseDate,
      required this.price});

  @override
  final String name;
  @override
  final String brand;
  @override
  final String imagePath;
  @override
  final String description;
  @override
  final DateTime releaseDate;
  @override
  final double price;

  @override
  String toString() {
    return 'Sneaker(name: $name, brand: $brand, imagePath: $imagePath, description: $description, releaseDate: $releaseDate, price: $price)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SneakerImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.brand, brand) || other.brand == brand) &&
            (identical(other.imagePath, imagePath) ||
                other.imagePath == imagePath) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.releaseDate, releaseDate) ||
                other.releaseDate == releaseDate) &&
            (identical(other.price, price) || other.price == price));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, name, brand, imagePath, description, releaseDate, price);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SneakerImplCopyWith<_$SneakerImpl> get copyWith =>
      __$$SneakerImplCopyWithImpl<_$SneakerImpl>(this, _$identity);
}

abstract class _Sneaker implements Sneaker {
  factory _Sneaker(
      {required final String name,
      required final String brand,
      required final String imagePath,
      required final String description,
      required final DateTime releaseDate,
      required final double price}) = _$SneakerImpl;

  @override
  String get name;
  @override
  String get brand;
  @override
  String get imagePath;
  @override
  String get description;
  @override
  DateTime get releaseDate;
  @override
  double get price;
  @override
  @JsonKey(ignore: true)
  _$$SneakerImplCopyWith<_$SneakerImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
