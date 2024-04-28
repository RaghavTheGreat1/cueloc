import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_user_preferences.freezed.dart';

@Freezed()
class AppUserPreferences with _$AppUserPreferences {
  const factory AppUserPreferences({
    required ThemeMode themeMode,
    required Locale locale,
  }) = _AppUserPreferences;
}
