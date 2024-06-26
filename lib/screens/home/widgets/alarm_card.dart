import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../controllers/alarms_controller.dart';
import '../../../models/alarm_form.dart';
import '../../../repositories/alarm_repository.dart';
import '../../../widgets/list_tile/loader_list_tile.dart';
import '../../../widgets/maps/maps_preview.dart';

class AlarmCard extends HookConsumerWidget {
  const AlarmCard({
    super.key,
    required this.alarm,
  });

  final AlarmForm alarm;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: InkWell(
        borderRadius: BorderRadius.circular(24),
        onTap: () {
          context.go(
            '/alarm/read/${alarm.id}',
            extra: alarm,
          );
        },
        onLongPress: () {
          showModalBottomSheet(
            context: context,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24).copyWith(
                bottomLeft: const Radius.circular(0),
                bottomRight: const Radius.circular(0),
              ),
            ),
            builder: (context) {
              return Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    LoaderListTile(
                      onTap: () async {
                        await ref
                            .read(alarmRepositoryProvider)
                            .deleteAlarm(alarm);
                        context.pop();
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
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: theme.colorScheme.tertiaryContainer,
            borderRadius: BorderRadius.circular(24),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 128,
                width: 128,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(24),
                  child: MapsPreview(
                    coordinates: alarm.coordinates,
                    radius: alarm.radius,
                  ),
                ),
              ),
              const Gap(8),
              Expanded(
                child: Align(
                  alignment: Alignment.topRight,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Switch(
                        value: alarm.isActive,
                        onChanged: (value) async {
                          await ref
                              .read(alarmsControllerProvider.notifier)
                              .toggleAlarm(alarm, value);
                        },
                      ),
                      Text(
                        alarm.label,
                        maxLines: 2,
                        softWrap: true,
                        textAlign: TextAlign.end,
                        style: theme.textTheme.titleMedium!.copyWith(
                          fontSize: 19,
                          overflow: TextOverflow.ellipsis,
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
    );
  }
}
