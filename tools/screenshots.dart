import 'dart:io';

import 'package:emulators/emulators.dart';

Future<void> main() async {
  // Create the config instance
  final emu = await Emulators(
      toolchain: const Toolchain(
          adbPath: '/Users/gz/dev/android/sdk/platform-tools/adb',
          avdmanagerPath: '/Users/gz/dev/android/sdk/cmdline-tools/latest/bin/avdmanager',
          emulatorPath: '/Users/gz/dev/android/sdk/emulator/emulator',
          flutterPath: '/Users/gz/dev/flutter/bin/flutter',
          xcrunPath: '/usr/bin/xcrun'));

  // Shutdown all the running emulators
  await emu.shutdownAll();

  // // Make sure the Nexus_5X android emulator exists.
  // // We use the avdmanager CLI tool for this.
  // // You might need to install some packages in Android Studio for this to work.
  // await emu.toolchain.avdmanager([
  //   'create',
  //   'avd',
  //   '-n',
  //   'Nexus_5X',
  //   '-k',
  //   'system-images;android-31;google_apis_playstore;x86_64',
  //   '-d',
  //   'Nexus 5X',
  //   '-f',
  // ]).string();
  //
  final configs = [
    {'locale': 'en'},
  ];

  // For each emulator in the list, we run `flutter drive`.
  await emu.forEach([
    'Pixel 6 Pro API 33',
  ])((device) async {
    for (final c in configs) {
      final p = await emu.drive(
        device,
        'test_driver/main.dart',
        config: c,
      );
      stderr.addStream(p.stderr);
      await stdout.addStream(p.stdout);
    }
  });
}
