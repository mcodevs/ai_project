import 'package:ai_project/application/auth/auth_bloc.dart';
import 'package:ai_project/infrastructure/db/db.dart';
import 'package:ai_project/infrastructure/services/db_service.dart';
import 'package:ai_project/presentation/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatelessWidget {
  const App({
    required this.dbService,
    required this.db,
    required this.messagesDB,
    super.key,
  });

  final DB db;
  final MessagesDB messagesDB;
  final DBService dbService;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider.value(
          value: dbService,
        ),
        RepositoryProvider.value(
          value: messagesDB,
        ),
        RepositoryProvider.value(
          value: db,
        ),
      ],
      child: BlocProvider(
        create: (context) => AuthBloc(),
        child: MaterialApp(
          title: "AI Project",
          themeMode: dbService.getTheme,
          theme: ThemeData.light(),
          darkTheme: ThemeData.dark(),
          onGenerateRoute: (settings) => Routes.getSplashPage(),
        ),
      ),
    );
  }
}
