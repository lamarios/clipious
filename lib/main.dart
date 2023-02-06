import 'package:fbroadcast/fbroadcast.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:invidious/globals.dart';
import 'package:invidious/views/popular.dart';
import 'package:invidious/views/search.dart';
import 'package:invidious/views/settings.dart';
import 'package:invidious/views/subscriptions.dart';
import 'package:invidious/views/trending.dart';
import 'package:invidious/views/video.dart';
import 'package:dynamic_color/dynamic_color.dart';

import 'database.dart';

const brandColor = Color(0xFF1E88E5);

final scaffoldKey = GlobalKey<ScaffoldMessengerState>();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  db = await DbClient.create();
  runApp(const MyApp());
}

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
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: colorScheme.background));

      return MaterialApp(
          scaffoldMessengerKey: scaffoldKey,
          title: 'Ticnoaf',
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
  int selectedIndex = 0;
  bool isLoggedIn = db.isLoggedInToCurrentServer();

  @override
  initState() {
    super.initState();
    FBroadcast.instance().register(BROADCAST_SERVER_CHANGED, (value, callback) {
      setState(() {
        selectedIndex = 0;
        isLoggedIn = db.isLoggedInToCurrentServer();
      });
    });
  }

  openSettings(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => Settings()));
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;

    var navigationWidgets = <Widget>[
      NavigationDestination(icon: Icon(Icons.local_fire_department), label: 'Popular'),
      NavigationDestination(icon: Icon(Icons.trending_up), label: 'Trending'),
      NavigationDestination(icon: Icon(Icons.search), label: 'Search')
    ];
    if (isLoggedIn) {
      navigationWidgets.add(const NavigationDestination(icon: Icon(Icons.subscriptions), label: 'Subscriptions'));
    }

    return Scaffold(
        backgroundColor: colorScheme.background,
        bottomNavigationBar: NavigationBar(
          labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
          elevation: 0,
          onDestinationSelected: (int index) {
            print(index);
            setState(() {
              selectedIndex = index;
            });
          },
          selectedIndex: selectedIndex,
          destinations: navigationWidgets,
        ),
        body: SafeArea(
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
                const Search(key: ValueKey(2)),
                const Subscriptions(
                  key: ValueKey(3),
                )
              ][selectedIndex],
              transitionBuilder: (Widget child, Animation<double> animation) {
                return FadeTransition(opacity: animation, child: child);
              },
            ),
            Positioned(
                top: 10,
                right: 10,
                child: GestureDetector(
                  onTap: () => openSettings(context),
                  child: Icon(
                    Icons.settings,
                    color: colorScheme.primary,
                  ),
                ))
          ]),
        ));
  }
}
