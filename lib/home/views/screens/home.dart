import 'package:auto_route/auto_route.dart';
import 'package:back_button_interceptor/back_button_interceptor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:invidious/app/states/app.dart';
import 'package:invidious/downloads/views/components/download_app_bar_button.dart';
import 'package:invidious/globals.dart';
import 'package:invidious/home/models/db/home_layout.dart';
import 'package:invidious/router.dart';
import 'package:invidious/settings/states/settings.dart';
import 'package:invidious/utils.dart';
import 'package:invidious/utils/views/components/app_icon.dart';

import '../../../notifications/notifications.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  openSettings(BuildContext context) {
    AutoRouter.of(context).push(const SettingsRoute());
  }

  openSubscriptionManagement(BuildContext context) {
    AutoRouter.of(context).push(const ManageSubscriptionsRoute());
  }

  openLayoutEditor(BuildContext context) {
    var app = context.read<AppCubit>();
    AutoRouter.of(context).push(const EditHomeLayoutRoute()).then((value) => app.updateLayout());
  }

  @override
  void initState() {
    super.initState();
    BackButtonInterceptor.add((stopDefaultButtonEvent, RouteInfo routeInfo) {
      var currentRoute = routeInfo.currentRoute(context);
      var settings2 = currentRoute?.settings;
      if (settings2?.name != 'HomeRoute') {
        AutoRouter.of(context).pop();
        // navigatorKey.currentState?.pop();
        return true;
      } else {
        return false;
      }
    }, name: 'mainNavigator', zIndex: 0, ifNotYetIntercepted: true);

    // Only after at least the action method is set, the notification events are delivered
    notifications.getNotificationAppLaunchDetails().then((details) {
      if(details?.notificationResponse != null){
         onDidReceiveNotificationResponse(details!.notificationResponse!);
      }
    });
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

    return BlocBuilder<AppCubit, AppState>(buildWhen: (previous, current) {
      return previous.selectedIndex != current.selectedIndex || previous.server != current.server;
    }, builder: (context, _) {
      var app = context.read<AppCubit>();
      var settings = context.watch<SettingsCubit>().state;

      var allowedPages = settings.appLayout.where((element) => element.isPermitted(context)).toList();
      var navigationWidgets = allowedPages.map((e) => e.getBottomBarNavigationWidget(context)).toList();

      var selectedIndex = _.selectedIndex;
      if (selectedIndex >= allowedPages.length) {
        selectedIndex = 0;
      }

      HomeDataSource? selectedPage;
      if (selectedIndex < allowedPages.length) {
        selectedPage = allowedPages[selectedIndex];
      }

      return Scaffold(
          key: ValueKey(_.server?.url),
          // so we rebuild the view if the server changes
          backgroundColor: colorScheme.background,
          bottomNavigationBar: allowedPages.length >= 2
              ? NavigationBar(
                  backgroundColor: colorScheme.background,
                  labelBehavior: settings.navigationBarLabelBehavior,
                  elevation: 0,
                  onDestinationSelected: app.selectIndex,
                  selectedIndex: selectedIndex,
                  destinations: navigationWidgets,
                )
              : null,
          appBar: AppBar(
            systemOverlayStyle: getUiOverlayStyle(context),
            title: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(selectedPage?.getLabel(locals) ?? 'Clipious'),
                if (selectedPage == HomeDataSource.home)
                  IconButton(
                      iconSize: 15,
                      onPressed: () => openLayoutEditor(context),
                      icon: Icon(
                        Icons.edit,
                        color: colorScheme.secondary,
                      ))
              ],
            ),
            scrolledUnderElevation: 0,
            // backgroundColor: Colors.pink,
            backgroundColor: colorScheme.background,
            actions: [
              selectedPage == HomeDataSource.subscription ? IconButton(onPressed: () => openSubscriptionManagement(context), icon: const Icon(Icons.checklist)) : const SizedBox.shrink(),
              const AppBarDownloadButton(),
              IconButton(
                onPressed: () {
                  AutoRouter.of(context).push(SearchRoute());
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
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: AnimatedSwitcher(
                    switchInCurve: Curves.easeInOutQuad,
                    switchOutCurve: Curves.easeInOutQuad,
                    transitionBuilder: (Widget child, Animation<double> animation) {
                      return FadeTransition(opacity: animation, child: child);
                    },
                    duration: animationDuration,
                    child: Container(
                        // home handles its own padding because we don't want to cut horizontal scroll lists on the right
                        padding: EdgeInsets.symmetric(horizontal: selectedPage == HomeDataSource.home ? 0 : innerHorizontalPadding),
                        key: ValueKey(selectedPage),
                        child: selectedPage?.build(context, false) ??
                            const Opacity(
                                opacity: 0.2,
                                child: AppIcon(
                                  height: 200,
                                ))),
/*
                    child: <Widget>[
                      const HomeView(
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
*/
                  ),
                )
              ])));
    });
  }
}
