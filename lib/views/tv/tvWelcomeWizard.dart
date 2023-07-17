import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';
import 'package:invidious/controllers/welcomeWizardController.dart';
import 'package:invidious/views/tv/settings/tvManageServers.dart';
import 'package:invidious/views/tv/settings/tvManageServersInner.dart';
import 'package:invidious/views/tv/tvButton.dart';
import 'package:invidious/views/tv/tvOverScan.dart';

import 'tvHome.dart';

class TvWelcomeWizard extends StatelessWidget {
  const TvWelcomeWizard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var locals = AppLocalizations.of(context)!;
    ColorScheme colors = Theme.of(context).colorScheme;
    TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: TvOverscan(
        child: GetBuilder<WelcomeWizardController>(
            init: WelcomeWizardController(),
            builder: (_) {
              return DefaultTextStyle(
                style: textTheme.bodyLarge!,
                child: Column(
                  children: [
                    Text(
                      locals.wizardIntro,
                      style: textTheme.titleLarge,
                    ),
                    const Expanded(child: TvManageServersInner()),
                    TvButton(
                      unfocusedColor:
                          _.selected == null ? colors.background : null,
                      onPressed: _.selected != null
                          ? (context) {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const TvHome(),
                              ));
                            }
                          : null,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          locals.startUsingClipious,
                          style: textTheme.titleLarge!.copyWith(
                              color: _.selected == null
                                  ? Colors.white.withOpacity(0.5)
                                  : Colors.white),
                        ),
                      ),
                    )
                  ],
                ),
              );
            }),
      ),
    );
  }
}
