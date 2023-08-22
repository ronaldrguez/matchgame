import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:matchgame/utils/helpers/hive_type_helper.dart';

part 'preferences.freezed.dart';
part 'preferences.g.dart';

@Freezed(toJson: true)
class UserPreferences with _$UserPreferences {

  @HiveType(typeId: HiveTypeHelper.configType, adapterName: 'UserPreferencesAdapter')
  factory UserPreferences({
    @JsonKey(name: 'dbVersion')
    @HiveField(0)
    required int dbVersion,
    @JsonKey(name: 'isLoggedIn')
    @HiveField(1)
    required bool isLoggedIn,
    @JsonKey(name: 'userId')
    @HiveField(2)
    required String? userId,
    @JsonKey(name: 'latestLogIn')
    @HiveField(3)
    required DateTime? latestLogIn,
  }) = _UserPreferences;

  factory UserPreferences.fromJson(Map<String, dynamic> json) => _$UserPreferencesFromJson(json);
}