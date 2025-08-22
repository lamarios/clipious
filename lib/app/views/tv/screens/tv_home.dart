import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:clipious/l10n/generated/app_localizations.dart';
import 'package:clipious/app/states/tv_home.dart';
import 'package:clipious/globals.dart';
import 'package:clipious/settings/states/settings.dart';
import 'package:clipious/utils/models/paginated_list.dart';
import 'package:clipious/utils/views/tv/components/tv_button.dart';
import 'package:clipious/utils/views/tv/components/tv_overscan.dart';
import 'package:clipious/videos/views/components/subscriptions.dart';
import 'package:clipious/videos/views/components/trending.dart';

import '../../../../home/models/db/home_layout.dart';
import '../../../../router.dart';
import '../../../../utils/views/components/app_icon.dart';
import '../../../../videos/views/components/popular.dart';
import '../../../states/app.dart';

const overlayBackgroundOpacity = 0.8;
const double overlayBlur = 25.0;
GlobalKey popularTitle = GlobalKey(debugLabel: 'popular title');
GlobalKey subscriptionTitle = GlobalKey(debugLabel: 'subscription title');
GlobalKey trendingTitle = GlobalKey(debugLabel: 'trending title');

@RoutePage()
class TvHomeScreen extends StatelessWidget {
  const TvHomeScreen({super.key});

  openSettings(BuildContext context) {
    AutoRouter.of(context).push(const TVSettingsRoute());
  }

  openPopular(BuildContext context) {
    var locals = AppLocalizations.of(context)!;
    AutoRouter.of(context).push(TvGridRoute(
        paginatedVideoList: SingleEndpointList(service.getPopular),
        title: locals.popular));
  }

  openTrending(BuildContext context) {
    var locals = AppLocalizations.of(context)!;
    AutoRouter.of(context).push(TvGridRoute(
        paginatedVideoList: SingleEndpointList(service.getTrending),
        title: locals.trending));
  }

  openSubscriptions(BuildContext context) {
    var locals = AppLocalizations.of(context)!;
    AutoRouter.of(context).push(TvGridRoute(
        paginatedVideoList: SubscriptionVideoList(),
        title: locals.subscriptions));
  }

  openSearch(BuildContext context) {
    AutoRouter.of(context).push(const TvSearchRoute());
  }

  openPlaylists(BuildContext context) {
    AutoRouter.of(context).push(TvPlaylistGridRoute(
        playlistList: SingleEndpointList(service.getUserPlaylists)));
  }

