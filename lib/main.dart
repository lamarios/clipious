import 'dart:async';
import 'dart:io';

import 'package:after_layout/after_layout.dart';
import 'package:back_button_interceptor/back_button_interceptor.dart';
import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:invidious/app/states/app.dart';
import 'package:invidious/app/views/tv/screens/tv_home.dart';
import 'package:invidious/channels/views/screens/channel.dart';
import 'package:invidious/downloads/states/download_manager.dart';
import 'package:invidious/downloads/views/components/download_app_bar_button.dart';
import 'package:invidious/globals.dart';
import 'package:invidious/httpOverrides.dart';
import 'package:invidious/mediaHander.dart';
import 'package:invidious/player/states/player.dart';
import 'package:invidious/player/views/components/mini_player_aware.dart';
import 'package:invidious/player/views/components/player.dart';
import 'package:invidious/playlists/views/components/add_to_playlist_list.dart';
import 'package:invidious/search/views/screens/search.dart';
import 'package:invidious/settings/states/settings.dart';
import 'package:invidious/settings/views/screens/settings.dart';
import 'package:invidious/subscription_management/view/screens/manage_subscriptions.dart';
import 'package:invidious/utils.dart';
import 'package:invidious/videos/views/components/history.dart';
import 'package:invidious/videos/views/components/popular.dart';
import 'package:invidious/videos/views/components/subscriptions.dart';
import 'package:invidious/videos/views/components/trending.dart';
import 'package:invidious/videos/views/screens/video.dart';
import 'package:invidious/welcome_wizard/views/screens/welcome_wizard.dart';
import 'package:invidious/welcome_wizard/views/tv/screens/welcome_wizard.dart';
import 'package:logging/logging.dart';

import 'database.dart';
import 'myRouteObserver.dart';
import 'settings/models/db/app_logs.dart';

const brandColor = Color(0xFF4f0096);

final scaffoldKey = GlobalKey<ScaffoldMessengerState>();
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> globalNavigator = GlobalKey<NavigatorState>();
final RouteObserver<ModalRoute> routeObserver = MyRouteObserver();
bool isTv = false;

late MediaHandler mediaHandler;

final Logger log = Logger('main');

Future<void> main() async {
  Logger.root.level = kDebugMode ? Level.FINEST : Level.INFO; // defaults to Level.INFO
  Logger.root.onRecord.listen((record) {
    debugPrint('[${record.level.name}] [${record.loggerName}] ${record.message}');
    // we don't want debug
    if (record.level == Level.INFO || record.level == Level.SEVERE) {
      db.insertLogs(AppLog(logger: record.loggerName, level: record.level.name, time: record.time, message: record.message, stacktrace: record.stackTrace?.toString()));
    }
  });

  HttpOverrides.global = MyHttpOverrides();

  WidgetsFlutterBinding.ensureInitialized();
  isTv = await isDeviceTv();
  db = await DbClient.create();
  runApp(MultiBlocProvider(providers: [
    BlocProvider(
      create: (context) => AppCubit(AppState()),
    ),
    BlocProvider(
      create: (context) => SettingsCubit(SettingsState(), context.read<AppCubit>()),
    ),
    BlocProvider(
      create: (context) => PlayerCubit(PlayerState(), context.read<SettingsCubit>()),
    ),
    BlocProvider(
      create: (context) => DownloadManagerCubit(DownloadManagerState(), context.read<PlayerCubit>()),
    )
  ], child: const MyApp()));
}

