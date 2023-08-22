// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

User _$UserFromJson(Map<String, dynamic> json) {
  return _User.fromJson(json);
}

/// @nodoc
mixin _$User {
  @JsonKey(name: 'id')
  @HiveField(0)
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'userName')
  @HiveField(1)
  String get userName => throw _privateConstructorUsedError;
  @JsonKey(name: 'password')
  @HiveField(2)
  String get password => throw _privateConstructorUsedError;
  @JsonKey(name: 'name')
  @HiveField(3)
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'results')
  @HiveField(4)
  List<MatchGame> get results => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserCopyWith<User> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserCopyWith<$Res> {
  factory $UserCopyWith(User value, $Res Function(User) then) =
      _$UserCopyWithImpl<$Res, User>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') @HiveField(0) String id,
      @JsonKey(name: 'userName') @HiveField(1) String userName,
      @JsonKey(name: 'password') @HiveField(2) String password,
      @JsonKey(name: 'name') @HiveField(3) String name,
      @JsonKey(name: 'results') @HiveField(4) List<MatchGame> results});
}

/// @nodoc
class _$UserCopyWithImpl<$Res, $Val extends User>
    implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userName = null,
    Object? password = null,
    Object? name = null,
    Object? results = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      results: null == results
          ? _value.results
          : results // ignore: cast_nullable_to_non_nullable
              as List<MatchGame>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UserCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$$_UserCopyWith(_$_User value, $Res Function(_$_User) then) =
      __$$_UserCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') @HiveField(0) String id,
      @JsonKey(name: 'userName') @HiveField(1) String userName,
      @JsonKey(name: 'password') @HiveField(2) String password,
      @JsonKey(name: 'name') @HiveField(3) String name,
      @JsonKey(name: 'results') @HiveField(4) List<MatchGame> results});
}

/// @nodoc
class __$$_UserCopyWithImpl<$Res> extends _$UserCopyWithImpl<$Res, _$_User>
    implements _$$_UserCopyWith<$Res> {
  __$$_UserCopyWithImpl(_$_User _value, $Res Function(_$_User) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userName = null,
    Object? password = null,
    Object? name = null,
    Object? results = null,
  }) {
    return _then(_$_User(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      results: null == results
          ? _value._results
          : results // ignore: cast_nullable_to_non_nullable
              as List<MatchGame>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
@HiveType(typeId: HiveTypeHelper.userType, adapterName: 'UserAdapter')
class _$_User implements _User {
  const _$_User(
      {@JsonKey(name: 'id') @HiveField(0) required this.id,
      @JsonKey(name: 'userName') @HiveField(1) required this.userName,
      @JsonKey(name: 'password') @HiveField(2) required this.password,
      @JsonKey(name: 'name') @HiveField(3) required this.name,
      @JsonKey(name: 'results')
      @HiveField(4)
      required final List<MatchGame> results})
      : _results = results;

  factory _$_User.fromJson(Map<String, dynamic> json) => _$$_UserFromJson(json);

  @override
  @JsonKey(name: 'id')
  @HiveField(0)
  final String id;
  @override
  @JsonKey(name: 'userName')
  @HiveField(1)
  final String userName;
  @override
  @JsonKey(name: 'password')
  @HiveField(2)
  final String password;
  @override
  @JsonKey(name: 'name')
  @HiveField(3)
  final String name;
  final List<MatchGame> _results;
  @override
  @JsonKey(name: 'results')
  @HiveField(4)
  List<MatchGame> get results {
    if (_results is EqualUnmodifiableListView) return _results;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_results);
  }

  @override
  String toString() {
    return 'User(id: $id, userName: $userName, password: $password, name: $name, results: $results)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_User &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality().equals(other._results, _results));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, userName, password, name,
      const DeepCollectionEquality().hash(_results));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserCopyWith<_$_User> get copyWith =>
      __$$_UserCopyWithImpl<_$_User>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserToJson(
      this,
    );
  }
}

abstract class _User implements User {
  const factory _User(
      {@JsonKey(name: 'id') @HiveField(0) required final String id,
      @JsonKey(name: 'userName') @HiveField(1) required final String userName,
      @JsonKey(name: 'password') @HiveField(2) required final String password,
      @JsonKey(name: 'name') @HiveField(3) required final String name,
      @JsonKey(name: 'results')
      @HiveField(4)
      required final List<MatchGame> results}) = _$_User;

  factory _User.fromJson(Map<String, dynamic> json) = _$_User.fromJson;

  @override
  @JsonKey(name: 'id')
  @HiveField(0)
  String get id;
  @override
  @JsonKey(name: 'userName')
  @HiveField(1)
  String get userName;
  @override
  @JsonKey(name: 'password')
  @HiveField(2)
  String get password;
  @override
  @JsonKey(name: 'name')
  @HiveField(3)
  String get name;
  @override
  @JsonKey(name: 'results')
  @HiveField(4)
  List<MatchGame> get results;
  @override
  @JsonKey(ignore: true)
  _$$_UserCopyWith<_$_User> get copyWith => throw _privateConstructorUsedError;
}
