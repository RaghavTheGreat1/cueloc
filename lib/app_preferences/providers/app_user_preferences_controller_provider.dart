import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../providers/flutter_secure_storage_provider.dart';
import '../models/app_user_preferences.dart';

final appUserPreferencesProvider =
    AsyncNotifierProvider<AppUserPreferencesNotifier, AppUserPreferences>(
        AppUserPreferencesNotifier.new);

class AppUserPreferencesNotifier extends AsyncNotifier<AppUserPreferences> {
  FlutterSecureStorage get _storage => ref.watch(flutterSecureStorageProvider);

  final _appUserPrefsKey = 'appUserPreferences';

  @override
  Future<AppUserPreferences> build() async {
    final prefsString = await _storage.read(key: _appUserPrefsKey);
    if (prefsString != null) {
      return AppUserPreferences.fromString(prefsString);
    }

    return AppUserPreferences.raw();
  }

  Future<void> updateAppUserPreferences(AppUserPreferences newPrefs) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      await _storage.write(
          key: _appUserPrefsKey, value: jsonEncode(newPrefs.toJson()));
      return newPrefs;
    });
  }

  Future<void> updateThemeMode(ThemeMode mode) async {
    state = const AsyncLoading();

    final newAppPrefs = state.requireValue.copyWith(themeMode: mode);
    await updateAppUserPreferences(newAppPrefs);
  }

  Future<void> updateNextTheme() async {
    final currentTheme = state.requireValue.themeMode;
    final nextThemeIndex =
        (ThemeMode.values.indexOf(currentTheme) + 1) % ThemeMode.values.length;
    final nextTheme = ThemeMode.values[nextThemeIndex];
    await updateThemeMode(nextTheme);
  }

  Future<void> updateLocale(Locale locale) async {
    state = const AsyncLoading();

    final newAppPrefs = state.requireValue.copyWith(locale: locale);
    await updateAppUserPreferences(newAppPrefs);
  }

  Future<void> updateLocationAccuracy(LocationAccuracy locationAccuracy) async {
    state = const AsyncLoading();

    final newAppPrefs =
        state.requireValue.copyWith(locationAccuracy: locationAccuracy);
    await updateAppUserPreferences(newAppPrefs);
  }

  Future<void> updateNextLocationAccuracy() async {
    final currentLocationAccuracy = state.requireValue.locationAccuracy;
    final nextLocationAccuracyIndex =
        (LocationAccuracy.values.indexOf(currentLocationAccuracy) + 1) %
            LocationAccuracy.values.length;
    final nextLocationAccuracy =
        LocationAccuracy.values[nextLocationAccuracyIndex];
    await updateLocationAccuracy(nextLocationAccuracy);
  }

  Future<void> updateAlarmVolume(double volume) async {
    state = const AsyncLoading();

    final newAppPrefs = state.requireValue.copyWith(alarmVolume: volume);
    await updateAppUserPreferences(newAppPrefs);
  }

  Future<void> updateAlarmMediaPath(String mediaPath) async {
    state = const AsyncLoading();

    final newAppPrefs = state.requireValue.copyWith(alarmMediaPath: mediaPath);
    await updateAppUserPreferences(newAppPrefs);
  }

  Future<void> updateVibrateOnAlarm(bool vibrate) async {
    state = const AsyncLoading();
    final newAppPrefs = state.requireValue.copyWith(vibrateOnAlarm: vibrate);
    await updateAppUserPreferences(newAppPrefs);
  }

  Future<void> updateIsFirstTime(bool isFirstTime) async {
    state = const AsyncLoading();
    final newAppPrefs = state.requireValue.copyWith(isFirstTime: isFirstTime);
    await updateAppUserPreferences(newAppPrefs);
  }

  Future<void> reset() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final newAppPrefs = AppUserPreferences.raw();
      await _storage.write(
          key: _appUserPrefsKey, value: jsonEncode(newAppPrefs.toJson()));

      return newAppPrefs;
    });
  }
}
