// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'v_card_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class VCardModelAdapter extends TypeAdapter<VCardModel> {
  @override
  final int typeId = 0;

  @override
  VCardModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return VCardModel(
      name: fields[0] as String,
      jobTitle: fields[1] as String,
      email: fields[2] as String,
      phone: fields[3] as String,
      address: fields[4] as String,
      profileImageUrl: fields[5] as String,
      qrCodeUrl: fields[6] as String,
    );
  }

  @override
  void write(BinaryWriter writer, VCardModel obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.jobTitle)
      ..writeByte(2)
      ..write(obj.email)
      ..writeByte(3)
      ..write(obj.phone)
      ..writeByte(4)
      ..write(obj.address)
      ..writeByte(5)
      ..write(obj.profileImageUrl)
      ..writeByte(6)
      ..write(obj.qrCodeUrl);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is VCardModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
