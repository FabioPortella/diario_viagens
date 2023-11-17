// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'viagem_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ViagemModelAdapter extends TypeAdapter<ViagemModel> {
  @override
  final int typeId = 1;

  @override
  ViagemModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ViagemModel()
      ..localViagem = fields[0] as String
      ..dataInicio = fields[1] as DateTime?
      ..dataFinal = fields[2] as DateTime?
      ..encerrada = fields[3] as bool;
  }

  @override
  void write(BinaryWriter writer, ViagemModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.localViagem)
      ..writeByte(1)
      ..write(obj.dataInicio)
      ..writeByte(2)
      ..write(obj.dataFinal)
      ..writeByte(3)
      ..write(obj.encerrada);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ViagemModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
