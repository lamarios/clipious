import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:invidious/app/states/app.dart';
import 'package:invidious/settings/views/tv/components/manage_server_inner.dart';
import 'package:invidious/utils/views/tv/components/tv_button.dart';
import 'package:invidious/utils/views/tv/components/tv_overscan.dart';
import 'package:invidious/welcome_wizard/states/welcome_wizard.dart';

import '../../../../app/views/tv/screens/tv_home.dart';
import '../../../../settings/models/db/server.dart';
import '../../../../settings/states/server_list_settings.dart';

class TvWelcomeWizard extends StatelessWidget {
  const TvWelcomeWizard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var locals = AppLocalizations.of(context)!;
    ColorScheme colors = Theme.of(context).colorScheme;
    TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: TvOverscan(
        child: MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) => WelcomeWizardCubit(null)),
            BlocProvider(
              create: (context) => ServerListSettingsCubit(
                  ServerListSettingsState(publicServers: [], dbServers: []), context.read<AppCubit>()),
            )
          ],
          child: BlocListener<ServerListSettingsCubit, ServerListSettingsState>(
            listener: (context, state) {
              context.read<WelcomeWizardCubit>().getSelectedServer();
            },
            child: BlocBuilder<WelcomeWizardCubit, Server?>(builder: (context, server) {
              var cubit = context.read<WelcomeWizardCubit>();
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
                      unfocusedColor: server == null ? colors.background : null,
                      onPressed: server != null
                          ? (context) {
                              Navigator.of(context).pushReplacement(MaterialPageRoute(
                                builder: (context) => const TvHomeScreen(),
                              ));
                            }
                          : null,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          locals.startUsingClipious,
                          style: textTheme.titleLarge!
                              .copyWith(color: server == null ? Colors.white.withOpacity(0.5) : Colors.white),
                        ),
                      ),
                    )
                  ],
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
