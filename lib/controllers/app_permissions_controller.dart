import 'package:geolocator/geolocator.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:notification_permissions/notification_permissions.dart'
    as notification_permissions;
import 'package:permission_handler/permission_handler.dart'
    as permission_handler;

import '../models/app_permissions.dart';
import '../providers/location_stream_provider.dart';

final locationPermissionsProvider = StreamProvider<bool>((ref) async* {
  await for (final locationStream in Geolocator.getServiceStatusStream()) {
    if (locationStream == ServiceStatus.enabled) {
      yield true;
    } else {
      yield false;
    }
  }
});

final appPermissionsControllerProvider =
    StateNotifierProvider<AppPermissionsController, AppPermissions>((ref) {
  final geolocator = ref.watch(locationStreamProvider);
  final locationPermissions = ref.watch(locationPermissionsProvider);
  return AppPermissionsController(
    initialPermissions: AppPermissions.raw().copyWith(
      isGpsEnabled: locationPermissions.value ?? false,
    ),
  );
});

final class AppPermissionsController extends StateNotifier<AppPermissions> {
  AppPermissionsController({
    required this.initialPermissions,
  }) : super(initialPermissions);

  final AppPermissions initialPermissions;

  Future<void> checkPerimssions() async {
    await isBatteryOptimizationDisabled();
    await isLocationServicesEnabled();
    await isNotificationServiceEnabled();
  }

  Future<void> requestPerimssions() async {
    await requestDisableBatteryOptimization();

    await requestNotificationService();

    await requestLocationServices();
  }

  Future<void> isBatteryOptimizationDisabled() async {
    final isDisabled = await permission_handler
        .Permission.ignoreBatteryOptimizations.isGranted;
    state = state.copyWith(isBatteryOptimizationDisabled: isDisabled);
  }

  Future<void> requestDisableBatteryOptimization() async {
    await permission_handler.Permission.ignoreBatteryOptimizations.request();
    final isGranted = await permission_handler
        .Permission.ignoreBatteryOptimizations.isGranted;
    state = state.copyWith(isBatteryOptimizationDisabled: isGranted);
  }

  Future<void> isNotificationServiceEnabled() async {
    bool isEnabled = await permission_handler.Permission.notification.isGranted;

    state = state.copyWith(isAppNotificationsAllowed: isEnabled);
  }

  Future<void> requestNotificationService() async {
    await notification_permissions.NotificationPermissions
        .requestNotificationPermissions();
    final isEnabled =
        await permission_handler.Permission.notification.isGranted;

    state = state.copyWith(isAppNotificationsAllowed: isEnabled);
  }

  Future<void> isLocationServicesEnabled() async {
    final permission = await Geolocator.checkPermission();
    final isGranted = permission != LocationPermission.always ? false : true;
    final isEnabled = await Geolocator.isLocationServiceEnabled();

    state = state.copyWith(
      isGpsEnabled: (isEnabled && isGranted),
    );
  }

  /// Requests permissions based on the current state of location status which includes both permission & service status.
  /// Requests for granting permissions when permissions is false. Requests for enabling service when service status is false.
  Future<void> requestLocationServices() async {
    await isLocationServicesEnabled();
    if (state.isGpsEnabled) {
      return;
    }
    await permission_handler.Permission.locationAlways.request();
    final isPermissionGranted =
        await permission_handler.Permission.locationAlways.isGranted;
    await permission_handler.Permission.location.request();
    final isEnabled = await permission_handler.Permission.location.isGranted;
    final isGpsServiceEnable = (isPermissionGranted && isEnabled);
    state = state.copyWith(isGpsEnabled: isGpsServiceEnable);
  }

  bool areAllServicesActive() {
    if (state.isAppNotificationsAllowed &&
        state.isBatteryOptimizationDisabled &&
        state.isGpsEnabled) {
      return true;
    } else {
      return false;
    }
  }
}
