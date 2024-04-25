import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AudioPickerScreen extends HookConsumerWidget {
  const AudioPickerScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Sound'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Alarm'),
              Tab(text: 'Ringtone'),
              Tab(text: 'Notification'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [],
        ),
      ),
    );
  }
}
