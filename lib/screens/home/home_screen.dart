import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:map_my_nap/models/alarm.dart';
import 'package:map_my_nap/providers/alarms_stream_provider.dart';
import 'package:map_my_nap/widgets/maps/maps_preview.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Map My Nap"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.go('/new');
        },
      ),
      body: const CustomScrollView(
        slivers: [
          SliverPadding(
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
    final theme = Theme.of(context);

    final alarmsListStream = ref.watch(alarmsStreamProvider);
    return alarmsListStream.when(
      data: (data) {
        final results = data.results;
        return SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              final currentAlarm = Alarm.fromRealmModel(results[index]);
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
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
                              coordinates: currentAlarm.coordinates,
                              radius: currentAlarm.radius,
                            ),
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Switch(
                              value: currentAlarm.isActive,
                              onChanged: (value) {},
                            ),
                            Text(
                              currentAlarm.label,
                              style: theme.textTheme.titleMedium!.copyWith(
                                fontSize: 19,
                                color: theme.colorScheme.onTertiaryContainer,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
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
