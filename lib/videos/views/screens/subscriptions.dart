import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:invidious/globals.dart';
import 'package:invidious/router.dart';
import 'package:invidious/videos/views/components/subscriptions.dart';

@RoutePage()
class SubscriptionScreen extends StatelessWidget {
  const SubscriptionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var locals = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        title: Text(locals.subscriptions),
        actions: [
          IconButton(
              onPressed: () =>
                  AutoRouter.of(context).push(const ManageSubscriptionsRoute()),
              icon: const Icon(Icons.checklist))
        ],
      ),
      body: const SafeArea(
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: innerHorizontalPadding),
            child: Subscriptions()),
      ),
    );
  }
}
