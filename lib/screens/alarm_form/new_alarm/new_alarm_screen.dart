import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../maps.dart';
import '../../../models/coordinates.dart';
import '../../../models/form_type.dart';
import '../../../models/trigger_on.dart';
import '../../../widgets/buttons/elevated_loader_button.dart';
import '../../../widgets/cupertino_back_button.dart';
import '../../../widgets/textfields/custom_text_field.dart';
import 'provider/alarm_form_provider.dart';
import 'widgets/radius_slider.dart';
import 'widgets/trigger_on_selector.dart';

class NewAlarmScreen extends ConsumerWidget {
  const NewAlarmScreen({
    super.key,
    required this.formType,
  });

  final FormType formType;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ThemeData theme = Theme.of(context);
    final alarmFormNotifier = ref.read(alarmFormProvider.notifier);
    final initialAlarm = ref.read(alarmFormProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("CueLoc"),
        leading: const CupertinoBackButton(),
      ),
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                sliver: SliverList(
                  delegate: SliverChildListDelegate(
                    [
                      Padding(
                        padding: const EdgeInsets.only(top: 4, bottom: 24.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(24),
                          child: SizedBox(
                            height: 360,
                            child: HookConsumer(
                              builder: (context, ref, _) {
                                final radius = ref.watch(alarmFormProvider
                                    .select((value) => value.radius));
                                return Maps(
                                  initialLatLng:
                                      (initialAlarm.coordinates.latitude == 0 &&
                                              initialAlarm
                                                      .coordinates.longitude ==
                                                  0
                                          ? null
                                          : initialAlarm.coordinates.toLatLng),
                                  initialSelectedLatLng:
                                      initialAlarm.coordinates,
                                  radius: radius,
                                  onLocationSelect: (value) async {
                                    await alarmFormNotifier
                                        .updateCoordinates(value);
                                  },
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                      CustomTextFormField(
                        key: const ValueKey("label"),
                        controller: ref
                            .read(alarmFormProvider.notifier)
                            .labelTextController,
                        label: "Label",
                        maxLength: 100,
                        onChanged: (value) {
                          alarmFormNotifier.updateLabel(value);
                        },
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      RadiusSlider(
                        initialValue: initialAlarm.radius,
                        onChanged: (double value) {
                          alarmFormNotifier.updateRadius(value);
                        },
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      TriggerOnSelector(
                        initialValue: initialAlarm.triggerOn,
                        onChanged: (TriggerOn value) {
                          alarmFormNotifier.updateTriggerOn(value);
                        },
                      ),
                      const Gap(24),
                      Text(
                        "Notes",
                        style: theme.textTheme.labelLarge!.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      CustomTextFormField(
                        key: const ValueKey("Notes"),
                        controller: ref
                            .read(alarmFormProvider.notifier)
                            .notesTextController,
                        label: "Type here...",
                        textCapitalization: TextCapitalization.sentences,
                        keyboardType: TextInputType.multiline,
                        textInputAction: TextInputAction.newline,
                        onChanged: (value) {
                          alarmFormNotifier.updateNotes(value);
                        },
                        minLines: 1,
                        maxLines: null,
                      ),
                      const SizedBox(
                        height: 128,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              decoration: BoxDecoration(
                color: theme.colorScheme.background,
                border: const Border(
                  top: BorderSide(
                    width: 0.1,
                  ),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 56,
                        child: ElevatedLoaderButton(
                          onPressed: () async {
                            await alarmFormNotifier.saveAlarm(formType);
                          },
                          child: const Text("MAP IT"),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
