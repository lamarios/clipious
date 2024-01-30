import 'dart:io';

import 'package:invidious/globals.dart';
import 'package:invidious/settings/models/db/settings.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port) {
        // if true, it will allow all certs, if false it will throw error on a bad cert
        return db.getSettings(skipSslVerificationSettingName)?.value == 'true';
      };
  }
}
