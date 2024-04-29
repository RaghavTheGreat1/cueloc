// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_user_preferences.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AppUserPreferences _$AppUserPreferencesFromJson(Map<String, dynamic> json) {
  return _AppUserPreferences.fromJson(json);
}

/// @nodoc
mixin _$AppUserPreferences {
  @ThemeModeJsonConverter()
  ThemeMode get themeMode => throw _privateConstructorUsedError;
  @LocaleJsonConverter()
  Locale get locale => throw _privateConstructorUsedError;
  @LocationAccuracyJsonConverter()
  LocationAccuracy get locationAccuracy => throw _privateConstructorUsedError;
  double get alarmVolume => throw _privateConstructorUsedError;
  String get alarmMediaPath => throw _privateConstructorUsedError;
  bool get vibrateOnAlarm => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AppUserPreferencesCopyWith<AppUserPreferences> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppUserPreferencesCopyWith<$Res> {
  factory $AppUserPreferencesCopyWith(
          AppUserPreferences value, $Res Function(AppUserPreferences) then) =
      _$AppUserPreferencesCopyWithImpl<$Res, AppUserPreferences>;
  @useResult
  $Res call(
      {@ThemeModeJsonConverter() ThemeMode themeMode,
      @LocaleJsonConverter() Locale locale,
      @LocationAccuracyJsonConverter() LocationAccuracy locationAccuracy,
      double alarmVolume,
      String alarmMediaPath,
      bool vibrateOnAlarm});
}

/// @nodoc
class _$AppUserPreferencesCopyWithImpl<$Res, $Val extends AppUserPreferences>
    implements $AppUserPreferencesCopyWith<$Res> {
  _$AppUserPreferencesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? themeMode = null,
    Object? locale = null,
    Object? locationAccuracy = null,
    Object? alarmVolume = null,
    Object? alarmMediaPath = null,
    Object? vibrateOnAlarm = null,
  }) {
    return _then(_value.copyWith(
      themeMode: null == themeMode
          ? _value.themeMode
          : themeMode // ignore: cast_nullable_to_non_nullable
              as ThemeMode,
      locale: null == locale
          ? _value.locale
          : locale // ignore: cast_nullable_to_non_nullable
              as Locale,
      locationAccuracy: null == locationAccuracy
          ? _value.locationAccuracy
          : locationAccuracy // ignore: cast_nullable_to_non_nullable
              as LocationAccuracy,
      alarmVolume: null == alarmVolume
          ? _value.alarmVolume
          : alarmVolume // ignore: cast_nullable_to_non_nullable
              as double,
      alarmMediaPath: null == alarmMediaPath
          ? _value.alarmMediaPath
          : alarmMediaPath // ignore: cast_nullable_to_non_nullable
              as String,
      vibrateOnAlarm: null == vibrateOnAlarm
          ? _value.vibrateOnAlarm
          : vibrateOnAlarm // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AppUserPreferencesImplCopyWith<$Res>
    implements $AppUserPreferencesCopyWith<$Res> {
  factory _$$AppUserPreferencesImplCopyWith(_$AppUserPreferencesImpl value,
          $Res Function(_$AppUserPreferencesImpl) then) =
      __$$AppUserPreferencesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@ThemeModeJsonConverter() ThemeMode themeMode,
      @LocaleJsonConverter() Locale locale,
      @LocationAccuracyJsonConverter() LocationAccuracy locationAccuracy,
      double alarmVolume,
      String alarmMediaPath,
      bool vibrateOnAlarm});
}

/// @nodoc
class __$$AppUserPreferencesImplCopyWithImpl<$Res>
    extends _$AppUserPreferencesCopyWithImpl<$Res, _$AppUserPreferencesImpl>
    implements _$$AppUserPreferencesImplCopyWith<$Res> {
  __$$AppUserPreferencesImplCopyWithImpl(_$AppUserPreferencesImpl _value,
      $Res Function(_$AppUserPreferencesImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? themeMode = null,
    Object? locale = null,
    Object? locationAccuracy = null,
    Object? alarmVolume = null,
    Object? alarmMediaPath = null,
    Object? vibrateOnAlarm = null,
  }) {
    return _then(_$AppUserPreferencesImpl(
      themeMode: null == themeMode
          ? _value.themeMode
          : themeMode // ignore: cast_nullable_to_non_nullable
              as ThemeMode,
      locale: null == locale
          ? _value.locale
          : locale // ignore: cast_nullable_to_non_nullable
              as Locale,
      locationAccuracy: null == locationAccuracy
          ? _value.locationAccuracy
          : locationAccuracy // ignore: cast_nullable_to_non_nullable
              as LocationAccuracy,
      alarmVolume: null == alarmVolume
          ? _value.alarmVolume
          : alarmVolume // ignore: cast_nullable_to_non_nullable
              as double,
      alarmMediaPath: null == alarmMediaPath
          ? _value.alarmMediaPath
          : alarmMediaPath // ignore: cast_nullable_to_non_nullable
              as String,
      vibrateOnAlarm: null == vibrateOnAlarm
          ? _value.vibrateOnAlarm
          : vibrateOnAlarm // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AppUserPreferencesImpl extends _AppUserPreferences {
  _$AppUserPreferencesImpl(
      {@ThemeModeJsonConverter() required this.themeMode,
      @LocaleJsonConverter() required this.locale,
      @LocationAccuracyJsonConverter() required this.locationAccuracy,
      required this.alarmVolume,
      required this.alarmMediaPath,
      required this.vibrateOnAlarm})
      : super._();

  factory _$AppUserPreferencesImpl.fromJson(Map<String, dynamic> json) =>
      _$$AppUserPreferencesImplFromJson(json);

  @override
  @ThemeModeJsonConverter()
  final ThemeMode themeMode;
  @override
  @LocaleJsonConverter()
  final Locale locale;
  @override
  @LocationAccuracyJsonConverter()
  final LocationAccuracy locationAccuracy;
  @override
  final double alarmVolume;
  @override
  final String alarmMediaPath;
  @override
  final bool vibrateOnAlarm;

  @override
  String toString() {
    return 'AppUserPreferences(themeMode: $themeMode, locale: $locale, locationAccuracy: $locationAccuracy, alarmVolume: $alarmVolume, alarmMediaPath: $alarmMediaPath, vibrateOnAlarm: $vibrateOnAlarm)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppUserPreferencesImpl &&
            (identical(other.themeMode, themeMode) ||
                other.themeMode == themeMode) &&
            (identical(other.locale, locale) || other.locale == locale) &&
            (identical(other.locationAccuracy, locationAccuracy) ||
                other.locationAccuracy == locationAccuracy) &&
            (identical(other.alarmVolume, alarmVolume) ||
                other.alarmVolume == alarmVolume) &&
            (identical(other.alarmMediaPath, alarmMediaPath) ||
                other.alarmMediaPath == alarmMediaPath) &&
            (identical(other.vibrateOnAlarm, vibrateOnAlarm) ||
                other.vibrateOnAlarm == vibrateOnAlarm));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, themeMode, locale,
      locationAccuracy, alarmVolume, alarmMediaPath, vibrateOnAlarm);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AppUserPreferencesImplCopyWith<_$AppUserPreferencesImpl> get copyWith =>
      __$$AppUserPreferencesImplCopyWithImpl<_$AppUserPreferencesImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AppUserPreferencesImplToJson(
      this,
    );
  }
}

abstract class _AppUserPreferences extends AppUserPreferences {
  factory _AppUserPreferences(
      {@ThemeModeJsonConverter() required final ThemeMode themeMode,
      @LocaleJsonConverter() required final Locale locale,
      @LocationAccuracyJsonConverter()
      required final LocationAccuracy locationAccuracy,
      required final double alarmVolume,
      required final String alarmMediaPath,
      required final bool vibrateOnAlarm}) = _$AppUserPreferencesImpl;
  _AppUserPreferences._() : super._();

  factory _AppUserPreferences.fromJson(Map<String, dynamic> json) =
      _$AppUserPreferencesImpl.fromJson;

  @override
  @ThemeModeJsonConverter()
  ThemeMode get themeMode;
  @override
  @LocaleJsonConverter()
  Locale get locale;
  @override
  @LocationAccuracyJsonConverter()
  LocationAccuracy get locationAccuracy;
  @override
  double get alarmVolume;
  @override
  String get alarmMediaPath;
  @override
  bool get vibrateOnAlarm;
  @override
  @JsonKey(ignore: true)
  _$$AppUserPreferencesImplCopyWith<_$AppUserPreferencesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
