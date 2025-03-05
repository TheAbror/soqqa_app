// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'current_user.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AllUsersAdapter extends TypeAdapter<AllUsers> {
  @override
  final int typeId = 2;

  @override
  AllUsers read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AllUsers(
      allUsers: (fields[0] as List?)?.cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, AllUsers obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.allUsers);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AllUsersAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
