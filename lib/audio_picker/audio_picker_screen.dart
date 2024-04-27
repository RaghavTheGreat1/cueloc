import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../gen/assets.gen.dart';

class AudioPickerScreen extends HookConsumerWidget {
  const AudioPickerScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sound'),
      ),
      body: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                final currentAudio = Assets.alarmSounds.values[index];
                return ListTile(
                  title: Text(currentAudio),
                );
              },
              childCount: Assets.alarmSounds.values.length,
            ),
          ),
        ],
      ),
    );
  }
}
