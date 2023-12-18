// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'roster_element.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RosterElementAdapter extends TypeAdapter<RosterElement> {
  @override
  final int typeId = 4;

  @override
  RosterElement read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return RosterElement(
      name: fields[0] as String,
      isDone: fields[1] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, RosterElement obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.isDone);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RosterElementAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
