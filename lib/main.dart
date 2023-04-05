import 'dart:async';

import 'package:after_layout/after_layout.dart';
import 'package:back_button_interceptor/back_button_interceptor.dart';
import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';
import 'package:invidious/controllers/homeController.dart';
import 'package:invidious/controllers/miniPayerController.dart';
import 'package:invidious/globals.dart';
import 'package:invidious/views/components/miniPlayerAware.dart';
import 'package:invidious/views/miniPlayer.dart';
import 'package:invidious/views/playlists.dart';
import 'package:invidious/views/popular.dart';
import 'package:invidious/views/searchDelegate.dart';
import 'package:invidious/views/settings.dart';
import 'package:invidious/views/subscriptions.dart';
import 'package:invidious/views/trending.dart';
import 'package:invidious/views/welcomeWizard.dart';
import 'package:logging/logging.dart';

import 'database.dart';
import 'myRouteObserver.dart';

const brandColor = Color(0xFF4f0096);

final scaffoldKey = GlobalKey<ScaffoldMessengerState>();
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> globalNavigator = GlobalKey<NavigatorState>();
final RouteObserver<ModalRoute> routeObserver = MyRouteObserver();

Future<void> main() async {
  Logger.root.level = Level.ALL; // defaults to Level.INFO
  Logger.root.onRecord.listen((record) {
    debugPrint('[${record.level.name}] [${record.loggerName}] ${record.message}');
  });

  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  db = await DbClient.create();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    bool showWizard = false;
    bool useDynamicTheme = db.getSettings(DYNAMIC_THEME)?.value == 'true';
    try {
      db.getCurrentlySelectedServer();
    } catch (err) {
      showWizard = true;
    }

    // TODO: implement build
    return DynamicColorBuilder(builder: (ColorScheme? lightDynamic, ColorScheme? darkDynamic) {
      ColorScheme lightColorScheme;
      ColorScheme darkColorScheme;

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
      return GetMaterialApp(
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          scaffoldMessengerKey: scaffoldKey,
          navigatorKey: globalNavigator,
          title: 'Clipious',
          theme: ThemeData(
            useMaterial3: true,
            colorScheme: lightColorScheme,
          ),
          darkTheme: ThemeData(useMaterial3: true, colorScheme: darkColorScheme),
          home: Stack(
            children: [
              MiniPlayerAware(
                child: Navigator(
                    observers: [MyRouteObserver()],
                    key: navigatorKey,
                    initialRoute: '/',
                    onGenerateRoute: (settings) {
                      if (settings.name == '/') {
                        return GetPageRoute(page: () => showWizard ? const WelcomeWizard() : const Home());
                      }
                    }),
              ),
              const MiniPlayer()
            ],
          ));
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
    List<String> navigationLabels = [locals.popular, locals.trending, locals.subscriptions, locals.playlists];

    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (_) {
        var navigationWidgets = <Widget>[
          NavigationDestination(icon: const Icon(Icons.local_fire_department), label: navigationLabels[0]),
          NavigationDestination(icon: const Icon(Icons.trending_up), label: navigationLabels[1]),
        ];
        if (_.isLoggedIn) {
          navigationWidgets.add(NavigationDestination(icon: const Icon(Icons.subscriptions), label: navigationLabels[2]));
          navigationWidgets.add(NavigationDestination(icon: const Icon(Icons.playlist_play), label: navigationLabels[3]));
        }

        return Scaffold(
            backgroundColor: colorScheme.background,
            bottomNavigationBar: NavigationBar(
              labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
              elevation: 0,
              onDestinationSelected: _.selectIndex,
              selectedIndex: _.selectedIndex,
              destinations: navigationWidgets,
            ),
            floatingActionButton: _.selectedIndex == 3 ? AddPlayListButton() : null,
            appBar: AppBar(
              systemOverlayStyle: SystemUiOverlayStyle(
                  systemNavigationBarColor: colorScheme.background,
                  systemNavigationBarIconBrightness: colorScheme.brightness == Brightness.dark ? Brightness.light : Brightness.dark,
                  statusBarColor: colorScheme.background,
                  statusBarIconBrightness: colorScheme.brightness == Brightness.dark ? Brightness.light : Brightness.dark),
              title: Text(navigationLabels[_.selectedIndex]),
              scrolledUnderElevation: 0,
              // backgroundColor: Colors.pink,
              backgroundColor: colorScheme.background,
              actions: [
                IconButton(
                  onPressed: () {
                    showSearch(context: context, delegate: MySearchDelegate());
                  },
                  icon: const Icon(Icons.search),
                ),
                IconButton(
                  onPressed: () => openSettings(context),
                  icon: const Icon(Icons.settings),
                  color: colorScheme.secondary,
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
                      const Playlists(
                        key: ValueKey(3),
                        canDeleteVideos: true,
                      )
                    ][_.selectedIndex],
                  )
                ])));
      },
    );
  }

  @override
  FutureOr<void> afterFirstLayout(BuildContext context) {}
}
