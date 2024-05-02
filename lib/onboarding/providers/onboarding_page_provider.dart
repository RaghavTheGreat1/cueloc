import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final onboardingPageControllerProvider = Provider<PageController>((ref) {
  return PageController(
    initialPage: 0,
  );
});
