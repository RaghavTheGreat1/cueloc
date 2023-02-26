import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:map_my_nap/models/alarm.dart';

import '../../../repositories/alarm_repository.dart';
import '../../../widgets/maps/maps_preview.dart';

class AlarmCard extends HookConsumerWidget {
  const AlarmCard({
    super.key,
    required this.alarm,
  });

  final Alarm alarm;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: InkWell(
        borderRadius: BorderRadius.circular(17),
        onTap: () {
          context.go(
            '/preview/${alarm.id}',
            extra: alarm,
          );
        },
        onLongPress: () {
          showModalBottomSheet(
            context: context,
            builder: (context) {
              return Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ListTile(
                      onTap: () async {
                        context.pop();
                        await ref
                            .read(alarmRepositoryProvider)
                            .deleteAlarm(alarm);
                      },
                      title: const Text("Delete"),
                      trailing: const Icon(Icons.delete_forever_outlined),
                    ),
                  ],
                ),
              );
            },
          );
        },
        child: Container(
          height: 160,
          decoration: BoxDecoration(
            color: theme.colorScheme.tertiaryContainer,
            borderRadius: BorderRadius.circular(17),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 128,
                  width: 128,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(17),
                    border: Border.all(
                      width: 0.7,
                      color: theme.colorScheme.onPrimaryContainer,
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(17),
                    child: MapsPreview(
                      coordinates: alarm.coordinates,
                      radius: alarm.radius,
                    ),
                  ),
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Switch(
                          value: alarm.isActive,
                          onChanged: (value) {},
                        ),
                        Text(
                          alarm.label,
                          style: theme.textTheme.titleMedium!.copyWith(
                            fontSize: 19,
                            color: theme.colorScheme.onTertiaryContainer,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
