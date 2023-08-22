import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:matchgame/utils/helpers/hive_type_helper.dart';
import 'package:uuid/uuid.dart';

part 'image_game.freezed.dart';
part 'image_game.g.dart';

@Freezed(toJson: true)
class ImageGame with _$ImageGame{

  const ImageGame._();

  @HiveType(typeId: HiveTypeHelper.imageGameType, adapterName: 'ImageGameAdapter')
  const factory ImageGame({
    @JsonKey(name: 'id') @HiveField(0) required String id,
    @JsonKey(name: 'isShow') @HiveField(1) required bool isShow,
    @JsonKey(name: 'symbol') @HiveField(2) required String symbol,
  }) = _ImageGame;

  factory ImageGame.fromJson(Map<String, dynamic> json) => _$ImageGameFromJson(json);

  static get generateId {
    const uuid = Uuid();
    return uuid.v4();
  }
}