// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'image_game.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ImageGame _$ImageGameFromJson(Map<String, dynamic> json) {
  return _ImageGame.fromJson(json);
}

/// @nodoc
mixin _$ImageGame {
  @JsonKey(name: 'id')
  @HiveField(0)
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'isShow')
  @HiveField(1)
  bool get isShow => throw _privateConstructorUsedError;
  @JsonKey(name: 'symbol')
  @HiveField(2)
  String get symbol => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ImageGameCopyWith<ImageGame> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ImageGameCopyWith<$Res> {
  factory $ImageGameCopyWith(ImageGame value, $Res Function(ImageGame) then) =
      _$ImageGameCopyWithImpl<$Res, ImageGame>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') @HiveField(0) String id,
      @JsonKey(name: 'isShow') @HiveField(1) bool isShow,
      @JsonKey(name: 'symbol') @HiveField(2) String symbol});
}

/// @nodoc
class _$ImageGameCopyWithImpl<$Res, $Val extends ImageGame>
    implements $ImageGameCopyWith<$Res> {
  _$ImageGameCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? isShow = null,
    Object? symbol = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      isShow: null == isShow
          ? _value.isShow
          : isShow // ignore: cast_nullable_to_non_nullable
              as bool,
      symbol: null == symbol
          ? _value.symbol
          : symbol // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ImageGameCopyWith<$Res> implements $ImageGameCopyWith<$Res> {
  factory _$$_ImageGameCopyWith(
          _$_ImageGame value, $Res Function(_$_ImageGame) then) =
      __$$_ImageGameCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') @HiveField(0) String id,
      @JsonKey(name: 'isShow') @HiveField(1) bool isShow,
      @JsonKey(name: 'symbol') @HiveField(2) String symbol});
}

/// @nodoc
class __$$_ImageGameCopyWithImpl<$Res>
    extends _$ImageGameCopyWithImpl<$Res, _$_ImageGame>
    implements _$$_ImageGameCopyWith<$Res> {
  __$$_ImageGameCopyWithImpl(
      _$_ImageGame _value, $Res Function(_$_ImageGame) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? isShow = null,
    Object? symbol = null,
  }) {
    return _then(_$_ImageGame(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      isShow: null == isShow
          ? _value.isShow
          : isShow // ignore: cast_nullable_to_non_nullable
              as bool,
      symbol: null == symbol
          ? _value.symbol
          : symbol // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
@HiveType(typeId: HiveTypeHelper.imageGameType, adapterName: 'ImageGameAdapter')
class _$_ImageGame extends _ImageGame {
  const _$_ImageGame(
      {@JsonKey(name: 'id') @HiveField(0) required this.id,
      @JsonKey(name: 'isShow') @HiveField(1) required this.isShow,
      @JsonKey(name: 'symbol') @HiveField(2) required this.symbol})
      : super._();

  factory _$_ImageGame.fromJson(Map<String, dynamic> json) =>
      _$$_ImageGameFromJson(json);

  @override
  @JsonKey(name: 'id')
  @HiveField(0)
  final String id;
  @override
  @JsonKey(name: 'isShow')
  @HiveField(1)
  final bool isShow;
  @override
  @JsonKey(name: 'symbol')
  @HiveField(2)
  final String symbol;

  @override
  String toString() {
    return 'ImageGame(id: $id, isShow: $isShow, symbol: $symbol)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ImageGame &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.isShow, isShow) || other.isShow == isShow) &&
            (identical(other.symbol, symbol) || other.symbol == symbol));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, isShow, symbol);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ImageGameCopyWith<_$_ImageGame> get copyWith =>
      __$$_ImageGameCopyWithImpl<_$_ImageGame>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ImageGameToJson(
      this,
    );
  }
}

abstract class _ImageGame extends ImageGame {
  const factory _ImageGame(
      {@JsonKey(name: 'id') @HiveField(0) required final String id,
      @JsonKey(name: 'isShow') @HiveField(1) required final bool isShow,
      @JsonKey(name: 'symbol')
      @HiveField(2)
      required final String symbol}) = _$_ImageGame;
  const _ImageGame._() : super._();

  factory _ImageGame.fromJson(Map<String, dynamic> json) =
      _$_ImageGame.fromJson;

  @override
  @JsonKey(name: 'id')
  @HiveField(0)
  String get id;
  @override
  @JsonKey(name: 'isShow')
  @HiveField(1)
  bool get isShow;
  @override
  @JsonKey(name: 'symbol')
  @HiveField(2)
  String get symbol;
  @override
  @JsonKey(ignore: true)
  _$$_ImageGameCopyWith<_$_ImageGame> get copyWith =>
      throw _privateConstructorUsedError;
}