import 'package:application_icon/application_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';
import 'package:invidious/controllers/serverListSettingsController.dart';
import 'package:invidious/controllers/settingsController.dart';
import 'package:invidious/controllers/welcomeWizardController.dart';
import 'package:invidious/main.dart';
import 'package:invidious/views/settings/manageServerInner.dart';

import '../models/db/server.dart';

class WelcomeWizard extends StatelessWidget {
  const WelcomeWizard({super.key});

  @override
  Widget build(BuildContext context) {
    var locals = AppLocalizations.of(context)!;
    ColorScheme colors = Theme.of(context).colorScheme;
    var textTheme = Theme.of(context).textTheme;

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => WelcomeWizardCubit(null)),
        BlocProvider(
          create: (context) => ServerListSettingsCubit(ServerListSettingsController(publicServers: [], dbServers: [])),
        )
      ],
      child: BlocListener<ServerListSettingsCubit, ServerListSettingsController>(
        listener: (context, state) {
          context.read<WelcomeWizardCubit>().getSelectedServer();
        },
        child: BlocBuilder<WelcomeWizardCubit, Server?>(
          builder: (context, server) {
            var cubit = context.read<WelcomeWizardCubit>();
            return Scaffold(
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
                      style: textTheme.displaySmall?.copyWith(color: colors.primary),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(locals.wizardIntro),
                    ),
                    const Expanded(child: ManagerServersView()),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: FilledButton.tonal(
                          onPressed: server != null
                              ? () {
                                  navigatorKey.currentState
                                      ?.push(MaterialPageRoute(
                                        builder: (context) => const Home(),
                                      ))
                                      .then((value) => cubit.getSelectedServer());
                                }
                              : null,
                          child: Text(locals.startUsingClipious)),
                    )
                  ])),
            );
          },
        ),
      ),
    );
  }
}
