// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChatModel _$ChatModelFromJson(Map<String, dynamic> json) => ChatModel(
      id: json['id'] as String?,
      chatId: json['chat_id'] as String,
      text: json['text'] as String,
      role: $enumDecode(_$RoleEnumMap, json['role']),
      sendTime: json['send_time'] == null
          ? null
          : DateTime.parse(json['send_time'] as String),
    );

Map<String, dynamic> _$ChatModelToJson(ChatModel instance) => <String, dynamic>{
      'id': instance.id,
      'chat_id': instance.chatId,
      'text': instance.text,
      'role': _$RoleEnumMap[instance.role]!,
      'send_time': instance.sendTime.toIso8601String(),
    };

const _$RoleEnumMap = {
  Role.user: 'user',
  Role.model: 'model',
};
