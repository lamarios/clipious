import 'package:flutter/material.dart';
import 'package:invidious/utils.dart';
import 'package:logging/logging.dart';

const RouteSettings ROUTE_SETTINGS = RouteSettings(name: 'settings');
const RouteSettings ROUTE_SETTINGS_MANAGE_SERVERS = RouteSettings(name: 'settings-manage-servers');
const RouteSettings ROUTE_VIDEO = RouteSettings(name: 'video');
const RouteSettings ROUTE_CHANNEL = RouteSettings(name: 'channel');
const RouteSettings ROUTE_PLAYLIST = RouteSettings(name: 'playlist');

class MyRouteObserver extends RouteObserver<PageRoute<dynamic>> {
  var log = Logger('MyRouteObserver');

  miniPlayerPlacement(PageRoute<dynamic>? route) {
    if (route != null) {
      switch (route.settings) {
        case ROUTE_SETTINGS:
        case ROUTE_PLAYLIST:
          log.info('Show mini player at the bottom');
          moveMiniPlayer(false);
          break;
        default:
          log.info('we should show the mini player on top');
          moveMiniPlayer(true);
      }
    }
  }

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPush(route, previousRoute);
    if (route is PageRoute) {
      miniPlayerPlacement(route);
    }
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
    if (newRoute is PageRoute) {
      // _sendScreenView(newRoute);
    }
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPop(route, previousRoute);
    if (previousRoute is PageRoute && route is PageRoute) {
      miniPlayerPlacement(previousRoute);
    }
  }
}
