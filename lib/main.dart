import 'dart:async';
import 'dart:io';

import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_displaymode/flutter_displaymode.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:invidious/app/states/app.dart';
import 'package:invidious/db_migration/migration_utils.dart';
import 'package:invidious/downloads/states/download_manager.dart';
import 'package:invidious/globals.dart';
import 'package:invidious/http_overrides.dart';
import 'package:invidious/media_handler.dart';
import 'package:invidious/notifications/notifications.dart';
import 'package:invidious/player/states/player.dart';
import 'package:invidious/router.dart';
import 'package:invidious/settings/states/settings.dart';
import 'package:invidious/utils.dart';
import 'package:invidious/utils/isar_database.dart';
import 'package:invidious/workmanager.dart';
import 'package:logging/logging.dart';

import 'utils/obox_database.dart';
import 'settings/models/db/app_logs.dart';

const brandColor = Color(0xFF4f0096);

final scaffoldKey = GlobalKey<ScaffoldMessengerState>();
bool isTv = false;

late MediaHandler mediaHandler;

final Logger log = Logger('main');

Future<void> main() async {
  Logger.root.level =
      kDebugMode ? Level.FINEST : Level.INFO; // defaults to Level.INFO
  Logger.root.onRecord.listen((record) {
    debugPrint(
        '[${record.level.name}] [${record.loggerName}] ${record.message}');
    // we don't want debug
    if (record.level == Level.INFO || record.level == Level.SEVERE) {
      db.insertLogs(AppLog(
          logger: record.loggerName,
          level: record.level.name,
          time: record.time,
          message: record.message,
          stacktrace: record.stackTrace?.toString()));
    }
  });

  HttpOverrides.global = MyHttpOverrides();

  WidgetsFlutterBinding.ensureInitialized();
  // FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  db = await IsarDb.create();

  final needsDbMigration = await needsMigration();
  appRouter = AppRouter(needsDbMigration: needsDbMigration);

  initializeNotifications();

  try {
    log.fine("Forcing refresh rate");
    await FlutterDisplayMode.setHighRefreshRate();
  } catch (err) {
    log.severe("failed to set high refresh mode", err);
  }

  isTv = await isDeviceTv();
  runApp(MultiBlocProvider(providers: [
    BlocProvider(
      create: (context) {
        return AppCubit(AppState.init());
      },
    ),
    BlocProvider(
      create: (context) {
        var settingsCubit =
            SettingsCubit(SettingsState.init(), context.read<AppCubit>());
        configureBackgroundService(settingsCubit);
        return settingsCubit;
      },
    ),
    BlocProvider(
      create: (context) =>
          PlayerCubit(PlayerState.init(null), context.read<SettingsCubit>()),
    ),
    BlocProvider(
      create: (context) => DownloadManagerCubit(
          const DownloadManagerState(), context.read<PlayerCubit>()),
    )
  ], child: const MyApp()));
}

