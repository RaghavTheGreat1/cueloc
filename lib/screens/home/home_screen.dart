import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
      body: Row(
        children: [
          Column(
            children: [
              const Text("Primary"),
              Container(
                height: 48,
                width: 48,
                color: theme.colorScheme.primary,
              ),
              Container(
                height: 48,
                width: 48,
                color: theme.colorScheme.onPrimary,
              ),
              Container(
                height: 48,
                width: 48,
                color: theme.colorScheme.primaryContainer,
              ),
              Container(
                height: 48,
                width: 48,
                color: theme.colorScheme.onPrimaryContainer,
              ),
            ],
          ),
          Column(
            children: [
              const Text("Secondary"),
              Container(
                height: 48,
                width: 48,
                color: theme.colorScheme.secondary,
              ),
              Container(
                height: 48,
                width: 48,
                color: theme.colorScheme.onSecondary,
              ),
              Container(
                height: 48,
                width: 48,
                color: theme.colorScheme.secondaryContainer,
              ),
              Container(
                height: 48,
                width: 48,
                color: theme.colorScheme.onSecondaryContainer,
              ),
            ],
          ),
          Column(
            children: [
              const Text("Tertiary"),
              Container(
                height: 48,
                width: 48,
                color: theme.colorScheme.tertiary,
              ),
              Container(
                height: 48,
                width: 48,
                color: theme.colorScheme.onTertiary,
              ),
              Container(
                height: 48,
                width: 48,
                color: theme.colorScheme.tertiaryContainer,
              ),
              Container(
                height: 48,
                width: 48,
                color: theme.colorScheme.onTertiaryContainer,
              ),
            ],
          ),
          Column(
            children: [
              const Text("Background\n&\nSurface"),
              Container(
                height: 48,
                width: 48,
                color: theme.colorScheme.background,
              ),
              Container(
                height: 48,
                width: 48,
                color: theme.colorScheme.onBackground,
              ),
              Container(
                height: 48,
                width: 48,
                color: theme.colorScheme.surface,
              ),
              Container(
                height: 48,
                width: 48,
                color: theme.colorScheme.onSurface,
              ),
            ],
          ),
          Column(
            children: [
              const Text("Surface\n&\nOutline"),
              Container(
                height: 48,
                width: 48,
                color: theme.colorScheme.surfaceVariant,
              ),
              Container(
                height: 48,
                width: 48,
                color: theme.colorScheme.onSurfaceVariant,
              ),
              Container(
                height: 48,
                width: 48,
                color: theme.colorScheme.outline,
              ),
              Container(
                height: 48,
                width: 48,
                color: theme.colorScheme.outlineVariant,
              ),
            ],
          ),
          Column(
            children: [
              const Text("Errors"),
              Container(
                height: 48,
                width: 48,
                color: theme.colorScheme.error,
              ),
              Container(
                height: 48,
                width: 48,
                color: theme.colorScheme.onError,
              ),
              Container(
                height: 48,
                width: 48,
                color: theme.colorScheme.errorContainer,
              ),
              Container(
                height: 48,
                width: 48,
                color: theme.colorScheme.onErrorContainer,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
