import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:clipious/l10n/generated/app_localizations.dart';
import 'package:clipious/globals.dart';
import 'package:clipious/router.dart';
import 'package:clipious/videos/views/components/subscriptions.dart';

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
