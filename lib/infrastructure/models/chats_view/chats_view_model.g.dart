// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chats_view_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChatsViewModel _$ChatsViewModelFromJson(Map<String, dynamic> json) =>
    ChatsViewModel(
      id: json['id'] as String?,
      topic: json['topic'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$ChatsViewModelToJson(ChatsViewModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'topic': instance.topic,
      'created_at': instance.createdAt.toIso8601String(),
    };
