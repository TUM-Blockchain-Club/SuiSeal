// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sneaker_keypair.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SneakerKeypair {
  String get publicKey => throw _privateConstructorUsedError;
  String get privateKey => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SneakerKeypairCopyWith<SneakerKeypair> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SneakerKeypairCopyWith<$Res> {
  factory $SneakerKeypairCopyWith(
          SneakerKeypair value, $Res Function(SneakerKeypair) then) =
      _$SneakerKeypairCopyWithImpl<$Res, SneakerKeypair>;
  @useResult
  $Res call({String publicKey, String privateKey});
}

/// @nodoc
class _$SneakerKeypairCopyWithImpl<$Res, $Val extends SneakerKeypair>
    implements $SneakerKeypairCopyWith<$Res> {
  _$SneakerKeypairCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? publicKey = null,
    Object? privateKey = null,
  }) {
    return _then(_value.copyWith(
      publicKey: null == publicKey
          ? _value.publicKey
          : publicKey // ignore: cast_nullable_to_non_nullable
              as String,
      privateKey: null == privateKey
          ? _value.privateKey
          : privateKey // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SneakerKeypairImplCopyWith<$Res>
    implements $SneakerKeypairCopyWith<$Res> {
  factory _$$SneakerKeypairImplCopyWith(_$SneakerKeypairImpl value,
          $Res Function(_$SneakerKeypairImpl) then) =
      __$$SneakerKeypairImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String publicKey, String privateKey});
}

/// @nodoc
class __$$SneakerKeypairImplCopyWithImpl<$Res>
    extends _$SneakerKeypairCopyWithImpl<$Res, _$SneakerKeypairImpl>
    implements _$$SneakerKeypairImplCopyWith<$Res> {
  __$$SneakerKeypairImplCopyWithImpl(
      _$SneakerKeypairImpl _value, $Res Function(_$SneakerKeypairImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? publicKey = null,
    Object? privateKey = null,
  }) {
    return _then(_$SneakerKeypairImpl(
      publicKey: null == publicKey
          ? _value.publicKey
          : publicKey // ignore: cast_nullable_to_non_nullable
              as String,
      privateKey: null == privateKey
          ? _value.privateKey
          : privateKey // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SneakerKeypairImpl implements _SneakerKeypair {
  const _$SneakerKeypairImpl(
      {required this.publicKey, required this.privateKey});

  @override
  final String publicKey;
  @override
  final String privateKey;

  @override
  String toString() {
    return 'SneakerKeypair(publicKey: $publicKey, privateKey: $privateKey)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SneakerKeypairImpl &&
            (identical(other.publicKey, publicKey) ||
                other.publicKey == publicKey) &&
            (identical(other.privateKey, privateKey) ||
                other.privateKey == privateKey));
  }

  @override
  int get hashCode => Object.hash(runtimeType, publicKey, privateKey);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SneakerKeypairImplCopyWith<_$SneakerKeypairImpl> get copyWith =>
      __$$SneakerKeypairImplCopyWithImpl<_$SneakerKeypairImpl>(
          this, _$identity);
}

abstract class _SneakerKeypair implements SneakerKeypair {
  const factory _SneakerKeypair(
      {required final String publicKey,
      required final String privateKey}) = _$SneakerKeypairImpl;

  @override
  String get publicKey;
  @override
  String get privateKey;
  @override
  @JsonKey(ignore: true)
  _$$SneakerKeypairImplCopyWith<_$SneakerKeypairImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
