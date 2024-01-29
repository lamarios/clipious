import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:invidious/app/states/app.dart';
import 'package:invidious/globals.dart';
import 'package:invidious/home/models/db/home_layout.dart';
import 'package:invidious/home/states/home.dart';
import 'package:invidious/router.dart';

import '../../../utils/views/components/app_icon.dart';

const double smallVideoViewHeight = 140;

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  static openSearch(BuildContext context, String search) {
    AutoRouter.of(context)
        .push(SearchRoute(
          query: search,
          searchNow: true,
        ))
        .then((value) => context.read<AppCubit>().updateLayout());
  }

  List<Widget> getSmallSources(
      BuildContext context, HomeLayout layout, bool isLoggedIn) {
    var textTheme = Theme.of(context).textTheme;
    var colors = Theme.of(context).colorScheme;
    var locals = AppLocalizations.of(context)!;
    return layout.smallSources
        .where((element) => element.isPermitted(context, isLoggedIn))
        .map((e) => Padding(
              key: ValueKey(e),
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 2.0),
                    child: Text(
                      e.getLabel(locals),
                      style: textTheme.titleSmall
                          ?.copyWith(color: colors.secondary),
                    ),
                  ),
                  e.build(context, true)
                ],
              ),
            ))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    var colors = Theme.of(context).colorScheme;

    return BlocProvider(
      create: (context) => HomeCubit(false),
      child: Builder(builder: (context) {
        var layout = context.select((AppCubit value) => value.state.homeLayout);
        var textTheme = Theme.of(context).textTheme;
        var locals = AppLocalizations.of(context)!;
        var scrolled = context.select((HomeCubit home) => home.state);
        var home = context.read<HomeCubit>();
        var isLoggedIn = context.select((AppCubit value) => value.isLoggedIn);

        return NotificationListener(
          onNotification: (notificationInfo) {
            if (notificationInfo is ScrollUpdateNotification &&
                (notificationInfo.metrics.axisDirection == AxisDirection.down ||
                    notificationInfo.metrics.axisDirection ==
                        AxisDirection.up)) {
              home.setScroll(notificationInfo.metrics.pixels > 100);
            }
            return true;
          },
          child: Container(
              // only left because we don't want to cut horizontal scrolling lists
              padding: const EdgeInsets.only(left: innerHorizontalPadding),
              color: colors.background,
              child: layout.smallSources.isEmpty && !layout.showBigSource
                  ? const Opacity(
                      opacity: 0.2,
                      child: AppIcon(
                        height: 200,
                      ))
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AnimatedCrossFade(
                          crossFadeState: scrolled
                              ? CrossFadeState.showSecond
                              : CrossFadeState.showFirst,
                          firstCurve: Curves.easeInOutQuad,
                          secondCurve: Curves.easeInOutQuad,
                          sizeCurve: Curves.easeInOutQuad,
                          duration: animationDuration,
                          firstChild: Column(
                              mainAxisSize: MainAxisSize.min,
                              children:
                                  getSmallSources(context, layout, isLoggedIn)),
                          secondChild: const Row(
                            children: [
                              SizedBox.shrink(),
                            ],
                          ),
                        ),
                        if (layout.showBigSource)
                          Row(
                            children: [
                              Text(
                                layout.bigSource.getLabel(locals),
                                style: textTheme.titleMedium
                                    ?.copyWith(color: colors.secondary),
                              ),
                            ],
                          ),
                        if (layout.showBigSource)
                          Expanded(
                              key: ValueKey(layout.bigSource),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    right: innerHorizontalPadding),
                                child: layout.bigSource.build(context, false),
                              ))
                      ],
                    )),
        );
      }),
    );
  }
}
