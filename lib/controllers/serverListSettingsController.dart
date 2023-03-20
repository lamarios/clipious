import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:invidious/controllers/settingsController.dart';
import 'package:invidious/controllers/welcomeWizardController.dart';
import 'package:logging/logging.dart';

import '../globals.dart';
import '../models/db/server.dart';

const pingTimeout = 3;

enum PublicServerErrors { none, couldNotGetList }

class ServerListSettingsController extends GetxController {
  late List<Server> dbServers;
  List<Server> publicServers = [];
  double publicServerProgress = 0;
  TextEditingController addServerController = TextEditingController(text: 'https://');
  final log = Logger('ManagerServerView');

  bool pinging = true;

  PublicServerErrors publicServersError = PublicServerErrors.none;

  @override
  void onInit() {
    super.onInit();
    refreshServers();
    getPublicServers();
  }

  @override
  void onClose() {
    addServerController.dispose();
    super.onClose();
  }

  bool isLoggedInToServer(String url) {
    Server server = dbServers.firstWhere((s) => s.url == url, orElse: () => Server('notFound'));

    return (server.authToken?.isNotEmpty ?? false) || (server.sidCookie?.isNotEmpty ?? false);
  }

  refreshServers() {
    var servers = publicServers.where((s) => dbServers.indexWhere((element) => element.url == s.url) == -1).toList();

    dbServers = db.getServers();
    publicServers = servers;

    update();
  }

  upsertServer(Server server) {
    db.upsertServer(server);

    refreshServers();
    refreshWizard();
  }

  refreshWizard() {
    try {
      WelcomeWizardController.to().getSelectedServer();
    } catch (err) {
      log.info('welcome wird does not exist');
    }
  }

  saveServer() async {
    var serverUrl = addServerController.value.text;
    if (serverUrl.endsWith("/")) {
      serverUrl = serverUrl.substring(0, serverUrl.length - 1);
    }

    bool isValidServer = false;
    try {
      isValidServer = await service.isValidServer(serverUrl);
    } catch (err) {
      isValidServer = false;
    }

    if (isValidServer) {
      Server server = Server(serverUrl);
      db.upsertServer(server);
      addServerController.text = 'https://';
      refreshServers();
      refreshWizard();
    } else {
      throw Error();
    }
  }

  getPublicServers() async {
    pinging = true;
    publicServersError = PublicServerErrors.none;

    update();
    try {
      var public = await service.getPublicServers();

      var servers = public.map((e) {
        var s = Server(e.uri);
        s.flag = e.flag;
        s.region = e.region;

        return s;
      }).toList();
      int progress = 0;
      List<Server> pingedServers = await Future.wait(servers.map((e) async {
        e.ping = await service.pingServer(e.url).timeout(const Duration(seconds: pingTimeout), onTimeout: () => const Duration(seconds: pingTimeout));
        progress++;
        publicServerProgress = progress / servers.length;
        update();
        return e;
      }));

      pingedServers.sort((a, b) => (a.ping ?? const Duration(seconds: pingTimeout)).compareTo(b.ping ?? const Duration(seconds: pingTimeout)));

      pinging = false;
      publicServers = pingedServers;
      publicServersError = PublicServerErrors.none;
      update();
    } catch (err) {
      publicServersError = PublicServerErrors.couldNotGetList;
      update();
    }
  }

  switchServer(Server s) {
    db.useServer(s);
    refreshServers();
    try {
      Get.find<SettingsController>().serverChanged();
    } catch (err) {
      log.info('Cannot find settings controller');
    }

    // we might be on the welcome wizard
    try {
      WelcomeWizardController.to().getSelectedServer();
    } catch (err) {
      log.info('Welcome wizard controller does not exist');
    }
  }
}
