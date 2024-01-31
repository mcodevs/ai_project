import 'package:ai_project/presentation/splash/splash_page.dart';
import 'package:flutter/material.dart';

abstract final class Routes {
  static PageRoute getSplashPage() {
    return MaterialPageRoute(
      builder: (context) => const SplashPage(),
    );
  }
}
