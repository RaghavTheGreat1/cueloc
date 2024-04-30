import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_permissions.freezed.dart';

@Freezed()
class AppPermissions with _$AppPermissions {
  const factory AppPermissions({
    required bool isBatteryOptimizationDisabled,
    required bool isLocationServicesEnabled,
    required bool isLocationGranted,
    required bool isAlwaysOnLocationGranted,
    required bool isAppNotificationsAllowed,
  }) = _AppPermissions;

  factory AppPermissions.raw() {
    return const AppPermissions(
      isBatteryOptimizationDisabled: false,
      isLocationServicesEnabled: false,
      isLocationGranted: false,
      isAlwaysOnLocationGranted: false,
      isAppNotificationsAllowed: false,
    );
  }
}
