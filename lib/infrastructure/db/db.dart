import 'package:ai_project/infrastructure/models/chat/chat_model.dart';
import 'package:ai_project/infrastructure/models/chats_view/chats_view_model.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

abstract class DBFacade {
  Future<void> dispose();
  Future<List<ChatsViewModel>> getChats();
  Future<void> addToChats(ChatsViewModel newChat);
}

class DB implements DBFacade {
  const DB._(this._database, this.table);

  final String table;
  final Database _database;

  static Future<DB> create(String table) async {
    final documentPath = await getApplicationDocumentsDirectory();
    final database = await openDatabase(
      "${documentPath.path}/$table.db",
      onCreate: (db, version) async {
        await db.execute(
          'CREATE TABLE $table ('
          '"id"	TEXT NOT NULL UNIQUE,'
          '"topic"	TEXT NOT NULL DEFAULT \'New Chat\','
          '"created_at"	TEXT NOT NULL,'
          'PRIMARY KEY("id")'
          ')',
        );
      },
      version: 1,
    );
    return DB._(database, table);
  }

  @override
  Future<void> dispose() => _database.close();

  @override
  Future<List<ChatsViewModel>> getChats() async {
    final data = await _database.query(table, orderBy: "created_at DESC");
    return data.map(ChatsViewModel.fromJson).toList();
  }

  @override
  Future<void> addToChats(ChatsViewModel newChat) async {
    await _database.insert(table, newChat.toJson());
  }
}

abstract class IMessageDBFacade {
  Future<List<ChatModel>> getMessages(String id);
  Future<void> addToMessages(ChatModel message);
}

class MessagesDB implements IMessageDBFacade {
  final Database _database;
  final String table;

  const MessagesDB._(this._database, this.table);

  static Future<MessagesDB> create(String table) async {
    final documentPath = await getApplicationDocumentsDirectory();
    // await deleteDatabase("${documentPath.path}/message/$table.db");
    final database = await openDatabase(
      "${documentPath.path}/message/$table.db",
      onCreate: (db, version) async {
        await db.execute("""CREATE TABLE $table (
	"id"	TEXT NOT NULL UNIQUE,
	"chat_id"	TEXT NOT NULL,
	"role"	TEXT NOT NULL,
	"text"	TEXT NOT NULL,
	"send_time"	TEXT NOT NULL,
	PRIMARY KEY("id")
)""");
      },
      version: 1,
    );
    return MessagesDB._(database, table);
  }

  @override
  Future<void> addToMessages(ChatModel message) async {
    await _database.insert(table, message.toJson());
  }

  @override
  Future<List<ChatModel>> getMessages(String id) async {
    final data = await _database.query(table,
        where: "chat_id = ?", whereArgs: [id], orderBy: "send_time ASC");
    return data.map(ChatModel.fromJson).toList();
  }
}
