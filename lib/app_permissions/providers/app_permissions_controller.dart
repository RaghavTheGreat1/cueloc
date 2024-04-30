import 'dart:async';

import 'package:geolocator/geolocator.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../models/app_permissions.dart';
import '../services/app_permissions_services.dart';

final appPermissionServicesProvider = Provider<AppPermissionsServices>((ref) {
  return AppPermissionsServices();
});

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
    AsyncNotifierProvider<AppPermissionsNotifier, AppPermissions>(
        AppPermissionsNotifier.new);

class AppPermissionsNotifier extends AsyncNotifier<AppPermissions> {
  AppPermissionsServices get _appPermissionsServices =>
      ref.watch(appPermissionServicesProvider);

  @override
  FutureOr<AppPermissions> build() async {
    final isNotificationServiceEnabled =
        await _appPermissionsServices.isNotificationServiceEnabled();
    final isBatteryOptimizationDisabled =
        await _appPermissionsServices.isBatteryOptimizationDisabled();
    final isLocationServicesEnabled =
        await _appPermissionsServices.isLocationServicesEnabled();
    final isLocationPermissionGranted =
        await _appPermissionsServices.isLocationPermissionGranted();
    final isAlwaysOnLocationAllowed =
        await _appPermissionsServices.isAlwaysOnLocationGranted();

    return AppPermissions(
      isAppNotificationsAllowed: isNotificationServiceEnabled,
      isBatteryOptimizationDisabled: isBatteryOptimizationDisabled,
      isLocationServicesEnabled: isLocationServicesEnabled,
      isLocationGranted: isLocationPermissionGranted,
      isAlwaysOnLocationGranted: isAlwaysOnLocationAllowed,
    );
  }

  Future<void> requestPerimssions() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final isNotificationServiceEnabled =
          await _appPermissionsServices.requestNotificationService();
      final isBatteryOptimizationDisabled =
          await _appPermissionsServices.disableBatteryOptimization();
      final isLocationServicesEnabled =
          await _appPermissionsServices.requestLocationAlwaysOnService();
      final isLocationPermissionGranted =
          await _appPermissionsServices.requestLocationPermission();
      final isAlwaysOnLocationAllowed =
          await _appPermissionsServices.requestLocationAlwaysOnService();
      return AppPermissions(
        isAppNotificationsAllowed: isNotificationServiceEnabled,
        isBatteryOptimizationDisabled: isBatteryOptimizationDisabled,
        isLocationServicesEnabled: isLocationServicesEnabled,
        isLocationGranted: isLocationPermissionGranted,
        isAlwaysOnLocationGranted: isAlwaysOnLocationAllowed,
      );
    });
  }

  Future<void> requestDisableBatteryOptimization() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final isGranted =
          await _appPermissionsServices.disableBatteryOptimization();
      return state.value!.copyWith(isBatteryOptimizationDisabled: isGranted);
    });
  }

  Future<void> requestNotificationService() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final isGranted =
          await _appPermissionsServices.requestNotificationService();
      return state.value!.copyWith(isAppNotificationsAllowed: isGranted);
    });
  }

  Future<void> requestLocationServices() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final isGranted = await _appPermissionsServices.requestLocationServices();
      return state.value!.copyWith(
        isLocationServicesEnabled: isGranted,
        isLocationGranted: isGranted,
        isAlwaysOnLocationGranted: isGranted,
      );
    });
  }

  Future<void> requestLocationService() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final isGranted =
          await _appPermissionsServices.requestLocationPermission();
      return state.value!.copyWith(
        isLocationGranted: isGranted,
      );
    });
  }

  Future<void> requestLocationAlwaysOnService() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final isGranted =
          await _appPermissionsServices.requestLocationAlwaysOnService();
      return state.value!.copyWith(
        isAlwaysOnLocationGranted: isGranted,
      );
    });
  }

  Future<void> checkAllPermissions() async {
    state = const AsyncLoading();

    state = await AsyncValue.guard(() async {
      final isNotificationServiceEnabled =
          await _appPermissionsServices.isNotificationServiceEnabled();
      final isBatteryOptimizationDisabled =
          await _appPermissionsServices.isBatteryOptimizationDisabled();
      final isLocationServicesEnabled =
          await _appPermissionsServices.isLocationServicesEnabled();
      final isLocationPermissionGranted =
          await _appPermissionsServices.isLocationPermissionGranted();
      final isAlwaysOnLocationAllowed =
          await _appPermissionsServices.isAlwaysOnLocationGranted();

      return state.value!.copyWith(
        isAppNotificationsAllowed: isNotificationServiceEnabled,
        isBatteryOptimizationDisabled: isBatteryOptimizationDisabled,
        isLocationServicesEnabled: isLocationServicesEnabled,
        isLocationGranted: isLocationPermissionGranted,
        isAlwaysOnLocationGranted: isAlwaysOnLocationAllowed,
      );
    });
  }

  bool areAllServicesActive() {
    if (state.value!.isAppNotificationsAllowed &&
        state.value!.isBatteryOptimizationDisabled &&
        state.value!.isLocationServicesEnabled) {
      return true;
    } else {
      return false;
    }
  }
}
