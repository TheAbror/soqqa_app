// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'current_user.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CurrentUserAdapter extends TypeAdapter<CurrentUser> {
  @override
  final int typeId = 1;

  @override
  CurrentUser read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CurrentUser(
      fullName: fields[0] as String,
      shortName: fields[1] as String,
      token: fields[3] as String,
      userID: fields[4] as String,
      roles: (fields[5] as List).cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, CurrentUser obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.fullName)
      ..writeByte(1)
      ..write(obj.shortName)
      ..writeByte(3)
      ..write(obj.token)
      ..writeByte(4)
      ..write(obj.userID)
      ..writeByte(5)
      ..write(obj.roles);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CurrentUserAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
