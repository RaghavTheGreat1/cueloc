import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:geolocator/geolocator.dart';

import '../../gen/assets.gen.dart';
import '../../themes/theme_mode_extension.dart';

part 'app_user_preferences.freezed.dart';
part 'app_user_preferences.g.dart';

@Freezed()
class AppUserPreferences with _$AppUserPreferences {
  AppUserPreferences._();

  factory AppUserPreferences({
    @ThemeModeJsonConverter() required ThemeMode themeMode,
    @LocaleJsonConverter() required Locale locale,
    @LocationAccuracyJsonConverter() required LocationAccuracy locationAccuracy,
    required double alarmVolume,
    required String alarmMediaPath,
    required bool vibrateOnAlarm,
  }) = _AppUserPreferences;

  factory AppUserPreferences.fromJson(Map<String, dynamic> json) =>
      _$AppUserPreferencesFromJson(json);

  factory AppUserPreferences.raw() {
    return AppUserPreferences(
      themeMode: ThemeMode.system,
      locale: const Locale('en'),
      locationAccuracy: LocationAccuracy.low,
      alarmVolume: 7.0,
      alarmMediaPath: Assets.alarmSounds.morning,
      vibrateOnAlarm: true,
    );
  }

  factory AppUserPreferences.fromString(String jsonString) {
    final json = jsonDecode(jsonString) as Map<String, dynamic>;
    return AppUserPreferences.fromJson(json);
  }
}

class ThemeModeJsonConverter extends JsonConverter<ThemeMode, String> {
  const ThemeModeJsonConverter();

  @override
  ThemeMode fromJson(String json) {
    return ThemeModeExtension.themeModeFromName(json);
  }

  @override
  String toJson(ThemeMode object) {
    return object.name;
  }
}

class LocaleJsonConverter extends JsonConverter<Locale, String> {
  const LocaleJsonConverter();

  @override
  Locale fromJson(String json) {
    final split = json.split('_');
    return Locale(
      split[0],
      split.length > 1 ? split[1] : '',
    );
  }

  @override
  String toJson(Locale object) {
    return object.toString();
  }
}

class LocationAccuracyJsonConverter
    extends JsonConverter<LocationAccuracy, String> {
  const LocationAccuracyJsonConverter();

  @override
  LocationAccuracy fromJson(String json) {
    return LocationAccuracy.values
        .firstWhere((element) => element.name == json);
  }

  @override
  String toJson(LocationAccuracy object) {
    return object.name;
  }
}
