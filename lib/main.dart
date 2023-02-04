import 'package:flutter/material.dart';
import 'package:invidious/globals.dart';
import 'package:invidious/views/popular.dart';
import 'package:invidious/views/trending.dart';
import 'package:invidious/views/video.dart';
import 'package:dynamic_color/dynamic_color.dart';

const brandColor = Color(0xFF1E88E5);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return const Home();
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  int selectedIndex = 0;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return DynamicColorBuilder(
        builder: (ColorScheme? lightDynamic, ColorScheme? darkDynamic) {
      ColorScheme lightColorScheme;
      ColorScheme darkColorScheme;

      if (lightDynamic != null && darkDynamic != null) {
        // On Android S+ devices, use the provided dynamic color scheme.
        // (Recommended) Harmonize the dynamic color scheme' built-in semantic colors.
        lightColorScheme = lightDynamic.harmonized();
        // (Optional) Customize the scheme as desired. For example, one might
        // want to use a brand color to override the dynamic [ColorScheme.secondary].
        lightColorScheme = lightColorScheme.copyWith(secondary: brandColor);
        // (Optional) If applicable, harmonize custom colors.
        // lightCustomColors = lightCustomColors.harmonized(lightColorScheme);

        // Repeat for the dark color scheme.
        darkColorScheme = darkDynamic.harmonized();
        darkColorScheme = darkColorScheme.copyWith(secondary: brandColor);
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

    return MaterialApp(
      title: 'Invidious client',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: lightColorScheme,
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: darkColorScheme
      ),
      home: Scaffold(
          backgroundColor: Theme.of(context).colorScheme.background,
          bottomNavigationBar: NavigationBar(
            onDestinationSelected: (int index) {
              print(index);
              setState(() {
                selectedIndex = index;
              });
            },

            selectedIndex: selectedIndex,
            destinations: const <Widget>[NavigationDestination(icon: Icon(Icons.trending_up), label: 'Trending'), NavigationDestination(icon: Icon(Icons.local_fire_department), label: 'Popular')],
          ),
          body: SafeArea(
              child: AnimatedSwitcher(
            duration: animationDuration,
            child: <Widget>[Trending(key: ValueKey(0),), Popular(key: ValueKey(1),)][selectedIndex],
            transitionBuilder: (Widget child, Animation<double> animation) {
              return FadeTransition(opacity: animation, child: child);
            },
          ))),
    );});
  }
}
