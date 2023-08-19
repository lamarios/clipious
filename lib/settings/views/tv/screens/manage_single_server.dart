import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:invidious/settings/views/tv/screens/settings.dart';
import 'package:invidious/utils/views/tv/components/tv_button.dart';
import 'package:invidious/utils/views/tv/components/tv_overscan.dart';

import '../../../../app/states/app.dart';
import '../../../../utils.dart';
import '../../../../utils/views/tv/components/tv_text_field.dart';
import '../../../models/db/server.dart';
import '../../../states/server_settings.dart';

class TvManageSingleServer extends StatelessWidget {
  final Server server;

  const TvManageSingleServer({Key? key, required this.server}) : super(key: key);

  void showLogInWithCookiesDialog(BuildContext context) async {
    var locals = AppLocalizations.of(context)!;
    var textTheme = Theme.of(context).textTheme;
    TextEditingController userController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    FocusNode focusNode = FocusNode();
    ColorScheme colors = Theme.of(context).colorScheme;

    var cubit = context.read<ServerSettingsCubit>();

    showTvDialog(
        context: context,
        builder: (BuildContext context) => [
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TvTextField(
                        leading: Icon(
                          Icons.person,
                          color: colors.secondary,
                        ),
                        autofocus: true,
                        focusNode: focusNode,
                        textInputAction: TextInputAction.next,
                        controller: userController,
                        autocorrect: false,
                        autofillHints: const [AutofillHints.username, AutofillHints.email],
                        decoration: InputDecoration(
                            label: Text(
                          locals.username,
                          style: TextStyle(color: colors.secondary),
                        ))),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TvTextField(
                      leading: Icon(
                        Icons.password,
                        color: colors.secondary,
                      ),
                      obscureText: true,
                      textInputAction: TextInputAction.next,
                      autocorrect: false,
                      controller: passwordController,
                      autofillHints: const [AutofillHints.password],
                      decoration: InputDecoration(
                          label: Text(
                        locals.password,
                        style: TextStyle(color: colors.secondary),
                      )),
                    ),
                  ),
                ],
              )
            ],
        actions: [
          TvButton(
            onPressed: (context) {
              Navigator.of(context).pop();
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
              child: Text(locals.cancel),
            ),
          ),
          TvButton(
            onPressed: (context) async {
              try {
                await cubit.logInWithCookie(userController.text, passwordController.text);
                Navigator.of(context).pop();
              } catch (err) {
                showTvAlertdialog(context, locals.error, [
                  Text(
                    locals.wrongUsernamePassword,
                    style: textTheme.titleLarge,
                  )
                ]);
                rethrow;
              }
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
              child: Text(locals.ok),
            ),
          ),
        ]);
  }

/*
  void showLogInWithCookiesDialog(BuildContext context) async {
    var locals = AppLocalizations.of(context)!;
    TextEditingController userController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    FocusNode focusNode = FocusNode();

    Navigator.of(context).push(MaterialPageRoute(
      builder: (BuildContext context) {
        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(40),
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              TextField(
                  autofocus: true,
                  focusNode: focusNode,
                  controller: userController,
                  autocorrect: false,
                  textInputAction: TextInputAction.next,
                  autofillHints: const [AutofillHints.username, AutofillHints.email],
                  decoration: InputDecoration(label: Text(locals.username))),
              TextField(
                obscureText: true,
                autocorrect: false,
                controller: passwordController,
                textInputAction: TextInputAction.next,
                autofillHints: const [AutofillHints.password],
                decoration: InputDecoration(label: Text(locals.password)),
              ),
              Row(
                children: <Widget>[
                  GetBuilder<ServerSettingsController>(
                    builder: (controller) => Focus(
                      onKeyEvent: (node, event) => onTvSelect(event, context, (context) async {
                        try {
                          await controller.logInWithCookie(userController.text, passwordController.text);
                          Navigator.of(context).pop();
                        } catch (err) {
                          showAlertDialog(context, locals.error, [Text(locals.wrongUsernamePassword)]);
                          rethrow;
                        }
                      }),
                      child: TextButton(
                        // focusNode: focusNode,
                        child: Text(locals.ok),
                        onPressed: () {},
                      ),
                    ),
                  ),
                  TextButton(
                    child: Text(locals.cancel),
                    onPressed: () {
                      //Put your code here which you want to execute on Cancel button click.
                      focusNode.dispose();
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              )
            ]),
          ),
        );
      },
    ));
  }
*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TvOverscan(
        child: BlocProvider(
          create: (BuildContext context) => ServerSettingsCubit(server, context.read<AppCubit>()),
          child: BlocBuilder<ServerSettingsCubit, Server>(builder: (context, server) {
            var cubit = context.read<ServerSettingsCubit>();
            AppLocalizations locals = AppLocalizations.of(context)!;
            bool isLoggedIn = (server.authToken != null && server.authToken!.isNotEmpty) || (server.sidCookie != null && server.sidCookie!.isNotEmpty);

            return ListView(
              children: [
                SettingsTitle(title: server.url),
                SettingsTile(
                  enabled: !server.inUse,
                  title: locals.useThisServer,
                  onSelected: (context) => cubit.useServer(true),
                  autofocus: true,
                  trailing: Switch(onChanged: server.inUse ? null : (value) {}, value: server.inUse),
                ),
                SettingsTitle(title: locals.authentication),
                SettingsTile(
                  title: locals.cookieLogin,
                  enabled: !isLoggedIn,
                  onSelected: (context) => showLogInWithCookiesDialog(context),
                ),
                SettingsTile(
                  title: locals.logout,
                  enabled: isLoggedIn,
                  onSelected: (context) => cubit.logOut(),
                ),
                SettingsTile(
                  title: locals.delete,
                  enabled: cubit.canDelete,
                  onSelected: (context) {
                    cubit.deleteServer();
                    Navigator.of(context).pop();
                  },
                )
              ],
            );
          }),
        ),
      ),
    );
  }
}
