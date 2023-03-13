import 'package:fbroadcast/fbroadcast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:invidious/globals.dart';
import 'package:invidious/utils.dart';
import 'package:settings_ui/settings_ui.dart';
import '../../database.dart';
import '../../models/db/server.dart';
import '../settings.dart';

class ManageSingleServer extends StatefulWidget {
  final Server server;
  final Function refreshServers;

  const ManageSingleServer({Key? key, required this.server, required this.refreshServers}) : super(key: key);

  @override
  State<ManageSingleServer> createState() => _ManageSingleServerState();
}

class _ManageSingleServerState extends State<ManageSingleServer> {
  late Server server;
  bool canDelete = db.getServers().length > 1;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    server = widget.server;
  }

  useServer(bool value) {
    db.useServer(server);
    setState(() {
      server.inUse = true;
    });
    widget.refreshServers();
  }

  void logOut(BuildContext context) {
    setState(() {
      server.sidCookie = null;
      server.authToken = null;
      db.upsertServer(server);
    });
  }

  void logInWithToken(BuildContext context) async {
    await service.logIn(server.url);
    setState(() {
      server = db.getServer(server.url)!;
    });
  }

  void logInWithCookie(BuildContext context, String username, String password) async {
    try {
      print('login with $username, $password');
      String cookie = await service.loginWithCookies(server.url, username, password);

      setState(() {
        server.sidCookie = cookie;
        db.upsertServer(server);
        FBroadcast.instance().broadcast(BROADCAST_SERVER_CHANGED);
      });
      Navigator.of(context).pop();
    } catch (err) {
      var locals = AppLocalizations.of(context)!;
      okCancelDialog(context, locals.error, locals.wrongUsernamePassword, () => {});
    }
  }

  void showLogInWithCookiesDialog(BuildContext context) async {
    var locals = AppLocalizations.of(context)!;
    TextEditingController userController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(controller: userController, autocorrect: false, autofillHints: const [AutofillHints.username, AutofillHints.email], decoration: InputDecoration(label: Text(locals.username))),
              TextField(
                obscureText: true,
                autocorrect: false,
                controller: passwordController,
                autofillHints: const [AutofillHints.password],
                decoration: InputDecoration(label: Text(locals.password)),
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              child: Text(locals.ok),
              onPressed: () {
                logInWithCookie(context, userController.value.text, passwordController.value.text);
              },
            ),
            TextButton(
              child: Text(locals.cancel),
              onPressed: () {
                //Put your code here which you want to execute on Cancel button click.
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  deleteServer(BuildContext context) {
    db.deleteServer(server);
    widget.refreshServers();

    Server currentServer = db.getCurrentlySelectedServer();
    if (currentServer.url == server.url) {
      db.deleteSetting(SELECTED_SERVER);
    }
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    var locals = AppLocalizations.of(context)!;
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    SettingsThemeData theme = settingsTheme(colorScheme);
    bool isLoggedIn = (server.authToken != null && server.authToken!.isNotEmpty) || (server.sidCookie != null && server.sidCookie!.isNotEmpty);

    return Scaffold(
        appBar: AppBar(
          scrolledUnderElevation: 0,
          title: Text(widget.server.url),
        ),
        backgroundColor: colorScheme.background,
        body: SafeArea(
          bottom: false,
          child: SettingsList(lightTheme: theme, darkTheme: theme, sections: [
            SettingsSection(tiles: [
              SettingsTile.switchTile(
                initialValue: server.inUse,
                onToggle: useServer,
                title: Text(locals.useThisServer),
                enabled: !server.inUse,
              )
            ]),
            SettingsSection(title: Text(locals.authentication), tiles: [
              SettingsTile(
                leading: server.authToken?.isNotEmpty ?? false ? const Icon(Icons.check) : const Icon(Icons.token),
                enabled: !isLoggedIn,
                title: Text(locals.tokenLogin),
                value: Text(server.authToken?.isNotEmpty ?? false ? locals.loggedIn : locals.tokenLoginDescription),
                onPressed: logInWithToken,
              ),
              SettingsTile(
                leading: server.sidCookie?.isNotEmpty ?? false ? const Icon(Icons.check) : const Icon(Icons.cookie_outlined),
                enabled: !isLoggedIn,
                title: Text(locals.cookieLogin),
                value: Text(server.sidCookie?.isNotEmpty ?? false ? locals.loggedIn : locals.cookieLoginDescription),
                onPressed: showLogInWithCookiesDialog,
              ),
              SettingsTile(
                leading: const Icon(Icons.exit_to_app),
                enabled: isLoggedIn,
                title: Text(locals.logout),
                onPressed: logOut,
              )
            ]),
            SettingsSection(title: const Text(''), tiles: [
              SettingsTile(
                enabled: canDelete,
                onPressed: deleteServer,
                leading: Icon(
                  Icons.delete,
                  color: canDelete ? Colors.red : Colors.red.withOpacity(0.5),
                ),
                title: Text(
                  locals.delete,
                  style: TextStyle(color: canDelete ? Colors.red : Colors.red.withOpacity(0.5)),
                ),
              )
            ])
          ]),
        ));
  }
}
