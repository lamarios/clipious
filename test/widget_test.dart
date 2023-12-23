// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:invidious/app/states/app.dart';
import 'package:invidious/database.dart';
import 'package:invidious/globals.dart';
import 'package:invidious/home/views/screens/home.dart';
import 'package:invidious/main.dart';
import 'package:invidious/settings/states/settings.dart';
import 'package:invidious/welcome_wizard/views/screens/welcome_wizard.dart';

void main() {
/*
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    db = await DbClient.create();
    // Build our app and trigger a frame.
    await tester.pumpWidget(MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AppCubit(AppState.init()),),
        BlocProvider(create: (context) => SettingsCubit(SettingsState.init(), context.read<AppCubit>()),)
      ],
      child: MaterialApp(
          locale: const Locale("en_US"),
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          theme: ThemeData(
              fontFamily: "Graphik",
              useMaterial3: true, colorScheme: ColorScheme.fromSeed(seedColor: brandColor)), home: const WelcomeWizardScreen()),
    ));

    await tester.pump(const Duration(seconds: 10));
    // Verify that our counter starts at 0.
    await expectLater(find.byType(WelcomeWizardScreen), matchesGoldenFile('goldens/welcomewizard.png'));
*/
/*
    expect(find.text('1'), findsNothing);

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
*//*

  });
*/
}
