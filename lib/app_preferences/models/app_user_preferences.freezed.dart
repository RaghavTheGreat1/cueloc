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

/// @nodoc
mixin _$AppUserPreferences {
  ThemeMode get themeMode => throw _privateConstructorUsedError;
  Locale get locale => throw _privateConstructorUsedError;

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
  $Res call({ThemeMode themeMode, Locale locale});
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
  $Res call({ThemeMode themeMode, Locale locale});
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
    ));
  }
}

/// @nodoc

class _$AppUserPreferencesImpl implements _AppUserPreferences {
  const _$AppUserPreferencesImpl(
      {required this.themeMode, required this.locale});

  @override
  final ThemeMode themeMode;
  @override
  final Locale locale;

  @override
  String toString() {
    return 'AppUserPreferences(themeMode: $themeMode, locale: $locale)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppUserPreferencesImpl &&
            (identical(other.themeMode, themeMode) ||
                other.themeMode == themeMode) &&
            (identical(other.locale, locale) || other.locale == locale));
  }

  @override
  int get hashCode => Object.hash(runtimeType, themeMode, locale);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AppUserPreferencesImplCopyWith<_$AppUserPreferencesImpl> get copyWith =>
      __$$AppUserPreferencesImplCopyWithImpl<_$AppUserPreferencesImpl>(
          this, _$identity);
}

abstract class _AppUserPreferences implements AppUserPreferences {
  const factory _AppUserPreferences(
      {required final ThemeMode themeMode,
      required final Locale locale}) = _$AppUserPreferencesImpl;

  @override
  ThemeMode get themeMode;
  @override
  Locale get locale;
  @override
  @JsonKey(ignore: true)
  _$$AppUserPreferencesImplCopyWith<_$AppUserPreferencesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
