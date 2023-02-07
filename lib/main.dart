import 'package:easy_debounce/easy_debounce.dart';
import 'package:easy_search_bar/easy_search_bar.dart';
import 'package:fbroadcast/fbroadcast.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
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

const List<String> navigationLabels = ['Popular', 'Trending', 'Subscriptions', 'Search'];

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
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(systemNavigationBarColor: colorScheme.background));

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
  bool showSearchResults = false;
  String searchQuery = '';
  TextEditingController searchController = TextEditingController();

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

  Future<List<String>> searchSuggestions(String query) async {
    return (await service.getSearchSuggestion(query)).suggestions;
  }

  search(String query) {
    EasyDebounce.debounce('search', const Duration(milliseconds: 500), () {
      setState(() {
        searchQuery = query;
        showSearchResults = true;
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
      NavigationDestination(icon: const Icon(Icons.local_fire_department), label: navigationLabels[0]),
      NavigationDestination(icon: const Icon(Icons.trending_up), label: navigationLabels[1]),
    ];
    if (isLoggedIn) {
      navigationWidgets.add(NavigationDestination(icon: const Icon(Icons.subscriptions), label: navigationLabels[2]));
    }
    if (showSearchResults) {
      navigationWidgets.add(NavigationDestination(icon: const Icon(Icons.search), label: navigationLabels[3]));
    }

    double statusHeight = MediaQuery.of(context).viewPadding.top;

    return Scaffold(
        backgroundColor: colorScheme.background,
        bottomNavigationBar: showSearchResults
            ? null
            : NavigationBar(
                labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
                elevation: 0,
                onDestinationSelected: (int index) {
                  setState(() {
                    showSearchResults = false;
                    selectedIndex = index;
                  });
                },
                selectedIndex: selectedIndex,
                destinations: navigationWidgets,
              ),
        appBar: showSearchResults
            ? PreferredSize(
                preferredSize: Size(double.infinity, statusHeight + (AppBarTheme.of(context).toolbarHeight ?? 100)),
                child: Container(
                  color: colorScheme.background,
                  // color: Colors.pink,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 12, right: 20, top: 25.0, bottom: 7),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 15.0),
                          child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  showSearchResults = false;
                                });
                              },
                              child: Icon(
                                Icons.arrow_back,
                                color: colorScheme.secondary,
                              )),
                        ),
                        Expanded(
                          child: TypeAheadField(
                            textFieldConfiguration: TextFieldConfiguration(
                                controller: searchController,
                                decoration: InputDecoration(
                                    icon: Icon(
                                  Icons.search,
                                  color: colorScheme.secondary,
                                )),
                                onSubmitted: search,
                                onChanged: search),
                            suggestionsCallback: searchSuggestions,
                            itemBuilder: (BuildContext context, String itemData) => ListTile(
                              title: Text(itemData),
                            ),
                            onSuggestionSelected: (String? suggestion) {
                              searchController.text = suggestion ?? '';
                              if (suggestion != null) {
                                search(suggestion);
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ))
            : AppBar(
                title: Text(showSearchResults ? 'Search' : navigationLabels[selectedIndex]),
                scrolledUnderElevation: 0,
                // backgroundColor: Colors.pink,
          backgroundColor: colorScheme.background,
                actions: [
                  GestureDetector(
                    onTap: () {
                      if (searchQuery.isNotEmpty) {
                        search(searchQuery);
                      }
                      setState(() {
                        showSearchResults = true;
                      });
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
            child: Stack(children: [
          AnimatedSwitcher(
            duration: animationDuration,
            child: showSearchResults
                ? Search(query: searchQuery)
                : <Widget>[
                    const Popular(
                      key: ValueKey(0),
                    ),
                    const Trending(
                      key: ValueKey(1),
                    ),
                    const Subscriptions(
                      key: ValueKey(2),
                    )
                  ][selectedIndex],
            transitionBuilder: (Widget child, Animation<double> animation) {
              return FadeTransition(opacity: animation, child: child);
            },
          )
        ])));
  }
}
