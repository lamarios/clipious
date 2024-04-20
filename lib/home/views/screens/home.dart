import 'package:auto_route/auto_route.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
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
import 'package:logging/logging.dart';

import '../../../notifications/notifications.dart';

var log = Logger('Home Screen');

@RoutePage()
class MainContentScreen extends StatefulWidget {
  const MainContentScreen({super.key});

  @override
  State<MainContentScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainContentScreen> {
  openSettings(BuildContext context) {
    AutoRouter.of(context).push(const SettingsRoute());
  }

  openSubscriptionManagement(BuildContext context) {
    AutoRouter.of(context).push(const ManageSubscriptionsRoute());
  }

  openLayoutEditor(BuildContext context) {
    var app = context.read<AppCubit>();
    AutoRouter.of(context)
        .push(const EditHomeLayoutRoute())
        .then((value) => app.updateLayout());
  }

  @override
  void initState() {
    super.initState();

    // Only after at least the action method is set, the notification events are delivered
    AwesomeNotifications()
        .setListeners(
            onActionReceivedMethod:
                NotificationController.onActionReceivedMethod,
            onNotificationCreatedMethod:
                NotificationController.onNotificationCreatedMethod,
            onNotificationDisplayedMethod:
                NotificationController.onNotificationDisplayedMethod,
            onDismissActionReceivedMethod:
                NotificationController.onDismissActionReceivedMethod)
        .then(
      (value) {
        AwesomeNotifications()
            .getInitialNotificationAction()
            .then((initialNotification) {
          log.fine('Initial notification ${initialNotification?.payload}');

          if (initialNotification != null) {
            NotificationController.onActionReceivedMethod(initialNotification);
          }
        });
      },
    );
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
      return previous.server != current.server;
    }, builder: (context, appState) {
      var app = context.read<AppCubit>();
      var settings = context.watch<SettingsCubit>().state;

      var allowedPages = settings.appLayout
          .where((element) =>
              element.isPermitted(context, app.isLoggedIn) &&
              element.route != null)
          .toList();
      var navigationWidgets = allowedPages
          .map((e) => e.getBottomBarNavigationWidget(context))
          .toList();

      var selectedIndex = appState.firstIndex;
      if (selectedIndex >= allowedPages.length) {
        selectedIndex = 0;
      }

      final deviceType = getDeviceType();

      return allowedPages.isEmpty
          ? Scaffold(
              body: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Center(
                      child: AppIcon(
                    width: 150,
                    height: 150,
                  )),
                  FilledButton.tonalIcon(
                      onPressed: () => openSettings(context),
                      icon: const Icon(Icons.settings),
                      label: Text(locals.settings))
                ],
              ),
            )
          : AutoTabsRouter.tabBar(
              key: ValueKey(appState.server?.url),
              homeIndex: selectedIndex,
              routes: allowedPages.map((e) => e.route!).toList(),
              physics: const NeverScrollableScrollPhysics(),
              builder: (context, child, controller) {
                final tabsRouter = AutoTabsRouter.of(context);
                final selectedPage = allowedPages[tabsRouter.activeIndex];
                return Scaffold(
                    // so we rebuild the view if the server changes
                    backgroundColor: colorScheme.background,
                    bottomNavigationBar: deviceType == DeviceType.phone &&
                            allowedPages.length >= 2
                        ? NavigationBar(
                            onDestinationSelected: tabsRouter.setActiveIndex,
                            selectedIndex: tabsRouter.activeIndex,
                            destinations: navigationWidgets,
                          )
                        : null,
                    appBar: AppBar(
                      title: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(selectedPage.getLabel(locals)),
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
                      actions: [
                        selectedPage == HomeDataSource.subscription
                            ? IconButton(
                                onPressed: () =>
                                    openSubscriptionManagement(context),
                                icon: const Icon(Icons.checklist))
                            : const SizedBox.shrink(),
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
                        child: Row(
                          children: [
                            if (deviceType == DeviceType.tablet &&
                                allowedPages.length > 2)
                              OrientationBuilder(
                                builder: (context, orientation) =>
                                    NavigationRail(
                                        extended: getOrientation() ==
                                            Orientation.landscape,
                                        onDestinationSelected:
                                            tabsRouter.setActiveIndex,
                                        destinations: allowedPages
                                            .map((e) =>
                                                e.getNavigationRailWidget(
                                                    context))
                                            .toList(),
                                        selectedIndex: tabsRouter.activeIndex),
                              ),
                            Expanded(
                              child: Container(
                                  // home handles its own padding because we don't want to cut horizontal scroll lists on the right
                                  padding: EdgeInsets.symmetric(
                                      horizontal:
                                          selectedPage == HomeDataSource.home
                                              ? 0
                                              : innerHorizontalPadding),
                                  child: child),
                            ),
                          ],
                        )));
              });
    });
  }
}
