import 'package:ai_project/infrastructure/models/chat/chat_model.dart';
import 'package:ai_project/infrastructure/models/chats_view/chats_view_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uuid/uuid.dart';

abstract class IChatDBFacade {
  Future<List<ChatsViewModel>> getChats();
}