late ColorScheme darkColorScheme;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
        buildWhen: (previous, current) => previous.selectedIndex == current.selectedIndex || previous.server != current.server,
        // we want to rebuild only when anything other than the navigation index is changed
        builder: (context, _) {
          var app = context.read<AppCubit>();
          var settings = context.read<SettingsCubit>();
          bool useDynamicTheme = settings.state.useDynamicTheme;
          bool showWizard = false;

          if (app.state.server == null) {
            showWizard = true;
          }

          return DynamicColorBuilder(builder: (ColorScheme? lightDynamic, ColorScheme? darkDynamic) {
            ColorScheme lightColorScheme;

            if (useDynamicTheme && lightDynamic != null && darkDynamic != null) {
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

            if (settings.state.blackBackground) {
              darkColorScheme = darkColorScheme.copyWith(background: Colors.black);
            }

            List<String>? localeString;
            var dbLocale = settings.state.locale;
            if (dbLocale != null && dbLocale != 'null') {
              localeString = dbLocale.split('_');
            }

            log.fine('locale from db ${db.getSettings(LOCALE)?.value} from cubit: ${dbLocale}, ${localeString}');
            Locale? savedLocale = localeString != null ? Locale.fromSubtags(languageCode: localeString[0], scriptCode: localeString.length >= 2 ? localeString[1] : null) : null;

            return MaterialApp(
                locale: savedLocale,
                localizationsDelegates: AppLocalizations.localizationsDelegates,
                localeListResolutionCallback: (locales, supportedLocales) {
                  log.info('device locales=$locales supported locales=$supportedLocales, saved: $savedLocale');
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
                        Locale? match = supportedLocales.where((element) => element.languageCode == locale.languageCode).firstOrNull;
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
                navigatorKey: globalNavigator,
                debugShowCheckedModeBanner: false,
                themeMode: ThemeMode.values.firstWhere((element) => element.name == settings.state.themeMode.name, orElse: () => ThemeMode.system),
                title: 'Clipious',
                theme: ThemeData(
                    useMaterial3: true, colorScheme: lightColorScheme, progressIndicatorTheme: ProgressIndicatorThemeData(circularTrackColor: lightColorScheme.secondaryContainer.withOpacity(0.8))),
                darkTheme: ThemeData(
                    useMaterial3: true, colorScheme: darkColorScheme, progressIndicatorTheme: ProgressIndicatorThemeData(circularTrackColor: darkColorScheme.secondaryContainer.withOpacity(0.8))),
                home: Shortcuts(
                  shortcuts: <LogicalKeySet, Intent>{
                    LogicalKeySet(LogicalKeyboardKey.select): const ActivateIntent(),
                  },
                  child: isTv
                      ? showWizard
                          ? const TvWelcomeWizard()
                          : const TvHome()
                      : Stack(
                          children: [
                            MiniPlayerAware(
                              child: Navigator(
                                  observers: [MyRouteObserver()],
                                  key: navigatorKey,
                                  initialRoute: '/',
                                  onGenerateRoute: (settings) {
                                    switch (settings.name) {
                                      case "/":
                                        return MaterialPageRoute(builder: (context) => showWizard ? const WelcomeWizard() : const Home());
                                      case PATH_MANAGE_SUBS:
                                        return MaterialPageRoute(builder: (context) => const ManageSubscriptions(), settings: ROUTE_MANAGE_SUBSCRIPTIONS);
                                      case PATH_VIDEO:
                                        VideoRouteArguments args = settings.arguments as VideoRouteArguments;
                                        return MaterialPageRoute(
                                            builder: (context) => VideoView(
                                                  videoId: args.videoId,
                                                  playNow: args.playNow,
                                                ));
                                      case PATH_CHANNEL:
                                        if (settings.arguments is String) {
                                          return MaterialPageRoute(
                                            builder: (context) => ChannelView(channelId: settings.arguments! as String),
                                            settings: ROUTE_CHANNEL,
                                          );
                                        }
                                    }
                                  }),
                            ),
                            const Player()
                          ],
                        ),
                ));
          });
        });
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with AfterLayoutMixin {
  openSettings(BuildContext context) {
    navigatorKey.currentState?.push(MaterialPageRoute(settings: ROUTE_SETTINGS, builder: (context) => const Settings()));
  }

  openSubscriptionManagement(BuildContext context) {
    navigatorKey.currentState?.pushNamed(PATH_MANAGE_SUBS);
  }

  @override
  void initState() {
    super.initState();
    BackButtonInterceptor.add((stopDefaultButtonEvent, RouteInfo routeInfo) {
      if (routeInfo.currentRoute(context)?.settings.name != null) {
        navigatorKey.currentState?.pop();
        return true;
      } else {
        return false;
      }
    }, name: 'mainNavigator', zIndex: 0, ifNotYetIntercepted: true);
  }

  @override
  void dispose() {
    BackButtonInterceptor.removeByName('mainNavigator');
    super.dispose();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    var locals = AppLocalizations.of(context)!;
    List<String> navigationLabels = [locals.popular, locals.trending, locals.subscriptions, locals.playlists, locals.history];

    return BlocBuilder<AppCubit, AppState>(buildWhen: (previous, current) {
      return previous.selectedIndex != current.selectedIndex || previous.server != current.server;
    }, builder: (context, _) {
      var app = context.read<AppCubit>();

      var navigationWidgets = <Widget>[
        NavigationDestination(icon: const Icon(Icons.local_fire_department), label: navigationLabels[0]),
        NavigationDestination(icon: const Icon(Icons.trending_up), label: navigationLabels[1]),
      ];
      if (app.isLoggedIn) {
        navigationWidgets.add(NavigationDestination(icon: const Icon(Icons.subscriptions), label: navigationLabels[2]));
        navigationWidgets.add(NavigationDestination(icon: const Icon(Icons.playlist_play), label: navigationLabels[3]));
        navigationWidgets.add(NavigationDestination(icon: const Icon(Icons.history), label: navigationLabels[4]));
      }
      return Scaffold(
          key: ValueKey(_.server?.url),
          // so we rebuild the view if the server changes
          backgroundColor: colorScheme.background,
          bottomNavigationBar: NavigationBar(
            backgroundColor: colorScheme.background,
            labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
            elevation: 0,
            onDestinationSelected: app.selectIndex,
            selectedIndex: _.selectedIndex,
            destinations: navigationWidgets,
          ),
          appBar: AppBar(
            systemOverlayStyle: getUiOverlayStyle(context),
            title: Text(navigationLabels[_.selectedIndex]),
            scrolledUnderElevation: 0,
            // backgroundColor: Colors.pink,
            backgroundColor: colorScheme.background,
            actions: [
              _.selectedIndex == 2 ? IconButton(onPressed: () => openSubscriptionManagement(context), icon: const Icon(Icons.checklist)) : const SizedBox.shrink(),
              const AppBarDownloadButton(),
              IconButton(
                onPressed: () {
                  // showSearch(context: context, delegate: MySearchDelegate());
                  navigatorKey.currentState?.push(MaterialPageRoute(settings: ROUTE_SETTINGS, builder: (context) => const Search()));
                },
                icon: const Icon(Icons.search),
              ),
              IconButton(
                onPressed: () => openSettings(context),
                icon: const Icon(Icons.settings),
              ),
            ],
          ),
          body: SafeArea(
              bottom: false,
              child: Stack(children: [
                AnimatedSwitcher(
                  switchInCurve: Curves.easeInOutQuad,
                  switchOutCurve: Curves.easeInOutQuad,
                  transitionBuilder: (Widget child, Animation<double> animation) {
                    return FadeTransition(opacity: animation, child: child);
                  },
                  duration: animationDuration,
                  child: <Widget>[
                    const Popular(
                      key: ValueKey(0),
                    ),
                    const Trending(
                      key: ValueKey(1),
                    ),
                    const Subscriptions(
                      key: ValueKey(2),
                    ),
                    const AddToPlaylistList(
                      key: ValueKey(3),
                      canDeleteVideos: true,
                    ),
                    const HistoryView(
                      key: ValueKey(4),
                    ),
                  ][_.selectedIndex],
                )
              ])));
    });
  }

  @override
  FutureOr<void> afterFirstLayout(BuildContext context) {}
}
