import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:geolocator/geolocator.dart';

part 'app_user_preferences.freezed.dart';

@Freezed()
class AppUserPreferences with _$AppUserPreferences {
  const factory AppUserPreferences({
    required ThemeMode themeMode,
    required Locale locale,
    required LocationAccuracy locationAccuracy,
  }) = _AppUserPreferences;
}
