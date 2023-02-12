import 'dart:async';

import 'package:dynamic_color/dynamic_color.dart';
import 'package:fbroadcast/fbroadcast.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:invidious/globals.dart';
import 'package:invidious/views/playlists.dart';
import 'package:invidious/views/popular.dart';
import 'package:invidious/views/search.dart';
import 'package:invidious/views/settings.dart';
import 'package:invidious/views/subscriptions.dart';
import 'package:invidious/views/trending.dart';
import 'package:invidious/views/video.dart';
import 'package:logging/logging.dart';
import 'package:receive_sharing_intent/receive_sharing_intent.dart';

import 'database.dart';

const brandColor = Color(0xFFFF7D00);

final scaffoldKey = GlobalKey<ScaffoldMessengerState>();
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

Future<void> main() async {
  Logger.root.level = Level.ALL; // defaults to Level.INFO
  Logger.root.onRecord.listen((record) {
    debugPrint('[${record.level.name}] [${record.loggerName}] ${record.message}');
  });


  WidgetsFlutterBinding.ensureInitialized();
  db = await DbClient.create();
  runApp(const MyApp());
}

final RouteObserver<ModalRoute> routeObserver = RouteObserver<ModalRoute>();

const List<String> navigationLabels = ['Popular', 'Trending', 'Subscriptions', 'Playlists'];

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return DynamicColorBuilder(builder: (ColorScheme? lightDynamic, ColorScheme? darkDynamic) {
      ColorScheme lightColorScheme;
      ColorScheme darkColorScheme;

      if (lightDynamic != null && darkDynamic != null) {
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
      var brightness = SchedulerBinding.instance.platformDispatcher.platformBrightness;
      ColorScheme colorScheme = brightness == Brightness.dark ? darkColorScheme : lightColorScheme;
      // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(systemNavigationBarColor: colorScheme.background, statusBarColor: colorScheme.background));

      return MaterialApp(
          scaffoldMessengerKey: scaffoldKey,
          title: 'Clipious',
          navigatorObservers: [routeObserver],
          navigatorKey: navigatorKey,
          theme: ThemeData(
            useMaterial3: true,
            colorScheme: lightColorScheme,
          ),
          darkTheme: ThemeData(useMaterial3: true, colorScheme: darkColorScheme),
          home: const Home());
    });
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  final log = Logger('Hone');
  int selectedIndex = 0;
  bool isLoggedIn = db.isLoggedInToCurrentServer();
  late StreamSubscription _intentDataStreamSubscription;

  @override
  initState() {
    super.initState();
    FBroadcast.instance().register(BROADCAST_SERVER_CHANGED, (value, callback) {
      setState(() {
        selectedIndex = 0;
        isLoggedIn = db.isLoggedInToCurrentServer();
      });
    });

    // For sharing or opening urls/text coming from outside the app while the app is in the memory
    _intentDataStreamSubscription = ReceiveSharingIntent.getTextStream().listen((String value) {
      openAppLink(value);
    }, onError: (err) {
      log.warning("getLinkStream error: $err");
    });

    // For sharing or opening urls/text coming from outside the app while the app is closed
    ReceiveSharingIntent.getInitialText().then((value) {
      setState(() {
        openAppLink((value ?? ''));
      });
    });
  }

  @override
  dispose() {
    _intentDataStreamSubscription.cancel();
    super.dispose();
  }

  void openAppLink(String url) {
    try {
      Uri uri = Uri.parse(url);
      if (YOUTUBE_HOSTS.contains(uri.host)) {
        if (uri.pathSegments.length == 1 && uri.pathSegments.contains("watch") && uri.queryParameters.containsKey('v')) {
          String videoId = uri.queryParameters['v']!;
          navigatorKey.currentState?.push(MaterialPageRoute(
              builder: (context) => VideoView(
                    videoId: videoId,
                  )));
        }
        if (uri.host == 'youtu.be' && uri.pathSegments.length == 1) {
          String videoId = uri.pathSegments[0];
          navigatorKey.currentState?.push(MaterialPageRoute(
              builder: (context) => VideoView(
                    videoId: videoId,
                  )));
        }
      }
    } catch (err) {
      // not a url;
    }
  }

  openSettings(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => Settings()));
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;

    var navigationWidgets = <Widget>[
      NavigationDestination(icon: const Icon(Icons.local_fire_department), label: navigationLabels[0]),
      NavigationDestination(icon: const Icon(Icons.trending_up), label: navigationLabels[1]),
    ];
    if (isLoggedIn) {
      navigationWidgets.add(NavigationDestination(icon: const Icon(Icons.subscriptions), label: navigationLabels[2]));
      navigationWidgets.add(NavigationDestination(icon: const Icon(Icons.playlist_play), label: navigationLabels[3]));
    }
    double statusHeight = MediaQuery.of(context).viewPadding.top;

    return Scaffold(
        backgroundColor: colorScheme.background,
        bottomNavigationBar: NavigationBar(
          labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
          elevation: 0,
          onDestinationSelected: (int index) {
            setState(() {
              selectedIndex = index;
            });
          },
          selectedIndex: selectedIndex,
          destinations: navigationWidgets,
        ),
        floatingActionButton: selectedIndex == 3 ? AddPlayListButton() : null,
        appBar: AppBar(
          title: Text(navigationLabels[selectedIndex]),
          scrolledUnderElevation: 0,
          // backgroundColor: Colors.pink,
          backgroundColor: colorScheme.background,
          actions: [
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const Search()));
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  Icons.search,
                  color: colorScheme.secondary,
                ),
              ),
            ),
            GestureDetector(
              onTap: () => openSettings(context),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  Icons.settings,
                  color: colorScheme.secondary,
                ),
              ),
            ),
          ],
        ),
/*
        appBar: EasySearchBar(
          searchBackgroundColor: colorScheme.background,
          elevation: 0,
          asyncSuggestions: searchSuggestions,
          title: Text(showSearchResults ? 'Search' : navigationLabels[selectedIndex]),
          backgroundColor: colorScheme.background,
          animationDuration: animationDuration,
          onSearchClosed: (){
            setState(() {
              showSearchResults = false;
            });
          },

          actions: [
            GestureDetector(
              onTap: () => openSettings(context),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  Icons.settings,
                  color: colorScheme.secondary,
                ),
              ),
            ),
          ],
          onSearch: search,

        ),
*/
        body: SafeArea(
            bottom: true,
            maintainBottomViewPadding: false,
            child: Stack(children: [
              AnimatedSwitcher(
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
                  )
                ][selectedIndex],
                transitionBuilder: (Widget child, Animation<double> animation) {
                  return FadeTransition(opacity: animation, child: child);
                },
              )
            ])));
  }
}
