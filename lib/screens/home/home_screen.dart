import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../gen/assets.gen.dart';
import '../../google_maps/providers/google_maps_marker_service_provider.dart';
import '../../maps.dart';
import '../../providers/alarms_stream_provider.dart';
import 'widgets/alarm_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("CueLoc"),
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
      floatingActionButton: FloatingActionButton.extended(
        icon: const Icon(
          Icons.add_rounded,
        ),
        label: const Text('New CueLoc'),
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
                borderRadius: BorderRadius.circular(24),
                child: SizedBox(
                  height: 360,
                  child: Consumer(
                    builder: (context, ref, child) {
                      final markerService =
                          ref.watch(googleMapsMarkerServiceProvider);
                      final activeAlarms =
                          ref.watch(allAlarmsStreamProvider).value;
                      final inActiveAlarms =
                          ref.watch(inactiveAlarmsStreamProvider).value;

                      final Set<Marker> markers = {};
                      for (final i in activeAlarms ?? []) {
                        markers.add(markerService.getActiveAlarmMarker(i));
                      }
                      for (final i in inActiveAlarms ?? []) {
                        markers.add(markerService.getInactiveAlarmMarker(i));
                      }

                      return Maps(
                        radius: 1000,
                        initialMarkers: markers,
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
          Consumer(
            builder: (context, ref, child) {
              final alarms = ref.watch(
                      allAlarmsStreamProvider.select((value) => value.value)) ??
                  [];
              if (alarms.isEmpty) {
                return SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      children: [
                        SvgPicture.asset(
                          height: MediaQuery.of(context).size.height / 5,
                          Assets.illustrations.undrawSelectionReYcpo,
                        ),
                        const Gap(24),
                        Text(
                          "You have 0 CueLocs\nTap the + button to add a new one.",
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ],
                    ),
                  ),
                );
              }
              return const SliverToBoxAdapter();
            },
          ),
          // SliverToBoxAdapter(
          //   child: TextField(
          //     onSubmitted: (value) async {
          //       if (value.length < 3) {
          //         return;
          //       }
          //       final lats = await GeocodingPlatform.instance
          //           ?.placemarkFromAddress(value);
          //       if (lats == null) return;
          //       print(lats.length);
          //       for (var i in lats) {
          //         print(i.toJson());
          //       }
          //     },
          //   ),
          // ),
          // SliverToBoxAdapter(
          //   child: Padding(
          //     padding: const EdgeInsets.all(16),
          //     child: SingleChildScrollView(
          //       scrollDirection: Axis.horizontal,
          //       child: Row(
          //         children: [
          //           Consumer(
          //             builder: (context, ref, child) {
          //               final appPermission = ref.watch(
          //                   appPermissionsControllerProvider
          //                       .select((value) => value.value));

          //               if (appPermission == null) return const SizedBox();
          //               if (appPermission.isAppNotificationsAllowed &&
          //                   appPermission.isBatteryOptimizationDisabled &&
          //                   appPermission.isLocationServicesEnabled) {
          //                 return const SizedBox();
          //               }
          //               return InputChip(
          //                 onPressed: () async {
          //                   await ref
          //                       .read(appPermissionsControllerProvider.notifier)
          //                       .requestPerimssions();
          //                 },
          //                 label: const Text('Grant Permissions'),
          //               );
          //             },
          //           ),
          //         ],
          //       ),
          //     ),
          //   ),
          // ),

          Consumer(
            builder: (context, ref, child) {
              final alarms = ref.watch(
                      allAlarmsStreamProvider.select((value) => value.value)) ??
                  [];
              if (alarms.isNotEmpty) {
                return SliverToBoxAdapter(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          "CueLocs (${alarms.length})",
                          style: theme.textTheme.titleLarge,
                        ),
                      ),
                    ],
                  ),
                );
              }
              return const SliverToBoxAdapter();
            },
          ),
          const SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            sliver: AlarmsSliverList(),
          ),
          const SliverToBoxAdapter(
            child: Gap(256),
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
