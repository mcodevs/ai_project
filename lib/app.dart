import 'package:ai_project/infrastructure/services/db_service.dart';
import 'package:ai_project/presentation/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatelessWidget {
  const App({
    required this.dbService,
    super.key,
  });

  final DBService dbService;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: dbService,
      child: MaterialApp(
        // debugShowCheckedModeBanner: false,
        title: "AI Project",
        themeMode: dbService.getTheme,
        theme: ThemeData.light(),
        darkTheme: ThemeData.dark(),
        onGenerateRoute: (settings) => Routes.getSplashPage(),
      ),
    );
  }
}
