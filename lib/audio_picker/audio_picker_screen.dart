import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:unicons/unicons.dart';

import '../app_preferences/providers/app_user_preferences_controller_provider.dart';
import '../gen/assets.gen.dart';
import '../settings/widgets/settings_card.dart';
import '../widgets/list_tile/loader_list_tile.dart';

class AudioPickerScreen extends HookConsumerWidget {
  const AudioPickerScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sound'),
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Consumer(
              builder: (context, ref, child) {
                final volumeLevel = ref.watch(appUserPreferencesProvider
                    .select((value) => value.value?.alarmVolume));
                return SettingsCard(
                  title: 'Volume',
                  subSections: [
                    Column(
                      children: [
                        Consumer(
                          builder: (context, ref, child) {
                            return Slider.adaptive(
                              value: volumeLevel ?? 7.0,
                              label: volumeLevel?.toInt().toString() ?? '7.0',
                              divisions: 10,
                              max: 10,
                              min: 0,
                              onChanged: (value) {
                                ref
                                    .read(appUserPreferencesProvider.notifier)
                                    .updateAlarmVolume(
                                      value,
                                    );
                              },
                            );
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '0',
                                style: theme.textTheme.bodyMedium
                                    ?.copyWith(fontWeight: FontWeight.bold),
                              ),
                              Text(
                                '10',
                                style: theme.textTheme.bodyMedium
                                    ?.copyWith(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const Gap(8),
                    Consumer(
                      builder: (context, ref, child) {
                        final toVibrate = ref.watch(appUserPreferencesProvider
                            .select((value) => value.value?.vibrateOnAlarm));
                        return LoaderListTile(
                          leading: Icon(
                            UniconsLine.mobile_vibrate,
                            color: theme.colorScheme.onSecondaryContainer,
                          ),
                          title: const Text('Vibrate'),
                          trailing: Switch.adaptive(
                            value: toVibrate ?? true,
                            onChanged: (value) {
                              ref
                                  .read(appUserPreferencesProvider.notifier)
                                  .updateVibrateOnAlarm(
                                    value,
                                  );
                            },
                          ),
                        );
                      },
                    ),
                    const Gap(24),
                  ],
                );
              },
            ),
          ),
          SliverToBoxAdapter(
            child: SettingsCard(
              title: 'Ringtone',
              subSections: [
                Flexible(
                  child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      final currentAudio = Assets.alarmSounds.values[index];
                      return ListTile(
                        title: Text(currentAudio),
                      );
                    },
                    itemCount: Assets.alarmSounds.values.length,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
