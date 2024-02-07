import 'package:ai_project/app.dart';
import 'package:ai_project/infrastructure/db/db.dart';
import 'package:ai_project/infrastructure/services/db_service.dart';
import 'package:ai_project/infrastructure/services/log_service.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final dbService = await DBService.create();
  final db = await DB.create("chats");
  final messagesDB = await MessagesDB.create("messages");
  LogService.create;

  runApp(App(
    dbService: dbService,
    db: db,
    messagesDB: messagesDB,
  ));
}