  @override
  Widget build(BuildContext context) {
    ColorScheme colors = Theme.of(context).colorScheme;
    TextTheme textTheme = Theme.of(context).textTheme;
    var locals = AppLocalizations.of(context)!;
    return Shortcuts(
      shortcuts: <LogicalKeySet, Intent>{
        LogicalKeySet(LogicalKeyboardKey.select): const ActivateIntent(),
      },
      child: BlocProvider(
        create: (BuildContext context) => TvHomeCubit(false),
        child: Scaffold(
          body: BlocBuilder<TvHomeCubit, bool>(builder: (context, homeState) {
            var homeCubit = context.read<TvHomeCubit>();
            var appLayout =
                context.select((SettingsCubit value) => value.state.appLayout);
            var isLoggedIn =
                context.select((AppCubit value) => value.isLoggedIn);
            var allowedPages = appLayout
                .where((element) => element.isPermitted(context, isLoggedIn))
                .toList();
            return BlocBuilder<AppCubit, AppState>(
                buildWhen: (previous, current) {
              return previous.server != current.server;
            }, builder: (context, state) {
              return DefaultTextStyle(
                style: textTheme.bodyLarge!,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    AnimatedContainer(
                      width: homeState ? 250 : 118,
                      duration: animationDuration ~/ 2,
                      curve: Curves.easeInOutQuad,
                      decoration: BoxDecoration(
                          color: homeState
                              ? colors.secondaryContainer.withValues(alpha: 0.5)
                              : Colors.transparent),
                      child: Padding(
                          padding: EdgeInsets.only(
                              top: TvOverscan.vertical,
                              left: TvOverscan.horizontal,
                              bottom: TvOverscan.vertical,
                              right: homeState ? TvOverscan.horizontal : 8),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
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
                                          if (homeState)
                                            Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 16.0),
                                                child: MenuItemText(
                                                  'Clipious',
                                                  style: textTheme.titleLarge!
                                                      .copyWith(
                                                          color:
                                                              colors.primary),
                                                ))
                                        ],
                                      )),
                                ),
                                Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: allowedPages
                                        .map(
                                          (e) => Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 8.0),
                                            child: TvButton(
                                              onFocusChanged: homeCubit
                                                  .menuItemFocusChanged,
                                              onPressed: (context) =>
                                                  switch (e) {
                                                (HomeDataSource.search) =>
                                                  openSearch(context),
                                                (HomeDataSource.subscription) =>
                                                  openSubscriptions(context),
                                                (HomeDataSource.playlist) =>
                                                  openPlaylists(context),
                                                (HomeDataSource.trending) =>
                                                  openTrending(context),
                                                (HomeDataSource.popular) =>
                                                  openPopular(context),
                                                (_) => const SizedBox.shrink()
                                              },
                                              unfocusedColor: colors
                                                  .secondaryContainer
                                                  .withValues(alpha: 0.0),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8),
                                                child: Row(
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              right: 8.0),
                                                      child: Icon(e.getIcon()),
                                                    ),
                                                    if (homeState)
                                                      MenuItemText(
                                                          e.getLabel(locals))
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        )
                                        .toList()),
                                TvButton(
                                  onFocusChanged:
                                      homeCubit.menuItemFocusChanged,
                                  onPressed: (context) => openSettings(context),
                                  unfocusedColor: colors.secondaryContainer
                                      .withValues(alpha: 0.0),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8),
                                    child: Row(
                                      children: [
                                        const Padding(
                                          padding: EdgeInsets.only(right: 8.0),
                                          child: Icon(Icons.settings),
                                        ),
                                        if (homeState)
                                          MenuItemText(locals.settings)
                                      ],
                                    ),
                                  ),
                                )
                              ])),
                    ),
                    Expanded(
                      // terrible work around to be able to scroll to all the global keys
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: TvOverscan.vertical,
                              bottom: TvOverscan.vertical,
                              right: TvOverscan.horizontal,
                              left: 8),
                          child: ListView(
                            controller: homeCubit.scrollController,
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            // crossAxisAlignment: CrossAxisAlignment.start,
                            children: allowedPages
                                .where((e) =>
                                    e == HomeDataSource.subscription ||
                                    e == HomeDataSource.trending ||
                                    e == HomeDataSource.popular)
                                .map((e) {
                              GlobalKey? key = switch (e) {
                                (HomeDataSource.popular) => popularTitle,
                                (HomeDataSource.subscription) =>
                                  subscriptionTitle,
                                (HomeDataSource.trending) => trendingTitle,
                                (_) => null,
                              };

                              focusFunction(video, index, focus) {
                                if (key != null && focus) {
                                  Scrollable.ensureVisible(key.currentContext!,
                                      duration: animationDuration,
                                      curve: Curves.easeInOutQuad,
                                      alignmentPolicy:
                                          ScrollPositionAlignmentPolicy
                                              .keepVisibleAtStart);
                                }
                              }

                              return Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    key: key,
                                    padding: const EdgeInsets.only(top: 16.0),
                                    child: Text(e.getLabel(locals),
                                        style: textTheme.titleLarge),
                                  ),
                                  switch (e) {
                                    (HomeDataSource.popular) => Popular(
                                        onItemFocus: focusFunction,
                                      ),
                                    (HomeDataSource.subscription) =>
                                      Subscriptions(
                                        onItemFocus: focusFunction,
                                      ),
                                    (HomeDataSource.trending) => Trending(
                                        onItemFocus: focusFunction,
                                      ),
                                    (_) => const SizedBox.shrink(),
                                  }
                                ],
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            });
          }),
        ),
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
    )
        .animate()
        .fadeIn(delay: animationDuration ~/ 2, duration: animationDuration ~/ 2)
        .slideX(curve: Curves.easeInOutQuad);
  }
}
