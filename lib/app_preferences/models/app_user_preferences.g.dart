// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_user_preferences.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AppUserPreferencesImpl _$$AppUserPreferencesImplFromJson(
        Map<String, dynamic> json) =>
    _$AppUserPreferencesImpl(
      isFirstTime: json['isFirstTime'] as bool,
      themeMode:
          const ThemeModeJsonConverter().fromJson(json['themeMode'] as String),
      locale: const LocaleJsonConverter().fromJson(json['locale'] as String),
      locationAccuracy: const LocationAccuracyJsonConverter()
          .fromJson(json['locationAccuracy'] as String),
      alarmVolume: (json['alarmVolume'] as num).toDouble(),
      alarmMediaPath: json['alarmMediaPath'] as String,
      vibrateOnAlarm: json['vibrateOnAlarm'] as bool,
    );

Map<String, dynamic> _$$AppUserPreferencesImplToJson(
        _$AppUserPreferencesImpl instance) =>
    <String, dynamic>{
      'isFirstTime': instance.isFirstTime,
      'themeMode': const ThemeModeJsonConverter().toJson(instance.themeMode),
      'locale': const LocaleJsonConverter().toJson(instance.locale),
      'locationAccuracy': const LocationAccuracyJsonConverter()
          .toJson(instance.locationAccuracy),
      'alarmVolume': instance.alarmVolume,
      'alarmMediaPath': instance.alarmMediaPath,
      'vibrateOnAlarm': instance.vibrateOnAlarm,
    };
