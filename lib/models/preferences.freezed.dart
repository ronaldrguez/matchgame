// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'preferences.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserPreferences _$UserPreferencesFromJson(Map<String, dynamic> json) {
  return _UserPreferences.fromJson(json);
}

/// @nodoc
mixin _$UserPreferences {
  @JsonKey(name: 'dbVersion')
  @HiveField(0)
  int get dbVersion => throw _privateConstructorUsedError;
  @JsonKey(name: 'isLoggedIn')
  @HiveField(1)
  bool get isLoggedIn => throw _privateConstructorUsedError;
  @JsonKey(name: 'userId')
  @HiveField(2)
  String? get userId => throw _privateConstructorUsedError;
  @JsonKey(name: 'latestLogIn')
  @HiveField(3)
  DateTime? get latestLogIn => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserPreferencesCopyWith<UserPreferences> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserPreferencesCopyWith<$Res> {
  factory $UserPreferencesCopyWith(
          UserPreferences value, $Res Function(UserPreferences) then) =
      _$UserPreferencesCopyWithImpl<$Res, UserPreferences>;
  @useResult
  $Res call(
      {@JsonKey(name: 'dbVersion') @HiveField(0) int dbVersion,
      @JsonKey(name: 'isLoggedIn') @HiveField(1) bool isLoggedIn,
      @JsonKey(name: 'userId') @HiveField(2) String? userId,
      @JsonKey(name: 'latestLogIn') @HiveField(3) DateTime? latestLogIn});
}

/// @nodoc
class _$UserPreferencesCopyWithImpl<$Res, $Val extends UserPreferences>
    implements $UserPreferencesCopyWith<$Res> {
  _$UserPreferencesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dbVersion = null,
    Object? isLoggedIn = null,
    Object? userId = freezed,
    Object? latestLogIn = freezed,
  }) {
    return _then(_value.copyWith(
      dbVersion: null == dbVersion
          ? _value.dbVersion
          : dbVersion // ignore: cast_nullable_to_non_nullable
              as int,
      isLoggedIn: null == isLoggedIn
          ? _value.isLoggedIn
          : isLoggedIn // ignore: cast_nullable_to_non_nullable
              as bool,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      latestLogIn: freezed == latestLogIn
          ? _value.latestLogIn
          : latestLogIn // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UserPreferencesCopyWith<$Res>
    implements $UserPreferencesCopyWith<$Res> {
  factory _$$_UserPreferencesCopyWith(
          _$_UserPreferences value, $Res Function(_$_UserPreferences) then) =
      __$$_UserPreferencesCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'dbVersion') @HiveField(0) int dbVersion,
      @JsonKey(name: 'isLoggedIn') @HiveField(1) bool isLoggedIn,
      @JsonKey(name: 'userId') @HiveField(2) String? userId,
      @JsonKey(name: 'latestLogIn') @HiveField(3) DateTime? latestLogIn});
}

/// @nodoc
class __$$_UserPreferencesCopyWithImpl<$Res>
    extends _$UserPreferencesCopyWithImpl<$Res, _$_UserPreferences>
    implements _$$_UserPreferencesCopyWith<$Res> {
  __$$_UserPreferencesCopyWithImpl(
      _$_UserPreferences _value, $Res Function(_$_UserPreferences) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dbVersion = null,
    Object? isLoggedIn = null,
    Object? userId = freezed,
    Object? latestLogIn = freezed,
  }) {
    return _then(_$_UserPreferences(
      dbVersion: null == dbVersion
          ? _value.dbVersion
          : dbVersion // ignore: cast_nullable_to_non_nullable
              as int,
      isLoggedIn: null == isLoggedIn
          ? _value.isLoggedIn
          : isLoggedIn // ignore: cast_nullable_to_non_nullable
              as bool,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      latestLogIn: freezed == latestLogIn
          ? _value.latestLogIn
          : latestLogIn // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
@HiveType(
    typeId: HiveTypeHelper.configType, adapterName: 'UserPreferencesAdapter')
class _$_UserPreferences implements _UserPreferences {
  _$_UserPreferences(
      {@JsonKey(name: 'dbVersion') @HiveField(0) required this.dbVersion,
      @JsonKey(name: 'isLoggedIn') @HiveField(1) required this.isLoggedIn,
      @JsonKey(name: 'userId') @HiveField(2) required this.userId,
      @JsonKey(name: 'latestLogIn') @HiveField(3) required this.latestLogIn});

  factory _$_UserPreferences.fromJson(Map<String, dynamic> json) =>
      _$$_UserPreferencesFromJson(json);

  @override
  @JsonKey(name: 'dbVersion')
  @HiveField(0)
  final int dbVersion;
  @override
  @JsonKey(name: 'isLoggedIn')
  @HiveField(1)
  final bool isLoggedIn;
  @override
  @JsonKey(name: 'userId')
  @HiveField(2)
  final String? userId;
  @override
  @JsonKey(name: 'latestLogIn')
  @HiveField(3)
  final DateTime? latestLogIn;

  @override
  String toString() {
    return 'UserPreferences(dbVersion: $dbVersion, isLoggedIn: $isLoggedIn, userId: $userId, latestLogIn: $latestLogIn)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserPreferences &&
            (identical(other.dbVersion, dbVersion) ||
                other.dbVersion == dbVersion) &&
            (identical(other.isLoggedIn, isLoggedIn) ||
                other.isLoggedIn == isLoggedIn) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.latestLogIn, latestLogIn) ||
                other.latestLogIn == latestLogIn));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, dbVersion, isLoggedIn, userId, latestLogIn);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserPreferencesCopyWith<_$_UserPreferences> get copyWith =>
      __$$_UserPreferencesCopyWithImpl<_$_UserPreferences>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserPreferencesToJson(
      this,
    );
  }
}

abstract class _UserPreferences implements UserPreferences {
  factory _UserPreferences(
      {@JsonKey(name: 'dbVersion') @HiveField(0) required final int dbVersion,
      @JsonKey(name: 'isLoggedIn') @HiveField(1) required final bool isLoggedIn,
      @JsonKey(name: 'userId') @HiveField(2) required final String? userId,
      @JsonKey(name: 'latestLogIn')
      @HiveField(3)
      required final DateTime? latestLogIn}) = _$_UserPreferences;

  factory _UserPreferences.fromJson(Map<String, dynamic> json) =
      _$_UserPreferences.fromJson;

  @override
  @JsonKey(name: 'dbVersion')
  @HiveField(0)
  int get dbVersion;
  @override
  @JsonKey(name: 'isLoggedIn')
  @HiveField(1)
  bool get isLoggedIn;
  @override
  @JsonKey(name: 'userId')
  @HiveField(2)
  String? get userId;
  @override
  @JsonKey(name: 'latestLogIn')
  @HiveField(3)
  DateTime? get latestLogIn;
  @override
  @JsonKey(ignore: true)
  _$$_UserPreferencesCopyWith<_$_UserPreferences> get copyWith =>
      throw _privateConstructorUsedError;
}
