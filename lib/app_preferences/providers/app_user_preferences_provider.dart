import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../providers/flutter_secure_storage_provider.dart';
import '../../themes/theme_mode_extension.dart';
import '../models/app_user_preferences.dart';

final appUserPreferencesProvider =
    AsyncNotifierProvider<AppUserPreferencesNotifier, AppUserPreferences>(
        AppUserPreferencesNotifier.new);

class AppUserPreferencesNotifier extends AsyncNotifier<AppUserPreferences> {
  FlutterSecureStorage get _storage => ref.watch(flutterSecureStorageProvider);

  final _themeModeKey = 'themeMode';
  final _localeKey = 'locale';
  final _locationAccuracyKey = 'locationAccuracy';

  @override
  Future<AppUserPreferences> build() async {
    final themeMode = ThemeModeExtension.themeModeFromName(
        await _storage.read(key: _themeModeKey) ?? ThemeMode.system.name);

    final locale = Locale.fromSubtags(
        languageCode: (await _storage.read(key: _localeKey)) ?? 'en');

    final locationAccuracyString =
        await _storage.read(key: _locationAccuracyKey) ??
            LocationAccuracy.low.name;
    final locationAccuracy = LocationAccuracy.values
        .firstWhere((element) => element.name == locationAccuracyString);

    return AppUserPreferences(
      themeMode: themeMode,
      locale: locale,
      locationAccuracy: locationAccuracy,
    );
  }

  Future<void> updateThemeMode(ThemeMode mode) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      await _storage.write(key: _themeModeKey, value: mode.name);
      return state.requireValue.copyWith(themeMode: mode);
    });
  }

  Future<void> updateNextTheme() async {
    final currentTheme = state.requireValue.themeMode;
    final nextThemeIndex =
        (ThemeMode.values.indexOf(currentTheme) + 1) % ThemeMode.values.length;
    final nextTheme = ThemeMode.values[nextThemeIndex];
    await updateThemeMode(nextTheme);
  }

  Future<void> updateLocale(Locale locale) async {
    state = await AsyncValue.guard(() async {
      await _storage.write(key: _localeKey, value: locale.toLanguageTag());
      return state.requireValue.copyWith(locale: locale);
    });
  }

  Future<void> updateLocationAccuracy(LocationAccuracy locationAccuracy) async {
    state = await AsyncValue.guard(() async {
      await _storage.write(
          key: _locationAccuracyKey, value: locationAccuracy.name);
      return state.requireValue.copyWith(locationAccuracy: locationAccuracy);
    });
  }

  Future<void> updateNextLocationAccuracy() async {
    final currentLocationAccuracy = state.requireValue.locationAccuracy;
    final nextLocationAccuracyIndex = (LocationAccuracy.values.indexOf(
                currentLocationAccuracy) +
            1) %
        LocationAccuracy.values.length;
    final nextLocationAccuracy = LocationAccuracy.values[nextLocationAccuracyIndex];
    await updateLocationAccuracy(nextLocationAccuracy);
  }

  Future<void> reset() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      await _storage.write(key: _themeModeKey, value: ThemeMode.system.name);
      await _storage.write(
          key: _localeKey, value: const Locale('en').toLanguageTag());
      await _storage.write(
          key: _locationAccuracyKey, value: LocationAccuracy.low.name);

      return const AppUserPreferences(
        themeMode: ThemeMode.light,
        locale: Locale('en'),
        locationAccuracy: LocationAccuracy.low,
      );
    });
  }
}
