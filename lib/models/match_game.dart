import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:matchgame/models/image_game.dart';
import 'package:matchgame/utils/helpers/hive_type_helper.dart';
import 'package:uuid/uuid.dart';

part 'match_game.freezed.dart';
part 'match_game.g.dart';

@Freezed(toJson: true)
class MatchGame with _$MatchGame{

  const MatchGame._();

  @HiveType(typeId: HiveTypeHelper.matchGameType, adapterName: 'MatchGameAdapter')
  const factory MatchGame({
    @JsonKey(name: 'id') @HiveField(0) required String id,
    @JsonKey(name: 'duration') @HiveField(1) required int duration,
    @JsonKey(name: 'errors') @HiveField(2) required int errors,
    @JsonKey(name: 'rights') @HiveField(3) required int rights,
    @JsonKey(name: 'userid') @HiveField(4) required String userId,
    @JsonKey(name: 'images') @HiveField(5) required List<ImageGame> images,
  }) = _MatchGame;

  factory MatchGame.fromJson(Map<String, dynamic> json) => _$MatchGameFromJson(json);

  static get generateId {
    const uuid = Uuid();
    return uuid.v4();
  }

  double get total {
    return (rights / errors + duration) * 10000 ;
  }
}