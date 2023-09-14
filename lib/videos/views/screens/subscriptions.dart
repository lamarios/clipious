import 'package:flutter/material.dart';
import 'package:invidious/globals.dart';
import 'package:invidious/myRouteObserver.dart';
import 'package:invidious/videos/views/components/subscriptions.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SubscriptionScreen extends StatelessWidget {
  const SubscriptionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var locals = AppLocalizations.of(context)!;
    var colors = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colors.background,
        title: Text(locals.subscriptions),
        elevation: 0,
        scrolledUnderElevation: 0,
        actions: [
          IconButton(
              onPressed: () => Navigator.of(context).pushNamed(PATH_MANAGE_SUBS), icon: const Icon(Icons.checklist))
        ],
      ),
      body: const SafeArea(
        child: Padding(padding: EdgeInsets.symmetric(horizontal: innerHorizontalPadding), child: Subscriptions()),
      ),
    );
  }
}
