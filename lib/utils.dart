import 'package:fbroadcast/fbroadcast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:invidious/controllers/miniPayerController.dart';
import 'package:invidious/globals.dart';
import 'package:invidious/models/interfaces/sharelink.dart';
import 'package:invidious/models/video.dart';
import 'package:logging/logging.dart';
import 'package:share_plus/share_plus.dart';

import 'models/country.dart';

const PHONE_MAX = 600;
const TABLET_PORTRAIT_MAX = 900;

var log = Logger('Utils');

enum DeviceType { phone, tablet }

String prettyDuration(Duration duration) {
  var components = <String>[];

  var hours = duration.inHours % 24;
  if (hours != 0) {
    components.add('${hours}:');
  }
  var minutes = duration.inMinutes % 60;
  components.add('${minutes.toString().padLeft(2, '0')}:');

  var seconds = duration.inSeconds % 60;
  components.add('${seconds.toString().padLeft(2, '0')}');
  return components.join();
}

NumberFormat compactCurrency = NumberFormat.compactCurrency(
  decimalDigits: 2,
  symbol: '', // if you want to add currency symbol then pass that in this else leave it empty.
);

Future<void> showAlertDialog(BuildContext context, String title, List<Widget> body) async {
  var locals = AppLocalizations.of(context)!;
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(title),
        content: SingleChildScrollView(
          child: ListBody(
            children: body,
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: Text(locals.ok),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}

void showSharingSheet(BuildContext context, ShareLinks links) {
  var locals = AppLocalizations.of(context)!;
  showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 100,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                FilledButton.tonal(
                  child: Text(locals.shareInvidiousLink),
                  onPressed: () {
                    Share.share(links.getInvidiousLink(db.getCurrentlySelectedServer()));
                    Navigator.of(context).pop();
                  },
                ),
                FilledButton.tonal(
                  child: Text(locals.shareYoutubeLink),
                  onPressed: () {
                    Share.share(links.getYoutubeLink());
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          ),
        );
      });
}

double getScreenWidth() {
  final data = MediaQueryData.fromWindow(WidgetsBinding.instance.window);
  return data.size.width;
}

DeviceType getDeviceType() {
  final data = MediaQueryData.fromWindow(WidgetsBinding.instance.window);
  return data.size.shortestSide < 600 ? DeviceType.phone : DeviceType.tablet;
}

int getGridCount(BuildContext context) {
  double width = MediaQuery.of(context).size.width;
  if (width < PHONE_MAX) {
    return 1;
  }

  return (width / 300).floor();
}

double getGridAspectRatio(BuildContext context) {
  return getGridCount(context) > 1 ? 16 / 15 : 16 / 13;
}

okCancelDialog(BuildContext context, String title, String message, Function() onOk) {
  var locals = AppLocalizations.of(context)!;
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: <Widget>[
          TextButton(
            child: Text(locals.ok),
            onPressed: () {
              onOk();
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            child: Text(locals.cancel),
            onPressed: () {
              //Put your code here which you want to execute on Cancel button click.
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}

Country getCountryFromCode(String code) {
  return countryCodes.firstWhere((element) => element.code == code, orElse: () => Country('US', 'United States of America'));
}

void showMiniPlayer(BuildContext context, List<Video> videos) {
  MiniPlayerController? controller = MiniPlayerController.to();
  if (controller != null) {
    controller.show();
    controller.setVideos(videos);
  }
}

void hideMiniPlayer(BuildContext context) {
  MiniPlayerController.to()?.hide();
  FBroadcast.instance().broadcast(BROADCAST_STOP_MINI_PLAYER);
}

T? safeGet<T>({String? tag}) {
  try {
    return Get.find<T>(tag: tag);
  } catch (err) {
    log.info('could not find controller of class ${T.toString()}');
    return null;
  }
}
