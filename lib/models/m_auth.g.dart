// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'm_auth.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MAuthAdapter extends TypeAdapter<MAuth> {
  @override
  final int typeId = 1;

  @override
  MAuth read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MAuth(
      token: fields[0] as String,
      refreshToken: fields[1] as String,
      tokenExpireAt: fields[2] as DateTime,
      refreshTokenExpireAt: fields[3] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, MAuth obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.token)
      ..writeByte(1)
      ..write(obj.refreshToken)
      ..writeByte(2)
      ..write(obj.tokenExpireAt)
      ..writeByte(3)
      ..write(obj.refreshTokenExpireAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MAuthAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
