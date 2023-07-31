import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_permissions.freezed.dart';

@Freezed()
class AppPermissions with _$AppPermissions {
  const factory AppPermissions({
    required bool isBatteryOptimizationDisabled,
    required bool isGpsEnabled,
    required bool isAppNotificationsAllowed,
  }) = _AppPermissions;

  factory AppPermissions.raw() {
    return const AppPermissions(
      isBatteryOptimizationDisabled: false,
      isGpsEnabled: false,
      isAppNotificationsAllowed: false,
    );
  }
}
