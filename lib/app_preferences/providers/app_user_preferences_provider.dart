import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
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

  @override
  Future<AppUserPreferences> build() async {
    final themeMode = ThemeModeExtension.themeModeFromName(
        await _storage.read(key: _themeModeKey) ?? ThemeMode.system.name);

    final locale = Locale.fromSubtags(
        languageCode: (await _storage.read(key: _localeKey)) ?? 'en');
    return AppUserPreferences(
      themeMode: themeMode,
      locale: locale,
    );
  }

  Future<void> updateThemeMode(ThemeMode mode) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      await _storage.write(key: 'theme', value: mode.name);
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
      await _storage.write(key: 'locale', value: locale.toLanguageTag());
      return state.requireValue.copyWith(locale: locale);
    });
  }

  Future<void> reset() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      await _storage.write(key: 'theme', value: ThemeMode.system.name);
      await _storage.write(
          key: 'locale', value: const Locale('en').toLanguageTag());

      return const AppUserPreferences(
        themeMode: ThemeMode.light,
        locale: Locale('en'),
      );
    });
  }
}
