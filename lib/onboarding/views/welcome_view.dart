import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../gen/assets.gen.dart';
import '../../widgets/buttons/elevated_loader_button.dart';
import '../providers/onboarding_page_provider.dart';

class WelcomeView extends HookConsumerWidget {
  const WelcomeView({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final onboardingPageController =
        ref.watch(onboardingPageControllerProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('CueLoc'),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: MapIllustration(),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Welcome to CueLoc!',
                    style: theme.textTheme.headlineLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  )
                      .animate(
                        delay: const Duration(milliseconds: 500),
                      )
                      .fadeIn(
                        duration: const Duration(milliseconds: 600),
                        curve: Curves.easeOut,
                      ),
                  Text(
                    'Set Reminders, Schedule Alarms, \nNever Miss a Thing.',
                    style: theme.textTheme.titleMedium?.copyWith(),
                    textAlign: TextAlign.center,
                  ),
                  const Gap(16),
                  ElevatedLoaderButton(
                    onPressed: () {
                      onboardingPageController.nextPage(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeIn,
                      );
                    },
                    child: const Text("Let's Go"),
                  )
                      .animate(
                        delay: const Duration(milliseconds: 800),
                      )
                      .fadeIn(
                        duration: const Duration(milliseconds: 600),
                        curve: Curves.easeOut,
                      ),
                  const Gap(16),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MapIllustration extends StatelessWidget {
  const MapIllustration({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SvgPicture.asset(
          Assets.illustrations.undrawAdventureMapHnin,
        ),
        AnimatedPositioned(
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeIn,
          top: MediaQuery.of(context).size.height * 0.2,
          left: MediaQuery.of(context).size.width * 0.28,
          child: Image.asset(
            'assets/icons/cueloc.png',
            height: 64,
            width: 64,
          )
              .animate()
              .slideY(
                begin: -1,
                duration: const Duration(milliseconds: 800),
                curve: Curves.easeIn,
              )
              .fadeIn(
                begin: 0,
                duration: const Duration(milliseconds: 700),
                curve: Curves.easeIn,
              ),
        ),
      ],
    );
  }
}
