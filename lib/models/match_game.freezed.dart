// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'match_game.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MatchGame _$MatchGameFromJson(Map<String, dynamic> json) {
  return _MatchGame.fromJson(json);
}

/// @nodoc
mixin _$MatchGame {
  @JsonKey(name: 'id')
  @HiveField(0)
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'duration')
  @HiveField(1)
  int get duration => throw _privateConstructorUsedError;
  @JsonKey(name: 'errors')
  @HiveField(2)
  int get errors => throw _privateConstructorUsedError;
  @JsonKey(name: 'rights')
  @HiveField(3)
  int get rights => throw _privateConstructorUsedError;
  @JsonKey(name: 'userid')
  @HiveField(4)
  String get userId => throw _privateConstructorUsedError;
  @JsonKey(name: 'images')
  @HiveField(5)
  List<ImageGame> get images => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MatchGameCopyWith<MatchGame> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MatchGameCopyWith<$Res> {
  factory $MatchGameCopyWith(MatchGame value, $Res Function(MatchGame) then) =
      _$MatchGameCopyWithImpl<$Res, MatchGame>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') @HiveField(0) String id,
      @JsonKey(name: 'duration') @HiveField(1) int duration,
      @JsonKey(name: 'errors') @HiveField(2) int errors,
      @JsonKey(name: 'rights') @HiveField(3) int rights,
      @JsonKey(name: 'userid') @HiveField(4) String userId,
      @JsonKey(name: 'images') @HiveField(5) List<ImageGame> images});
}

/// @nodoc
class _$MatchGameCopyWithImpl<$Res, $Val extends MatchGame>
    implements $MatchGameCopyWith<$Res> {
  _$MatchGameCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? duration = null,
    Object? errors = null,
    Object? rights = null,
    Object? userId = null,
    Object? images = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as int,
      errors: null == errors
          ? _value.errors
          : errors // ignore: cast_nullable_to_non_nullable
              as int,
      rights: null == rights
          ? _value.rights
          : rights // ignore: cast_nullable_to_non_nullable
              as int,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      images: null == images
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as List<ImageGame>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MatchGameCopyWith<$Res> implements $MatchGameCopyWith<$Res> {
  factory _$$_MatchGameCopyWith(
          _$_MatchGame value, $Res Function(_$_MatchGame) then) =
      __$$_MatchGameCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') @HiveField(0) String id,
      @JsonKey(name: 'duration') @HiveField(1) int duration,
      @JsonKey(name: 'errors') @HiveField(2) int errors,
      @JsonKey(name: 'rights') @HiveField(3) int rights,
      @JsonKey(name: 'userid') @HiveField(4) String userId,
      @JsonKey(name: 'images') @HiveField(5) List<ImageGame> images});
}

/// @nodoc
class __$$_MatchGameCopyWithImpl<$Res>
    extends _$MatchGameCopyWithImpl<$Res, _$_MatchGame>
    implements _$$_MatchGameCopyWith<$Res> {
  __$$_MatchGameCopyWithImpl(
      _$_MatchGame _value, $Res Function(_$_MatchGame) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? duration = null,
    Object? errors = null,
    Object? rights = null,
    Object? userId = null,
    Object? images = null,
  }) {
    return _then(_$_MatchGame(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as int,
      errors: null == errors
          ? _value.errors
          : errors // ignore: cast_nullable_to_non_nullable
              as int,
      rights: null == rights
          ? _value.rights
          : rights // ignore: cast_nullable_to_non_nullable
              as int,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      images: null == images
          ? _value._images
          : images // ignore: cast_nullable_to_non_nullable
              as List<ImageGame>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
@HiveType(typeId: HiveTypeHelper.matchGameType, adapterName: 'MatchGameAdapter')
class _$_MatchGame extends _MatchGame {
  const _$_MatchGame(
      {@JsonKey(name: 'id') @HiveField(0) required this.id,
      @JsonKey(name: 'duration') @HiveField(1) required this.duration,
      @JsonKey(name: 'errors') @HiveField(2) required this.errors,
      @JsonKey(name: 'rights') @HiveField(3) required this.rights,
      @JsonKey(name: 'userid') @HiveField(4) required this.userId,
      @JsonKey(name: 'images')
      @HiveField(5)
      required final List<ImageGame> images})
      : _images = images,
        super._();

  factory _$_MatchGame.fromJson(Map<String, dynamic> json) =>
      _$$_MatchGameFromJson(json);

  @override
  @JsonKey(name: 'id')
  @HiveField(0)
  final String id;
  @override
  @JsonKey(name: 'duration')
  @HiveField(1)
  final int duration;
  @override
  @JsonKey(name: 'errors')
  @HiveField(2)
  final int errors;
  @override
  @JsonKey(name: 'rights')
  @HiveField(3)
  final int rights;
  @override
  @JsonKey(name: 'userid')
  @HiveField(4)
  final String userId;
  final List<ImageGame> _images;
  @override
  @JsonKey(name: 'images')
  @HiveField(5)
  List<ImageGame> get images {
    if (_images is EqualUnmodifiableListView) return _images;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_images);
  }

  @override
  String toString() {
    return 'MatchGame(id: $id, duration: $duration, errors: $errors, rights: $rights, userId: $userId, images: $images)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MatchGame &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.errors, errors) || other.errors == errors) &&
            (identical(other.rights, rights) || other.rights == rights) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            const DeepCollectionEquality().equals(other._images, _images));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, duration, errors, rights,
      userId, const DeepCollectionEquality().hash(_images));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MatchGameCopyWith<_$_MatchGame> get copyWith =>
      __$$_MatchGameCopyWithImpl<_$_MatchGame>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MatchGameToJson(
      this,
    );
  }
}

abstract class _MatchGame extends MatchGame {
  const factory _MatchGame(
      {@JsonKey(name: 'id') @HiveField(0) required final String id,
      @JsonKey(name: 'duration') @HiveField(1) required final int duration,
      @JsonKey(name: 'errors') @HiveField(2) required final int errors,
      @JsonKey(name: 'rights') @HiveField(3) required final int rights,
      @JsonKey(name: 'userid') @HiveField(4) required final String userId,
      @JsonKey(name: 'images')
      @HiveField(5)
      required final List<ImageGame> images}) = _$_MatchGame;
  const _MatchGame._() : super._();

  factory _MatchGame.fromJson(Map<String, dynamic> json) =
      _$_MatchGame.fromJson;

  @override
  @JsonKey(name: 'id')
  @HiveField(0)
  String get id;
  @override
  @JsonKey(name: 'duration')
  @HiveField(1)
  int get duration;
  @override
  @JsonKey(name: 'errors')
  @HiveField(2)
  int get errors;
  @override
  @JsonKey(name: 'rights')
  @HiveField(3)
  int get rights;
  @override
  @JsonKey(name: 'userid')
  @HiveField(4)
  String get userId;
  @override
  @JsonKey(name: 'images')
  @HiveField(5)
  List<ImageGame> get images;
  @override
  @JsonKey(ignore: true)
  _$$_MatchGameCopyWith<_$_MatchGame> get copyWith =>
      throw _privateConstructorUsedError;
}
