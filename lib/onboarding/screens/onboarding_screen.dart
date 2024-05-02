import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../app_permissions/providers/app_permissions_controller.dart';
import '../providers/onboarding_page_provider.dart';
import '../views/app_permissions_view.dart';
import '../views/welcome_view.dart';

class OnboardingScreen extends StatefulHookConsumerWidget {
  const OnboardingScreen({super.key});

  @override
  ConsumerState<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends ConsumerState<OnboardingScreen>
    with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    super.didChangeAppLifecycleState(state);
    final appPermissionsController =
        ref.read(appPermissionsControllerProvider.notifier);
    if (state == AppLifecycleState.resumed) {
      await appPermissionsController.checkAllPermissions();
    }
  }

  @override
  Widget build(BuildContext context) {
    final onboardingPageController =
        ref.watch(onboardingPageControllerProvider);
    final theme = Theme.of(context);
    return Scaffold(
      body: PageView(
        controller: onboardingPageController,
        children: const [
          WelcomeView(),
          AppPermissionsView(),
        ],
      ),
    );
  }
}
