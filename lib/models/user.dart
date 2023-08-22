import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:matchgame/utils/helpers/hive_type_helper.dart';
import 'package:uuid/uuid.dart';

import 'match_game.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@Freezed(toJson: true)
class User with _$User {

  @HiveType(typeId: HiveTypeHelper.userType, adapterName: 'UserAdapter')
  const factory User({
    @JsonKey(name: 'id') @HiveField(0) required String id,
    @JsonKey(name: 'userName') @HiveField(1) required String userName,
    @JsonKey(name: 'password') @HiveField(2) required String password,
    @JsonKey(name: 'name') @HiveField(3) required String name,
    @JsonKey(name: 'results') @HiveField(4) required List<MatchGame> results
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  static get generateId {
    const uuid = Uuid();
    return uuid.v4();
  }
}