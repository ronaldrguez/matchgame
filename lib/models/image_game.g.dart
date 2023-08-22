// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_game.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ImageGameAdapter extends TypeAdapter<_$_ImageGame> {
  @override
  final int typeId = 20;

  @override
  _$_ImageGame read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$_ImageGame(
      id: fields[0] as String,
      isShow: fields[1] as bool,
      symbol: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, _$_ImageGame obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.isShow)
      ..writeByte(2)
      ..write(obj.symbol);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImageGameAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ImageGame _$$_ImageGameFromJson(Map<String, dynamic> json) => _$_ImageGame(
      id: json['id'] as String,
      isShow: json['isShow'] as bool,
      symbol: json['symbol'] as String,
    );

Map<String, dynamic> _$$_ImageGameToJson(_$_ImageGame instance) =>
    <String, dynamic>{
      'id': instance.id,
      'isShow': instance.isShow,
      'symbol': instance.symbol,
    };
