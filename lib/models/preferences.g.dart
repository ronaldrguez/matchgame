// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'preferences.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserPreferencesAdapter extends TypeAdapter<_$_UserPreferences> {
  @override
  final int typeId = 100;

  @override
  _$_UserPreferences read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$_UserPreferences(
      dbVersion: fields[0] as int,
      isLoggedIn: fields[1] as bool,
      userId: fields[2] as String?,
      latestLogIn: fields[3] as DateTime?,
    );
  }

  @override
  void write(BinaryWriter writer, _$_UserPreferences obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.dbVersion)
      ..writeByte(1)
      ..write(obj.isLoggedIn)
      ..writeByte(2)
      ..write(obj.userId)
      ..writeByte(3)
      ..write(obj.latestLogIn);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserPreferencesAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserPreferences _$$_UserPreferencesFromJson(Map<String, dynamic> json) =>
    _$_UserPreferences(
      dbVersion: json['dbVersion'] as int,
      isLoggedIn: json['isLoggedIn'] as bool,
      userId: json['userId'] as String?,
      latestLogIn: json['latestLogIn'] == null
          ? null
          : DateTime.parse(json['latestLogIn'] as String),
    );

Map<String, dynamic> _$$_UserPreferencesToJson(_$_UserPreferences instance) =>
    <String, dynamic>{
      'dbVersion': instance.dbVersion,
      'isLoggedIn': instance.isLoggedIn,
      'userId': instance.userId,
      'latestLogIn': instance.latestLogIn?.toIso8601String(),
    };
