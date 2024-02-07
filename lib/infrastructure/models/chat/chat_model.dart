import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:uuid/uuid.dart';

part 'chat_model.g.dart';

@JsonEnum()
enum Role {
  user,
  model;
}

@JsonSerializable(fieldRename: FieldRename.snake)
class ChatModel {
  final String id;
  final String chatId;
  final String text;
  final Role role;
  final DateTime sendTime;

  static const _uuid = Uuid();

  ChatModel({
    String? id,
    required this.chatId,
    required this.text,
    required this.role,
    DateTime? sendTime,
  })  : id = id ?? _uuid.v4(),
        sendTime = sendTime ?? DateTime.now();

  factory ChatModel.fromContent(Content content, String chatId) {
    return ChatModel(
      text: content.parts?.map((e) => e).join() ?? "",
      role: $enumDecode(_$RoleEnumMap, content.role),
      chatId: chatId,
    );
  }

  Content toContent() {
    return Content(
      parts: [Parts(text: text)],
      role: _$RoleEnumMap[role],
    );
  }

  factory ChatModel.fromJson(Map<String, dynamic> json) =>
      _$ChatModelFromJson(json);

  Map<String, dynamic> toJson() => _$ChatModelToJson(this);
}
