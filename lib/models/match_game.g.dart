// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'match_game.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MatchGameAdapter extends TypeAdapter<_$_MatchGame> {
  @override
  final int typeId = 30;

  @override
  _$_MatchGame read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$_MatchGame(
      id: fields[0] as String,
      duration: fields[1] as int,
      errors: fields[2] as int,
      rights: fields[3] as int,
      userId: fields[4] as String,
      images: (fields[5] as List).cast<ImageGame>(),
    );
  }

  @override
  void write(BinaryWriter writer, _$_MatchGame obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.duration)
      ..writeByte(2)
      ..write(obj.errors)
      ..writeByte(3)
      ..write(obj.rights)
      ..writeByte(4)
      ..write(obj.userId)
      ..writeByte(5)
      ..write(obj.images);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MatchGameAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MatchGame _$$_MatchGameFromJson(Map<String, dynamic> json) => _$_MatchGame(
      id: json['id'] as String,
      duration: json['duration'] as int,
      errors: json['errors'] as int,
      rights: json['rights'] as int,
      userId: json['userid'] as String,
      images: (json['images'] as List<dynamic>)
          .map((e) => ImageGame.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_MatchGameToJson(_$_MatchGame instance) =>
    <String, dynamic>{
      'id': instance.id,
      'duration': instance.duration,
      'errors': instance.errors,
      'rights': instance.rights,
      'userid': instance.userId,
      'images': instance.images,
    };
