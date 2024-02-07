import 'package:json_annotation/json_annotation.dart';
import 'package:uuid/uuid.dart';

part 'chats_view_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class ChatsViewModel {
  final String id;
  final String topic;
  final DateTime createdAt;

  static const _uuid = Uuid();

  ChatsViewModel({
    String? id,
    required this.topic,
    required this.createdAt,
  }) : id = id ?? _uuid.v4();

  factory ChatsViewModel.fromJson(Map<String, dynamic> json) =>
      _$ChatsViewModelFromJson(json);

  Map<String, dynamic> toJson() => _$ChatsViewModelToJson(this);
}
