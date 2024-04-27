import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../app_permissions/providers/app_permissions_controller.dart';
import '../../maps.dart';
import '../../providers/alarms_stream_provider.dart';
import 'widgets/alarm_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Map My Nap"),
        actions: [
          IconButton(
            onPressed: () {
              context.go('/settings');
            },
            icon: const Icon(
              FeatherIcons.settings,
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(
          Icons.add_rounded,
        ),
        onPressed: () {
          context.go('/alarm/new/_');
        },
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(17),
                child: const SizedBox(
                  height: 360,
                  child: Maps(
                    radius: 1000,
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Consumer(
                      builder: (context, ref, child) {
                        final appPermission =
                            ref.watch(appPermissionsControllerProvider);
                        if (appPermission.isAppNotificationsAllowed &&
                            appPermission.isBatteryOptimizationDisabled &&
                            appPermission.isGpsEnabled) {
                          return const SizedBox();
                        }
                        return InputChip(
                          onPressed: () async {
                            await ref
                                .read(appPermissionsControllerProvider.notifier)
                                .requestPerimssions();
                          },
                          label: const Text('Grant Permissions'),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            sliver: AlarmsSliverList(),
          ),
        ],
      ),
    );
  }
}

class AlarmsSliverList extends HookConsumerWidget {
  const AlarmsSliverList({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final alarmsListStream = ref.watch(allAlarmsStreamProvider);

    return alarmsListStream.when(
      data: (data) {
        final results = data;
        return SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              final currentAlarm = results[index];
              return AlarmCard(
                alarm: currentAlarm,
              );
            },
            childCount: results.length,
          ),
        );
      },
      error: (error, stackTrace) {
        debugPrint(error.toString());
        return SliverToBoxAdapter(
          child: Text(error.toString()),
        );
      },
      loading: () {
        return const SliverToBoxAdapter(
          child: Text("Loading"),
        );
      },
    );
  }
}
