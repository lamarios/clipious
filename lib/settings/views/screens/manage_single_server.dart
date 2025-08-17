import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:clipious/l10n/generated/app_localizations.dart';
import 'package:clipious/app/states/app.dart';
import 'package:clipious/settings/states/server_settings.dart';
import 'package:clipious/utils.dart';
import 'package:clipious/utils/string.dart';
import 'package:settings_ui/settings_ui.dart';

import '../../models/db/server.dart';
import 'settings.dart';

@RoutePage()
class ManageSingleServerScreen extends StatelessWidget {
  final Server server;

  const ManageSingleServerScreen({super.key, required this.server});

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
              TextField(
                  controller: field1Controller,
                  autocorrect: false,
                  autofillHints: field1AutofillHints,
                  obscureText: field1Secret,
                  decoration: InputDecoration(label: Text(field1Title))),
              TextField(
                obscureText: field2Secret,
                autocorrect: false,
                controller: field2Controller,
                autofillHints: field2AutofillHints,
                decoration: InputDecoration(label: Text(field2Title)),
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              child: Text(locals.cancel),
              onPressed: () {
                //Put your code here which you want to execute on Cancel button click.
                Navigator.of(context).pop();
              },
            ),
            TextButton(
                child: Text(okText),
                onPressed: () =>
                    onOk(field1Controller.text, field2Controller.text)),
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
    showKeyValueDialog(context,
        field1Title: locals.username,
        field2Title: locals.password,
        field1AutofillHints: const [
          AutofillHints.username,
          AutofillHints.email
        ],
        field2AutofillHints: const [AutofillHints.password],
        field2Secret: true,
        okText: locals.ok, onOk: (username, password) async {
      var cubit = context.read<ServerSettingsCubit>();
      try {
        await cubit.logInWithCookie(username, password);
        if (context.mounted) {
          Navigator.of(context).pop();
        }
      } catch (err) {
        if (context.mounted) {
          showAlertDialog(
              context, locals.error, [Text(locals.wrongUsernamePassword)]);
        }
        rethrow;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var locals = AppLocalizations.of(context)!;
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    SettingsThemeData theme = settingsTheme(colorScheme);

    return BlocProvider(
      create: (context) => ServerSettingsCubit(
          ServerSettingsState(server: server), context.read<AppCubit>()),
      child: BlocBuilder<ServerSettingsCubit, ServerSettingsState>(
        builder: (context, state) {
          var server = state.server;
          var cubit = context.read<ServerSettingsCubit>();
          bool isLoggedIn =
              (server.authToken != null && server.authToken!.isNotEmpty) ||
                  (server.sidCookie != null && server.sidCookie!.isNotEmpty);
          return Scaffold(
              appBar: AppBar(
                title: Text(server.url),
              ),
              backgroundColor: colorScheme.surface,
              body: SafeArea(
                bottom: false,
                child: SettingsList(
                    lightTheme: theme,
                    darkTheme: theme,
                    sections: [
                      SettingsSection(tiles: [
                        SettingsTile.switchTile(
                          initialValue: server.inUse,
                          onToggle: cubit.useServer,
                          title: Text(locals.useThisServer),
                          enabled: !server.inUse,
                        )
                      ]),
                      SettingsSection(
                          title: Text(locals.authentication),
                          tiles: [
                            SettingsTile(
                              leading: server.authToken?.isNotEmpty ?? false
                                  ? const Icon(Icons.check)
                                  : const Icon(Icons.token),
                              enabled: !isLoggedIn && !state.hasBasicAuth,
                              title: Text(locals.tokenLogin),
                              value: Text(server.authToken?.isNotEmpty ?? false
                                  ? locals.loggedIn
                                  : locals.tokenLoginDescription),
                              onPressed: (context) async {
                                await cubit.logInWithToken();
                              },
                            ),
                            SettingsTile(
                              leading: server.sidCookie?.isNotEmpty ?? false
                                  ? const Icon(Icons.check)
                                  : const Icon(Icons.cookie_outlined),
                              enabled: !isLoggedIn,
                              title: Text(locals.cookieLogin),
                              value: Text(server.sidCookie?.isNotEmpty ?? false
                                  ? locals.loggedIn
                                  : locals.cookieLoginDescription),
                              onPressed: showLogInWithCookiesDialog,
                            ),
                            SettingsTile(
                              leading: const Icon(Icons.exit_to_app),
                              enabled: isLoggedIn,
                              title: Text(locals.logout),
                              onPressed: (context) => cubit.logOut(),
                            )
                          ]),
                      SettingsSection(
                          title: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Text(locals.customHeaders),
                              Text(
                                locals.customHeadersExplanation,
                                style: TextStyle(
                                    color: theme.tileDescriptionTextColor),
                              )
                            ],
                          ),
                          tiles: [
                            ...state.server.customHeaders.keys.map((k) {
                              String value =
                                  state.server.customHeaders[k] ?? '';
                              if (k == 'Authorization') {
                                value = "········";
                              }

                              return SettingsTile(
                                title: Text(k),
                                description: Text(value),
                                trailing: IconButton(
                                  icon: const Icon(Icons.delete),
                                  onPressed: () => cubit.removeHeader(k),
                                ),
                              );
                            }),
                            SettingsTile(
                              title: Text(locals.addBasicAuth),
                              leading: const Icon(Icons.key),
                              onPressed: showBasicAuthDialog,
                            ),
                            SettingsTile(
                              title: Text(locals.addHeader),
                              leading: const Icon(Icons.add),
                              onPressed: showAddHeaderDialog,
                            )
                          ]),
                      SettingsSection(title: const Text(''), tiles: [
                        SettingsTile(
                          enabled: state.canDelete,
                          onPressed: (context) async {
                            await cubit.deleteServer();
                            if (context.mounted) {
                              Navigator.of(context).pop();
                            }
                          },
                          leading: Icon(
                            Icons.delete,
                            color: state.canDelete
                                ? Colors.red
                                : Colors.red.withOpacity(0.5),
                          ),
                          title: Text(
                            locals.delete,
                            style: TextStyle(
                                color: state.canDelete
                                    ? Colors.red
                                    : Colors.red.withOpacity(0.5)),
                          ),
                        )
                      ]),
                    ]),
              ));
        },
      ),
    );
  }
}
