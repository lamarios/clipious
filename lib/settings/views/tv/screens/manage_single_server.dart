import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:gap/gap.dart';
import 'package:invidious/settings/views/tv/screens/settings.dart';
import 'package:invidious/utils/string.dart';
import 'package:invidious/utils/views/tv/components/tv_button.dart';
import 'package:invidious/utils/views/tv/components/tv_overscan.dart';

import '../../../../app/states/app.dart';
import '../../../../utils.dart';
import '../../../../utils/views/tv/components/tv_text_field.dart';
import '../../../models/db/server.dart';
import '../../../states/server_settings.dart';

@RoutePage()
class TvManageSingleServerScreen extends StatelessWidget {
  final Server server;

  const TvManageSingleServerScreen({super.key, required this.server});

  static void showKeyValueDialog(
    BuildContext context, {
    required String field1Title,
    required String field2Title,
    bool field1Secret = false,
    bool field2Secret = false,
    List<String>? field1AutofillHints,
    List<String>? field2AutofillHints,
    required String okText,
    required Function(String field1, String field2) onOk,
  }) {
    var locals = AppLocalizations.of(context)!;
    TextEditingController field1Controller = TextEditingController();
    TextEditingController field2Controller = TextEditingController();

    showDialog(
      context: context,
      useRootNavigator: false,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TvTextField(
                  controller: field1Controller,
                  autocorrect: false,
                  autofillHints: field1AutofillHints,
                  obscureText: field1Secret,
                  decoration: InputDecoration(label: Text(field1Title))),
              TvTextField(
                obscureText: field2Secret,
                autocorrect: false,
                controller: field2Controller,
                autofillHints: field2AutofillHints,
                decoration: InputDecoration(label: Text(field2Title)),
              ),
            ],
          ),
          actions: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TvButton(
                  unfocusedColor: Colors.transparent,
                  onPressed: (context) {
                    //Put your code here which you want to execute on Cancel button click.
                    Navigator.of(context).pop();
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(locals.cancel),
                  ),
                ),
                TvButton(
                    unfocusedColor: Colors.transparent,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(okText),
                    ),
                    onPressed: (context) =>
                        onOk(field1Controller.text, field2Controller.text)),
              ],
            )
          ],
        );
      },
    );
  }

  void showAddHeaderDialog(BuildContext context) {
    var locals = AppLocalizations.of(context)!;
    showKeyValueDialog(context,
        field1Title: locals.name,
        field2Title: locals.value,
        okText: locals.add, onOk: (key, value) async {
      var cubit = context.read<ServerSettingsCubit>();
      await cubit.addHeader(key, value);
      if (context.mounted) {
        Navigator.of(context).pop();
      }
    });
  }

  void showBasicAuthDialog(BuildContext context) {
    var locals = AppLocalizations.of(context)!;
    showKeyValueDialog(context,
        field1Title: locals.username,
        field2Title: locals.password,
        field1AutofillHints: const [
          AutofillHints.username,
          AutofillHints.email
        ],
        field2AutofillHints: const [AutofillHints.password],
        field2Secret: true,
        okText: locals.add, onOk: (username, password) async {
      var cubit = context.read<ServerSettingsCubit>();

      await cubit.addHeader(
          "Authorization", 'Basic ${encodeBase64('$username:$password')}');
      if (context.mounted) {
        Navigator.of(context).pop();
      }
    });
  }

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
                        autofillHints: const [
                          AutofillHints.username,
                          AutofillHints.email
                        ],
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
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
              child: Text(locals.cancel),
            ),
          ),
          TvButton(
            onPressed: (context) async {
              try {
                await cubit.logInWithCookie(
                    userController.text, passwordController.text);
                if (context.mounted) {
                  Navigator.of(context).pop();
                }
              } catch (err) {
                if (context.mounted) {
                  showTvAlertdialog(context, locals.error, [
                    Text(
                      locals.wrongUsernamePassword,
                      style: textTheme.titleLarge,
                    )
                  ]);
                }
                rethrow;
              }
            },
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
              child: Text(locals.ok),
            ),
          ),
        ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TvOverscan(
        child: BlocProvider(
          create: (BuildContext context) => ServerSettingsCubit(
              ServerSettingsState(server: server), context.read<AppCubit>()),
          child: BlocBuilder<ServerSettingsCubit, ServerSettingsState>(
              builder: (context, state) {
            var server = state.server;
            var cubit = context.read<ServerSettingsCubit>();
            AppLocalizations locals = AppLocalizations.of(context)!;
            bool isLoggedIn =
                (server.authToken != null && server.authToken!.isNotEmpty) ||
                    (server.sidCookie != null && server.sidCookie!.isNotEmpty);

            return ListView(
              children: [
                SettingsTitle(title: server.url),
                SettingsTile(
                  enabled: !server.inUse,
                  title: locals.useThisServer,
                  onSelected: (context) => cubit.useServer(true),
                  autofocus: true,
                  trailing: Switch(
                      onChanged: server.inUse ? null : (value) {},
                      value: server.inUse),
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
                SettingsTitle(title: locals.customHeaders),
                ...state.server.customHeaders.keys.map((k) {
                  String value = state.server.customHeaders[k] ?? '';
                  if (k == 'Authorization') {
                    value = "········";
                  }

                  return SettingsTile(
                    title: k,
                    description: value,
                    onSelected: (context) => cubit.removeHeader(k),
                    trailing: const Icon(Icons.delete),
                  );
                }),
                SettingsTile(
                  title: locals.addBasicAuth,
                  leading: const Icon(Icons.key),
                  onSelected: (context) => showBasicAuthDialog(context),
                ),
                SettingsTile(
                  title: locals.addHeader,
                  leading: const Icon(Icons.add),
                  onSelected: showAddHeaderDialog,
                ),
                const Gap(20),
                SettingsTile(
                  title: locals.delete,
                  enabled: state.canDelete,
                  onSelected: (context) async {
                    await cubit.deleteServer();
                    if (context.mounted) {
                      Navigator.of(context).pop();
                    }
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
