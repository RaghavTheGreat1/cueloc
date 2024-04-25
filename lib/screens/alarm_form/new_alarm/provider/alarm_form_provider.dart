import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../controllers/alarms_controller.dart';
import '../../../../models/alarm.dart';
import '../../../../models/coordinates.dart';
import '../../../../models/form_type.dart';
import '../../../../models/trigger_on.dart';
import '../../../../router/router.dart';

final alarmFormProvider =
    StateNotifierProvider.autoDispose<AlarmFormController, Alarm>((ref) {
  return AlarmFormController(
    ref,
    alarm: Alarm.raw(),
  );
});

final class AlarmFormController extends StateNotifier<Alarm> {
  final Ref ref;
  AlarmFormController(
    this.ref, {
    required this.alarm,
  }) : super(alarm);

  final Alarm alarm;

  TextEditingController get labelTextController =>
      TextEditingController.fromValue(
        TextEditingValue(
          text: state.label,
          selection: TextSelection.collapsed(
            offset: state.label.length,
          ),
        ),
      );

  AlarmsControllerNotifier get alarmsControllerNotifier =>
      ref.watch(alarmsControllerProvider.notifier);

  void updateLabel(String label) {
    state = state.copyWith(label: label);
  }

  void updateRadius(double radius) {
    state = state.copyWith(radius: radius);
  }

  void updateTriggerOn(TriggerOn triggerOn) {
    state = state.copyWith(triggerOn: triggerOn);
  }

  Future<void> updateCoordinates(Coordinates coordinates) async {
    state = state.copyWith(coordinates: coordinates);

    try {
      final places = await placemarkFromCoordinates(
        coordinates.latitude,
        coordinates.longitude,
      );

      state = state.copyWith(
        label: places.first.name ?? '',
        coordinates: coordinates,
      );

      labelTextController.value = TextEditingValue(
        text: places.first.name ?? '',
      );
    } finally {
      state = state.copyWith(
        coordinates: coordinates,
      );
    }
  }

  Future<void> saveAlarm(FormType formType) async {
    switch (formType) {
      case FormType.create:
        await alarmsControllerNotifier.saveAlarm(state);
      case FormType.edit:
        await alarmsControllerNotifier.updateAlarm(state);
        break;

      default:
    }

    ref.watch(routerServiceProvider).pop();
  }
}
