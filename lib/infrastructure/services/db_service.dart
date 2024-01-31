import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class DBService {
  /// Database nomi
  static const String _boxName = "database";
  static const String _theme = "theme";

  /// Asosiy box
  final Box _box;

  ///  Yaratish constructorida box yaratadi
  const DBService._(this._box);

  /// Create db service
  static Future<DBService> create() async {
    await Hive.initFlutter();
    final box = await Hive.openBox(_boxName);
    return DBService._(box);
  }

  /// Get theme
  ThemeMode get getTheme {
    final themeIndex = _box.get(_theme) as bool?;
    return switch (themeIndex) {
      true => ThemeMode.light,
      false => ThemeMode.dark,
      _ => ThemeMode.system,
    };
  }

  /// Set theme
  Future<void> setTheme(ThemeMode theme) async {
    await _box.put(
      _theme,
      switch (theme) {
        ThemeMode.light => true,
        ThemeMode.dark => false,
        ThemeMode.system => null,
      },
    );
  }
}
