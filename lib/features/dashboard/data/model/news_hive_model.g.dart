// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_hive_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class NewsHiveModelAdapter extends TypeAdapter<NewsHiveModel> {
  @override
  final int typeId = 1;

  @override
  NewsHiveModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return NewsHiveModel(
      newsId: fields[0] as String?,
      newsPoster: fields[1] as String,
      newsName: fields[2] as String,
      newsDescription: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, NewsHiveModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.newsId)
      ..writeByte(1)
      ..write(obj.newsPoster)
      ..writeByte(2)
      ..write(obj.newsName)
      ..writeByte(3)
      ..write(obj.newsDescription);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NewsHiveModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
