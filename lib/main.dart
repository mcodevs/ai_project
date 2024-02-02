import 'package:ai_project/app.dart';
import 'package:ai_project/infrastructure/services/db_service.dart';
import 'package:ai_project/infrastructure/services/log_service.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final dbService = await DBService.create();
  LogService.create;

  runApp(
    App(dbService: dbService),
  );
}
