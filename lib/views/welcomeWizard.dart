import 'package:application_icon/application_icon.dart';
import 'package:fbroadcast/fbroadcast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:invidious/globals.dart';
import 'package:invidious/main.dart';
import 'package:invidious/views/settings/manageServerInner.dart';
import 'package:logging/logging.dart';

import '../models/db/server.dart';

class WelcomeWizard extends StatefulWidget {
  const WelcomeWizard({super.key});

  @override
  State<WelcomeWizard> createState() => _WelcomeWizardState();
}

class _WelcomeWizardState extends State<WelcomeWizard> {
  Server? selected;
  final log = Logger('WelcomeWizard');

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    FBroadcast.instance().register(BROADCAST_SERVER_CHANGED, (value, callback) {
      getSelectedServer();
    });
  }

  getSelectedServer() {
    try {
      setState(() {
        selected = db.getCurrentlySelectedServer();
      });
    } catch (err) {
      setState(() {
        selected = null;
      });
      log.info('We don\'t have a server');
    }
  }

  @override
  Widget build(BuildContext context) {
    ColorScheme colors = Theme.of(context).colorScheme;

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
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: SizedBox(width: 70, height: 70, child: AppIconImage()),
            ),
            Text(
              'Clipious',
              style: TextStyle(color: colors.primary, fontSize: 30),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text('To start using Clipious, please select a public server or add your own. You can change servers later in the settings'),
            ),
            const Expanded(child: ManagerServersView()),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: FilledButton.tonal(
                  onPressed: selected != null
                      ? () {
                          Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => const Home(),
                          ));
                        }
                      : null,
                  child: const Text('Start using Clipious')),
            )
          ])),
    );
  }
}
