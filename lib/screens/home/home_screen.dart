import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:map_my_nap/providers/alarms_stream_provider.dart';
import 'package:map_my_nap/screens/home/widgets/alarm_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Map My Nap"),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(
          Icons.add_rounded,
        ),
        onPressed: () {
          context.go('/alarm/new/_');
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
