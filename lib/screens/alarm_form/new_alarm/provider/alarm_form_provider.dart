import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:geocoding/geocoding.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../controllers/alarms_controller.dart';
import '../../../../models/alarm_form.dart';
import '../../../../models/coordinates.dart';
import '../../../../models/form_type.dart';
import '../../../../models/trigger_on.dart';
import '../../../../router/router.dart';

final alarmFormProvider =
    NotifierProvider<AlarmFormNotifier, AlarmForm>(AlarmFormNotifier.new);

final class AlarmFormNotifier extends Notifier<AlarmForm> {
  AlarmFormNotifier({
    AlarmForm? initialAlarm,
  }) : _initialAlarm = initialAlarm;

  final AlarmForm? _initialAlarm;

  TextEditingController get labelTextController => _labelTextController;

  final TextEditingController _labelTextController = TextEditingController();

  AlarmsNotifier get _alarmsControllerNotifier =>
      ref.watch(alarmsControllerProvider.notifier);

  @override
  AlarmForm build() {
    if (_initialAlarm != null) {
      labelTextController.value = TextEditingValue(
        text: _initialAlarm!.label,
      );
    }
    return _initialAlarm ?? AlarmForm.raw();
  }

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
        await _alarmsControllerNotifier.saveAlarm(state);
      case FormType.edit:
        await _alarmsControllerNotifier.updateAlarm(state);
        break;

      default:
    }

    ref.watch(routerServiceProvider).pop();
  }
}
