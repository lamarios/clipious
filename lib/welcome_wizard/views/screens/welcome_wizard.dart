import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:invidious/app/states/app.dart';
import 'package:invidious/router.dart';
import 'package:invidious/settings/states/server_list_settings.dart';
import 'package:invidious/settings/views/components/manager_server_inner.dart';
import 'package:invidious/utils/views/components/app_icon.dart';
import 'package:invidious/welcome_wizard/states/welcome_wizard.dart';

import '../../../settings/models/db/server.dart';

@RoutePage()
class WelcomeWizardScreen extends StatelessWidget {
  const WelcomeWizardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var locals = AppLocalizations.of(context)!;
    ColorScheme colors = Theme.of(context).colorScheme;
    var textTheme = Theme.of(context).textTheme;

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => WelcomeWizardCubit(null)),
        BlocProvider(
          create: (context) => ServerListSettingsCubit(
              const ServerListSettingsState(publicServers: [], dbServers: []), context.read<AppCubit>()),
        )
      ],
      child: BlocListener<ServerListSettingsCubit, ServerListSettingsState>(
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
                    const SizedBox(width: 150, height: 150, child: AppIcon()),
                    Text(
                      'Clipious',
                      style: textTheme.displaySmall?.copyWith(color: colors.primary),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(locals.wizardIntro),
                    ),
                    const Expanded(child: ManagerServersView(fromWizard: true)),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: FilledButton.tonal(
                          onPressed: server != null
                              ? () {
                                  AutoRouter.of(context)
                                      .replace(const MainRoute())
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
