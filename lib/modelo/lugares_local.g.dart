// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lugares_local.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LugaresLocalAdapter extends TypeAdapter<LugaresLocal> {
  @override
  final int typeId = 0;

  @override
  LugaresLocal read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LugaresLocal()
      ..id = fields[0] as String?
      ..email = fields[1] as String?;
  }

  @override
  void write(BinaryWriter writer, LugaresLocal obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.email);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LugaresLocalAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
