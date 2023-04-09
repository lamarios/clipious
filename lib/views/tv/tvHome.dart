import 'package:application_icon/application_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';
import 'package:invidious/controllers/tvHomeController.dart';
import 'package:invidious/globals.dart';
import 'package:invidious/models/paginatedList.dart';
import 'package:invidious/views/subscriptions.dart';
import 'package:invidious/views/trending.dart';
import 'package:invidious/views/tv/tvButton.dart';
import 'package:invidious/views/tv/tvSettings.dart';
import 'package:invidious/views/tv/tvVideoGridView.dart';

import '../../controllers/videoListController.dart';
import '../popular.dart';

class TvHome extends StatelessWidget {
  const TvHome({Key? key}) : super(key: key);

  openSettings(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (builder) => const TVSettings()));
  }

  openPopular(BuildContext context) {
    var locals = AppLocalizations.of(context)!;
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => TvGridView(paginatedVideoList: SingleEndpointList(service.getPopular), title: locals.popular),
    ));
  }

  openTrending(BuildContext context) {
    var locals = AppLocalizations.of(context)!;
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => TvGridView(
        paginatedVideoList: SingleEndpointList(service.getTrending),
        title: locals.trending,
      ),
    ));
  }

  openSubscriptions(BuildContext context) {
    var locals = AppLocalizations.of(context)!;
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => TvGridView(
        paginatedVideoList: SubscriptionVideoList(),
        title: locals.subscriptions,
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    ColorScheme colors = Theme.of(context).colorScheme;
    TextTheme textTheme = Theme.of(context).textTheme;
    var locals = AppLocalizations.of(context)!;
    const TextStyle titleStyle = TextStyle(fontSize: 20);
    bool isLoggedIn = service.isLoggedIn();

    return DefaultTextStyle(
      style: textTheme.bodyMedium!,
      child: Scaffold(
        body: GetBuilder<TvHomeController>(
            init: TvHomeController(),
            builder: (_) {
              return Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  AnimatedContainer(
                    width: _.expandMenu ? 200: 70,
                    duration: animationDuration ~/ 2,
                    curve: Curves.easeInOutQuad,
                    decoration: BoxDecoration(color: _.expandMenu ? colors.secondaryContainer.withOpacity(0.5) : Colors.transparent),
                    child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start, children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 30.0),
                            child: SizedBox(
                                height: 50,
                                child: Row(
                                  children: [
                                    const AppIconImage(),
                                    Visibility(
                                        visible: _.expandMenu,
                                        child: Text(
                                          'Clipious',
                                          style: TextStyle(color: colors.primary),
                                        ))
                                  ],
                                )),
                          ),
                          Visibility(
                            visible: isLoggedIn,
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 8.0),
                              child: TvButton(
                                onFocusChanged: _.menuItemFocusChanged,
                                onPressed: openSubscriptions,
                                unfocusedColor: Colors.transparent,
                                child: Padding(
                                  padding: const EdgeInsets.all(8),
                                  child: Row(
                                    children: [
                                      const Padding(
                                        padding: EdgeInsets.only(right: 8.0),
                                        child: Icon(Icons.subscriptions),
                                      ),
                                      _.expandMenu ? Text(locals.subscriptions) : const SizedBox.shrink()
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: TvButton(
                              onFocusChanged: _.menuItemFocusChanged,
                              onPressed: openPopular,
                              unfocusedColor: Colors.transparent,
                              child: Padding(
                                padding: const EdgeInsets.all(8),
                                child: Row(
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.only(right: 8.0),
                                      child: Icon(Icons.local_fire_department),
                                    ),
                                    _.expandMenu ? Text(locals.popular) : const SizedBox.shrink()
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: TvButton(
                              onFocusChanged: _.menuItemFocusChanged,
                              onPressed: openTrending,
                              unfocusedColor: Colors.transparent,
                              child: Padding(
                                padding: const EdgeInsets.all(8),
                                child: Row(
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.only(right: 8.0),
                                      child: Icon(Icons.trending_up),
                                    ),
                                    _.expandMenu ? Text(locals.trending) : const SizedBox.shrink()
                                  ],
                                ),
                              ),
                            ),
                          ),
                          TvButton(
                            onFocusChanged: _.menuItemFocusChanged,
                            onPressed: (context) => openSettings(context),
                            unfocusedColor: Colors.transparent,
                            child: Padding(
                              padding: const EdgeInsets.all(8),
                              child: Row(
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.only(right: 8.0),
                                    child: Icon(Icons.settings),
                                  ),
                                  _.expandMenu ? Text(locals.settings) : const SizedBox.shrink()
                                ],
                              ),
                            ),
                          )
                        ])),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 27),
                      child: ListView(
                        // crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Visibility(
                            visible: isLoggedIn,
                            child: Text(
                              locals.subscriptions,
                              style: titleStyle,
                            ),
                          ),
                          Visibility(
                            visible: isLoggedIn,
                            child: const Padding(
                              padding: EdgeInsets.only(bottom: 16.0),
                              child: Subscriptions(),
                            ),
                          ),
                          Text(locals.popular, style: titleStyle),
                          const Padding(
                            padding: EdgeInsets.only(bottom: 16.0),
                            child: Popular(),
                          ),
                          Text(
                            locals.trending,
                            style: titleStyle,
                          ),
                          const Trending()
                        ],
                      ),
                    ),
                  ),
                ],
              );
            }),
      ),
    );
  }
}
