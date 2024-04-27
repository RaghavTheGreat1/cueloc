// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_permissions.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AppPermissions {
  bool get isBatteryOptimizationDisabled => throw _privateConstructorUsedError;
  bool get isGpsEnabled => throw _privateConstructorUsedError;
  bool get isAppNotificationsAllowed => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AppPermissionsCopyWith<AppPermissions> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppPermissionsCopyWith<$Res> {
  factory $AppPermissionsCopyWith(
          AppPermissions value, $Res Function(AppPermissions) then) =
      _$AppPermissionsCopyWithImpl<$Res, AppPermissions>;
  @useResult
  $Res call(
      {bool isBatteryOptimizationDisabled,
      bool isGpsEnabled,
      bool isAppNotificationsAllowed});
}

/// @nodoc
class _$AppPermissionsCopyWithImpl<$Res, $Val extends AppPermissions>
    implements $AppPermissionsCopyWith<$Res> {
  _$AppPermissionsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isBatteryOptimizationDisabled = null,
    Object? isGpsEnabled = null,
    Object? isAppNotificationsAllowed = null,
  }) {
    return _then(_value.copyWith(
      isBatteryOptimizationDisabled: null == isBatteryOptimizationDisabled
          ? _value.isBatteryOptimizationDisabled
          : isBatteryOptimizationDisabled // ignore: cast_nullable_to_non_nullable
              as bool,
      isGpsEnabled: null == isGpsEnabled
          ? _value.isGpsEnabled
          : isGpsEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      isAppNotificationsAllowed: null == isAppNotificationsAllowed
          ? _value.isAppNotificationsAllowed
          : isAppNotificationsAllowed // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AppPermissionsImplCopyWith<$Res>
    implements $AppPermissionsCopyWith<$Res> {
  factory _$$AppPermissionsImplCopyWith(_$AppPermissionsImpl value,
          $Res Function(_$AppPermissionsImpl) then) =
      __$$AppPermissionsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isBatteryOptimizationDisabled,
      bool isGpsEnabled,
      bool isAppNotificationsAllowed});
}

/// @nodoc
class __$$AppPermissionsImplCopyWithImpl<$Res>
    extends _$AppPermissionsCopyWithImpl<$Res, _$AppPermissionsImpl>
    implements _$$AppPermissionsImplCopyWith<$Res> {
  __$$AppPermissionsImplCopyWithImpl(
      _$AppPermissionsImpl _value, $Res Function(_$AppPermissionsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isBatteryOptimizationDisabled = null,
    Object? isGpsEnabled = null,
    Object? isAppNotificationsAllowed = null,
  }) {
    return _then(_$AppPermissionsImpl(
      isBatteryOptimizationDisabled: null == isBatteryOptimizationDisabled
          ? _value.isBatteryOptimizationDisabled
          : isBatteryOptimizationDisabled // ignore: cast_nullable_to_non_nullable
              as bool,
      isGpsEnabled: null == isGpsEnabled
          ? _value.isGpsEnabled
          : isGpsEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      isAppNotificationsAllowed: null == isAppNotificationsAllowed
          ? _value.isAppNotificationsAllowed
          : isAppNotificationsAllowed // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$AppPermissionsImpl implements _AppPermissions {
  const _$AppPermissionsImpl(
      {required this.isBatteryOptimizationDisabled,
      required this.isGpsEnabled,
      required this.isAppNotificationsAllowed});

  @override
  final bool isBatteryOptimizationDisabled;
  @override
  final bool isGpsEnabled;
  @override
  final bool isAppNotificationsAllowed;

  @override
  String toString() {
    return 'AppPermissions(isBatteryOptimizationDisabled: $isBatteryOptimizationDisabled, isGpsEnabled: $isGpsEnabled, isAppNotificationsAllowed: $isAppNotificationsAllowed)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppPermissionsImpl &&
            (identical(other.isBatteryOptimizationDisabled,
                    isBatteryOptimizationDisabled) ||
                other.isBatteryOptimizationDisabled ==
                    isBatteryOptimizationDisabled) &&
            (identical(other.isGpsEnabled, isGpsEnabled) ||
                other.isGpsEnabled == isGpsEnabled) &&
            (identical(other.isAppNotificationsAllowed,
                    isAppNotificationsAllowed) ||
                other.isAppNotificationsAllowed == isAppNotificationsAllowed));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isBatteryOptimizationDisabled,
      isGpsEnabled, isAppNotificationsAllowed);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AppPermissionsImplCopyWith<_$AppPermissionsImpl> get copyWith =>
      __$$AppPermissionsImplCopyWithImpl<_$AppPermissionsImpl>(
          this, _$identity);
}

abstract class _AppPermissions implements AppPermissions {
  const factory _AppPermissions(
      {required final bool isBatteryOptimizationDisabled,
      required final bool isGpsEnabled,
      required final bool isAppNotificationsAllowed}) = _$AppPermissionsImpl;

  @override
  bool get isBatteryOptimizationDisabled;
  @override
  bool get isGpsEnabled;
  @override
  bool get isAppNotificationsAllowed;
  @override
  @JsonKey(ignore: true)
  _$$AppPermissionsImplCopyWith<_$AppPermissionsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