late ColorScheme darkColorScheme;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
        buildWhen: (previous, current) =>
            previous.selectedIndex == current.selectedIndex ||
            previous.server != current.server,
        // we want to rebuild only when anything other than the navigation index is changed
        builder: (context, _) {
          bool useDynamicTheme = context
              .select((SettingsCubit value) => value.state.useDynamicTheme);
          bool useBlackBackground = context
              .select((SettingsCubit value) => value.state.blackBackground);
          String? locale =
              context.select((SettingsCubit value) => value.state.locale);
          ThemeMode themeMode =
              context.select((SettingsCubit value) => value.state.themeMode);

          var navigationBarBehavior = context
              .select((SettingsCubit s) => s.state.navigationBarLabelBehavior);

          return DynamicColorBuilder(
              builder: (ColorScheme? lightDynamic, ColorScheme? darkDynamic) {
            ColorScheme lightColorScheme;

            if (useDynamicTheme &&
                lightDynamic != null &&
                darkDynamic != null) {
              // On Android S+ devices, use the provided dynamic color scheme.
              // (Recommended) Harmonize the dynamic color scheme' built-in semantic colors.
              lightColorScheme = lightDynamic.harmonized();
              // (Optional) Customize the scheme as desired. For example, one might
              // want to use a brand color to override the dynamic [ColorScheme.secondary].
              // lightColorScheme = lightColorScheme.copyWith(secondary: brandColor);
              // (Optional) If applicable, harmonize custom colors.
              // lightCustomColors = lightCustomColors.harmonized(lightColorScheme);

              // Repeat for the dark color scheme.
              darkColorScheme = darkDynamic.harmonized();
              // darkColorScheme = darkColorScheme.copyWith(secondary: brandColor);
              // darkCustomColors = darkCustomColors.harmonized(darkColorScheme);

              // _isDemoUsingDynamicColors = true; // ignore, only for demo purposes
            } else {
              // Otherwise, use fallback schemes.
              lightColorScheme = ColorScheme.fromSeed(
                seedColor: brandColor,
              );
              darkColorScheme = ColorScheme.fromSeed(
                seedColor: brandColor,
                brightness: Brightness.dark,
              );
            }

            if (useBlackBackground) {
              darkColorScheme =
                  darkColorScheme.copyWith(background: Colors.black);
            }

            List<String>? localeString;
            var dbLocale = locale;
            if (dbLocale != null && dbLocale != 'null') {
              localeString = dbLocale.split('_');
            }

            log.fine(
                'locale from db ${db.getSettings(localeSettingName)?.value} from cubit: $dbLocale, $localeString');
            Locale? savedLocale = localeString != null
                ? Locale.fromSubtags(
                    languageCode: localeString[0],
                    scriptCode:
                        localeString.length >= 2 ? localeString[1] : null)
                : null;

            var colors = getColorSchemeOutsideOfMaterial(context,
                dark: darkColorScheme, light: lightColorScheme);

            var navigationBarTheme = NavigationBarThemeData(
              elevation: 0,
              backgroundColor: colors.background,
              labelBehavior: navigationBarBehavior,
            );

            var appBarTheme = AppBarTheme(
                backgroundColor: colors.background,
                elevation: 0,
                scrolledUnderElevation: 0,
                systemOverlayStyle: getUiOverlayStyle(context,
                    dark: darkColorScheme, light: lightColorScheme));

            return MaterialApp.router(
              routerConfig: appRouter.config(
                navigatorObservers: () => [MyRouteObserver()],
              ),
              locale: savedLocale,
              localizationsDelegates: AppLocalizations.localizationsDelegates,
              localeListResolutionCallback: (locales, supportedLocales) {
                log.info(
                    'device locales=$locales supported locales=$supportedLocales, saved: $savedLocale');
                if (savedLocale != null) {
                  log.info("using saved locale, $savedLocale");
                  return savedLocale;
                }
                if (locales != null) {
                  for (Locale locale in locales) {
                    // if device language is supported by the app,
                    // just return it to set it as current app language
                    if (supportedLocales.contains(locale)) {
                      log.info("Locale match found, $locale");
                      return locale;
                    } else {
                      Locale? match = supportedLocales
                          .where((element) =>
                              element.languageCode == locale.languageCode)
                          .firstOrNull;
                      if (match != null) {
                        log.info("found partial match $locale with $match");
                        return match;
                      }
                    }
                  }
                }
                // if device language is not supported by the app,
                // the app will set it to english but return this to set to Bahasa instead
                log.info("locale not supported, returning english");
                return const Locale('en', 'US');
              },
              supportedLocales: AppLocalizations.supportedLocales,
              scaffoldMessengerKey: scaffoldKey,
              debugShowCheckedModeBanner: false,
              themeMode: ThemeMode.values.firstWhere(
                  (element) => element.name == themeMode.name,
                  orElse: () => ThemeMode.system),
              title: 'Clipious',
              theme: ThemeData(
                  useMaterial3: true,
                  colorScheme: lightColorScheme,
                  navigationBarTheme: navigationBarTheme,
                  appBarTheme: appBarTheme,
                  progressIndicatorTheme: ProgressIndicatorThemeData(
                      circularTrackColor: lightColorScheme.secondaryContainer
                          .withOpacity(0.8))),
              darkTheme: ThemeData(
                  useMaterial3: true,
                  colorScheme: darkColorScheme,
                  appBarTheme: appBarTheme,
                  navigationBarTheme: navigationBarTheme,
                  progressIndicatorTheme: ProgressIndicatorThemeData(
                      circularTrackColor:
                          darkColorScheme.secondaryContainer.withOpacity(0.8))),
            );
          });
        });
  }
}
