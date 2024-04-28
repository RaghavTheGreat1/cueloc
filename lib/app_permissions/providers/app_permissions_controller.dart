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
    return AppPermissions(
      isAppNotificationsAllowed: isNotificationServiceEnabled,
      isBatteryOptimizationDisabled: isBatteryOptimizationDisabled,
      isGpsEnabled: isLocationServicesEnabled,
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
      return AppPermissions(
        isAppNotificationsAllowed: isNotificationServiceEnabled,
        isBatteryOptimizationDisabled: isBatteryOptimizationDisabled,
        isGpsEnabled: isLocationServicesEnabled,
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
      return state.value!.copyWith(isGpsEnabled: isGranted);
    });
  }

  bool areAllServicesActive() {
    if (state.value!.isAppNotificationsAllowed &&
        state.value!.isBatteryOptimizationDisabled &&
        state.value!.isGpsEnabled) {
      return true;
    } else {
      return false;
    }
  }
}
