import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:invidious/app/states/tv_home.dart';
import 'package:invidious/globals.dart';
import 'package:invidious/playlists/views/tv/screens/playlist_grid.dart';
import 'package:invidious/search/views/tv/screens/search.dart';
import 'package:invidious/settings/views/tv/screens/settings.dart';
import 'package:invidious/utils/models/paginatedList.dart';
import 'package:invidious/utils/views/tv/components/tv_button.dart';
import 'package:invidious/utils/views/tv/components/tv_overscan.dart';
import 'package:invidious/videos/views/components/subscriptions.dart';
import 'package:invidious/videos/views/components/trending.dart';
import 'package:invidious/videos/views/tv/screens/video_grid_view.dart';

import '../../../../utils/views/components/app_icon.dart';
import '../../../../videos/views/components/popular.dart';
import '../../../states/app.dart';

const overlayBackgroundOpacity = 0.8;
const double overlayBlur = 25.0;

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

  openSearch(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (builder) => const TvSearch()));
  }

  openPlaylists(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => TvPlaylistGridView(
        playlistList: SingleEndpointList(service.getUserPlaylists),
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    ColorScheme colors = Theme.of(context).colorScheme;
    TextTheme textTheme = Theme.of(context).textTheme;
    var locals = AppLocalizations.of(context)!;

    return BlocProvider(
      create: (BuildContext context) => TvHomeCubit(false),
      child: Scaffold(
        body: BlocBuilder<TvHomeCubit, bool>(builder: (context, expandMenu) {
          var cubit = context.read<TvHomeCubit>();
          return BlocBuilder<AppCubit, AppState>(buildWhen: (previous, current) {
            return previous.server != current.server;
          }, builder: (context, _) {
            var app = context.read<AppCubit>();
            return DefaultTextStyle(
              style: textTheme.bodyLarge!,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  AnimatedContainer(
                    width: expandMenu ? 250 : 118,
                    duration: animationDuration ~/ 2,
                    curve: Curves.easeInOutQuad,
                    decoration: BoxDecoration(color: expandMenu ? colors.secondaryContainer.withOpacity(0.5) : Colors.transparent),
                    child: Padding(
                        padding: EdgeInsets.only(top: TvOverscan.vertical, left: TvOverscan.horizontal, bottom: TvOverscan.vertical, right: expandMenu ? TvOverscan.horizontal : 8),
                        child: Column(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start, children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 30.0),
                            child: SizedBox(
                                height: 50,
                                child: Row(
                                  children: [
                                    const AppIcon(
                                      width: 50,
                                      height: 50,
                                    ),
                                    if (expandMenu)
                                      Padding(
                                          padding: const EdgeInsets.only(left: 16.0),
                                          child: MenuItemText(
                                            'Clipious',
                                            style: textTheme.titleLarge!.copyWith(color: colors.primary),
                                          ))
                                  ],
                                )),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: TvButton(
                              onFocusChanged: cubit.menuItemFocusChanged,
                              onPressed: openSearch,
                              unfocusedColor: colors.secondaryContainer.withOpacity(0.0),
                              child: Padding(
                                padding: const EdgeInsets.all(8),
                                child: Row(
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.only(right: 8.0),
                                      child: Icon(Icons.search),
                                    ),
                                    if (expandMenu) MenuItemText(locals.search)
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Visibility(
                            visible: app.isLoggedIn,
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 8.0),
                              child: TvButton(
                                onFocusChanged: cubit.menuItemFocusChanged,
                                onPressed: openSubscriptions,
                                unfocusedColor: colors.secondaryContainer.withOpacity(0.0),
                                child: Padding(
                                  padding: const EdgeInsets.all(8),
                                  child: Row(
                                    children: [
                                      const Padding(
                                        padding: EdgeInsets.only(right: 8.0),
                                        child: Icon(Icons.subscriptions),
                                      ),
                                      if (expandMenu) MenuItemText(locals.subscriptions)
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Visibility(
                            visible: app.isLoggedIn,
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 8.0),
                              child: TvButton(
                                onFocusChanged: cubit.menuItemFocusChanged,
                                onPressed: openPlaylists,
                                unfocusedColor: colors.secondaryContainer.withOpacity(0.0),
                                child: Padding(
                                  padding: const EdgeInsets.all(8),
                                  child: Row(
                                    children: [
                                      const Padding(
                                        padding: EdgeInsets.only(right: 8.0),
                                        child: Icon(Icons.playlist_play),
                                      ),
                                      if (expandMenu) MenuItemText(locals.playlists)
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: TvButton(
                              onFocusChanged: cubit.menuItemFocusChanged,
                              onPressed: openPopular,
                              unfocusedColor: colors.secondaryContainer.withOpacity(0.0),
                              child: Padding(
                                padding: const EdgeInsets.all(8),
                                child: Row(
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.only(right: 8.0),
                                      child: Icon(Icons.local_fire_department),
                                    ),
                                    if (expandMenu) MenuItemText(locals.popular)
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: TvButton(
                              onFocusChanged: cubit.menuItemFocusChanged,
                              onPressed: openTrending,
                              unfocusedColor: colors.secondaryContainer.withOpacity(0.0),
                              child: Padding(
                                padding: const EdgeInsets.all(8),
                                child: Row(
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.only(right: 8.0),
                                      child: Icon(Icons.trending_up),
                                    ),
                                    if (expandMenu) MenuItemText(locals.trending)
                                  ],
                                ),
                              ),
                            ),
                          ),
                          TvButton(
                            onFocusChanged: cubit.menuItemFocusChanged,
                            onPressed: (context) => openSettings(context),
                            unfocusedColor: colors.secondaryContainer.withOpacity(0.0),
                            child: Padding(
                              padding: const EdgeInsets.all(8),
                              child: Row(
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.only(right: 8.0),
                                    child: Icon(Icons.settings),
                                  ),
                                  if (expandMenu) MenuItemText(locals.settings)
                                ],
                              ),
                            ),
                          )
                        ])),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(top: TvOverscan.vertical, bottom: TvOverscan.vertical, right: TvOverscan.horizontal, left: 8),
                      child: ListView(
                        // crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Visibility(
                            visible: app.isLoggedIn,
                            child: Text(
                              locals.subscriptions,
                              style: textTheme.titleLarge,
                            ),
                          ),
                          Visibility(
                            visible: app.isLoggedIn,
                            child: const Padding(
                              padding: EdgeInsets.only(bottom: 16.0),
                              child: Subscriptions(),
                            ),
                          ),
                          Text(locals.popular, style: textTheme.titleLarge),
                          const Padding(
                            padding: EdgeInsets.only(bottom: 16.0),
                            child: Popular(),
                          ),
                          Text(
                            locals.trending,
                            style: textTheme.titleLarge,
                          ),
                          const Trending()
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          });
        }),
      ),
    );
  }
}

class MenuItemText extends StatelessWidget {
  final String text;
  final TextStyle? style;

  const MenuItemText(this.text, {super.key, this.style});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style,
    ).animate().fadeIn(delay: animationDuration ~/ 2, duration: animationDuration).slideX(curve: Curves.easeInOutQuad);
  }
}
