import 'package:flutter/material.dart';

extension ThemeModeExtension on ThemeMode {
  static ThemeMode themeModeFromName(String name) {
    ThemeMode themeMode;
    switch (name) {
      case 'system':
        themeMode = ThemeMode.system;
        break;
      case 'light':
        themeMode = ThemeMode.light;
        break;
      case 'dark':
        themeMode = ThemeMode.dark;
        break;
      default:
        themeMode = ThemeMode.system;
    }
    return themeMode;
  }
}
