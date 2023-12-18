// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'roster.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RosterAdapter extends TypeAdapter<Roster> {
  @override
  final int typeId = 3;

  @override
  Roster read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Roster(
      elements: (fields[1] as List).cast<RosterElement>(),
      name: fields[0] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Roster obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.elements);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RosterAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
