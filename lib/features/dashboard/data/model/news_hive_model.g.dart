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
      newsid: fields[0] as String?,
      newsPoster: fields[1] as String,
      newsName: fields[2] as String,
      newsDescription: fields[3] as String,
      comments: (fields[4] as List).cast<CommentEntity>(),
      category: fields[5] as String,
      userid: fields[6] as String,
      createdAt: fields[7] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, NewsHiveModel obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.newsid)
      ..writeByte(1)
      ..write(obj.newsPoster)
      ..writeByte(2)
      ..write(obj.newsName)
      ..writeByte(3)
      ..write(obj.newsDescription)
      ..writeByte(4)
      ..write(obj.comments)
      ..writeByte(5)
      ..write(obj.category)
      ..writeByte(6)
      ..write(obj.userid)
      ..writeByte(7)
      ..write(obj.createdAt);
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
