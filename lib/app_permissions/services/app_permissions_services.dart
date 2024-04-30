import 'package:permission_handler/permission_handler.dart'
    as permission_handler;

class AppPermissionsServices {
  Future<bool> isBatteryOptimizationDisabled() async {
    final status =
        await permission_handler.Permission.ignoreBatteryOptimizations.status;

    return status.isGranted;
  }

  Future<bool> isNotificationServiceEnabled() async {
    final status = await permission_handler.Permission.notification.status;

    return status.isGranted;
  }

  Future<bool> isLocationServicesEnabled() async {
    final alwaysOn = await permission_handler.Permission.locationAlways.status;

    final location = await permission_handler.Permission.location.status;

    return alwaysOn.isGranted && location.isGranted;
  }

  Future<bool> isLocationPermissionGranted() async {
    final status = await permission_handler.Permission.location.status;

    return status.isGranted;
  }

  Future<bool> isAlwaysOnLocationGranted() async {
    final status = await permission_handler.Permission.locationAlways.status;

    return status.isGranted;
  }

  Future<bool> disableBatteryOptimization() async {
    final status = await permission_handler
        .Permission.ignoreBatteryOptimizations
        .request();

    return status.isGranted;
  }

  Future<bool> requestNotificationService() async {
    final status = await permission_handler.Permission.notification.request();

    return status.isGranted;
  }

  Future<bool> requestLocationPermission() async {
    final initialStatus = await permission_handler.Permission.location.status;
    if (initialStatus.isPermanentlyDenied) {
      await permission_handler.openAppSettings();
      return false;
    }

    final status = await permission_handler.Permission.location.request();
    return status.isGranted;
  }

  Future<bool> requestLocationAlwaysOnService() async {
    final initialStatus =
        await permission_handler.Permission.locationAlways.status;

    if (initialStatus.isPermanentlyDenied) {
      await permission_handler.openAppSettings();
      return false;
    }
    try {
      final status = await permission_handler.Permission.locationAlways
          .request()
          .timeout(const Duration(seconds: 5));
      return status.isGranted;
    } catch (e) {
      final status = await permission_handler.Permission.locationAlways.status;

      return status.isGranted;
    }
  }

  /// Requests permissions based on the current state of location status which includes both permission & service status.
  /// Requests for granting permissions when permissions is false. Requests for enabling service when service status is false.
  Future<bool> requestLocationServices() async {
    final isPermissionGranted = await requestLocationAlwaysOnService();
    final isEnabled = await requestLocationPermission();
    final isGpsServiceEnable = (isPermissionGranted && isEnabled);

    return isGpsServiceEnable;
  }
}
