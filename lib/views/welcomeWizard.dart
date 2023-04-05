import 'package:application_icon/application_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';
import 'package:invidious/controllers/welcomeWizardController.dart';
import 'package:invidious/main.dart';
import 'package:invidious/views/settings/manageServerInner.dart';

class WelcomeWizard extends StatelessWidget {
  const WelcomeWizard({super.key});

  @override
  Widget build(BuildContext context) {
    var locals = AppLocalizations.of(context)!;
    ColorScheme colors = Theme.of(context).colorScheme;

    return GetBuilder<WelcomeWizardController>(
      init: WelcomeWizardController(),
      builder: (_) => Scaffold(
        appBar: AppBar(
          backgroundColor: colors.background,
          toolbarHeight: 0,
          scrolledUnderElevation: 0,
        ),
        extendBodyBehindAppBar: true,
        backgroundColor: colors.background,
        body: SafeArea(
            top: true,
            child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
              const SizedBox(width: 150, height: 150, child: AppIconImage()),
              Text(
                'Clipious',
                style: TextStyle(color: colors.primary, fontSize: 30),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(locals.wizardIntro),
              ),
              const Expanded(child: ManagerServersView()),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: FilledButton.tonal(
                    onPressed: _.selected != null
                        ? () {
                            navigatorKey.currentState?.push(MaterialPageRoute(
                              builder: (context) => const Home(),
                            ));
                          }
                        : null,
                    child: Text(locals.startUsingClipious)),
              )
            ])),
      ),
    );
  }
}
