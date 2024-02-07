import 'package:ai_project/domain/chat_db/i_chat_db_facade.dart';
import 'package:ai_project/infrastructure/models/chats_view/chats_view_model.dart';

class ChatDBRepository implements IChatDBFacade {

  @override
  Future<List<ChatsViewModel>> getChats() {
    throw UnimplementedError();
  }
}
