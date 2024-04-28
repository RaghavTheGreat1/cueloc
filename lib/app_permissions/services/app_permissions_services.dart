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

  Future<bool> requestLocationAlwaysOnService() async {
    final status = await permission_handler.Permission.locationAlways.request();

    return status.isGranted;
  }

  Future<bool> requestLocationService() async {
    final status = await permission_handler.Permission.location.request();

    return status.isGranted;
  }

  /// Requests permissions based on the current state of location status which includes both permission & service status.
  /// Requests for granting permissions when permissions is false. Requests for enabling service when service status is false.
  Future<bool> requestLocationServices() async {
    final isPermissionGranted = await requestLocationAlwaysOnService();
    final isEnabled = await requestLocationService();
    final isGpsServiceEnable = (isPermissionGranted && isEnabled);

    return isGpsServiceEnable;
  }
}
