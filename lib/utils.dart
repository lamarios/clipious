import 'dart:math';

import 'package:clipious/settings/models/db/settings.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';
import 'package:clipious/globals.dart';
import 'package:clipious/player/states/player.dart';
import 'package:clipious/settings/states/settings.dart';
import 'package:clipious/utils/models/sharelink.dart';
import 'package:clipious/utils/views/tv/components/tv_button.dart';
import 'package:clipious/utils/views/tv/components/tv_overscan.dart';
import 'package:logging/logging.dart';
import 'package:share_plus/share_plus.dart';

import 'utils/models/country.dart';
import 'videos/models/video.dart';

const phoneMax = 600;
const tabletPortraitMax = 900;

var log = Logger('Utils');

enum DeviceType { phone, tablet, tv }

double tabletMaxVideoWidth =
    getDeviceType() == DeviceType.phone ? double.infinity : 500;

bool isPhoneLandscape(BuildContext context) {
  var size = MediaQuery.sizeOf(context);
  return getDeviceType() == DeviceType.phone && size.height < size.width;
}

const List<LogicalKeyboardKey> selectKeys = [
  LogicalKeyboardKey.accept,
  LogicalKeyboardKey.enter,
  LogicalKeyboardKey.numpadEnter,
  LogicalKeyboardKey.select,
  LogicalKeyboardKey.open
];
const List<int> selectPhysicalKeys = [];

bool isOk(LogicalKeyboardKey key, {PhysicalKeyboardKey? physicalKeyboardKey}) {
  log.fine(
      'Received key event, Logical: ${key.debugName}, Physical ${physicalKeyboardKey?.debugName}');
  return selectKeys.any((element) => element == key) ||
      selectPhysicalKeys
          .any((element) => element == physicalKeyboardKey?.usbHidUsage);
}

String prettyDurationCustom(Duration duration) {
  var components = <String>[];

  var hours = duration.inHours % 24;
  if (hours != 0) {
    components.add('$hours:');
  }
  var minutes = duration.inMinutes % 60;
  components.add('${minutes.toString().padLeft(2, '0')}:');

  var seconds = duration.inSeconds % 60;
  components.add(seconds.toString().padLeft(2, '0'));
  return components.join();
}

NumberFormat compactCurrency = NumberFormat.compactCurrency(
  decimalDigits: 2,
  symbol:
      '', // if you want to add currency symbol then pass that in this else leave it empty.
);

Future<void> showAlertDialog(
    BuildContext context, String title, List<Widget> body,
    {List<Widget>? actions}) async {
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
        actions: actions ??
            <Widget>[
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

void showSharingSheet(BuildContext context, ShareLinks links,
    {bool showTimestampOption = false}) {
  var locals = AppLocalizations.of(context)!;

  bool shareWithTimestamp = false;
  Future<Duration?> getTimestamp() async {
    if (shareWithTimestamp) {
      var player = context.read<PlayerCubit>();
      return player.state.position;
    }
    return null;
  }

  showModalBottomSheet<void>(
    context: context,
    showDragHandle: true,
    builder: (BuildContext context) {
      return StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
          setShowTimeStamp(bool? value) {
            setState(() {
              shareWithTimestamp = value ?? false;
            });
          }

          return SizedBox(
            height: showTimestampOption ? 200 : 150,
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                FilledButton.tonal(
                  child: Text(locals.shareInvidiousLink),
                  onPressed: () async {
                    final timestamp = await getTimestamp();

                    Share.share(links.getInvidiousLink(
                        await db.getCurrentlySelectedServer(),
                        timestamp?.inSeconds));
                    if (context.mounted) {
                      Navigator.of(context).pop();
                    }
                  },
                ),
                FilledButton.tonal(
                  child: Text(locals.redirectInvidiousLink),
                  onPressed: () async {
                    final timestamp = await getTimestamp();

                    Share.share(links.getRedirectLink(timestamp?.inSeconds));
                    if (context.mounted) {
                      Navigator.of(context).pop();
                    }
                  },
                ),
                FilledButton.tonal(
                  child: Text(locals.shareYoutubeLink),
                  onPressed: () async {
                    final timestamp = await getTimestamp();

                    Share.share(links.getYoutubeLink(timestamp?.inSeconds));
                    if (context.mounted) {
                      Navigator.of(context).pop();
                    }
                  },
                ),
                if (showTimestampOption)
                  InkWell(
                    onTap: () => setShowTimeStamp(!shareWithTimestamp),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Checkbox(
                          value: shareWithTimestamp,
                          onChanged: setShowTimeStamp,
                        ),
                        Text(locals.shareLinkWithTimestamp),
                      ],
                    ),
                  )
              ],
            ),
          );
        },
      );
    },
  );
}

double getScreenWidth() {
  final data = MediaQueryData.fromView(
      WidgetsBinding.instance.platformDispatcher.implicitView!);
  return data.size.width;
}

DeviceType getDeviceType() {
  final data = MediaQueryData.fromView(
      WidgetsBinding.instance.platformDispatcher.implicitView!);
  return data.size.shortestSide < 600 ? DeviceType.phone : DeviceType.tablet;
}

Future<bool> isDeviceTv() async {
  final forceTv = db.getSettings(forceTvUiSettingName);
  DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
  AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
  return forceTv?.value == 'true' ||
      androidInfo.systemFeatures.contains('android.software.leanback');
}

int getGridCount(BuildContext context) {
  double width = MediaQuery.of(context).size.width;
  if (width < phoneMax) {
    return 1;
  }

  return max(2, (width / 300).floor() - 1);
}

double getGridAspectRatio(BuildContext context) {
  return getGridCount(context) > 1 ? 16 / 15 : 16 / 13;
}

okCancelDialog(
    BuildContext context, String title, String message, Function() onOk) {
  var locals = AppLocalizations.of(context)!;
  showDialog(
    useRootNavigator: false,
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: <Widget>[
          TextButton(
            child: Text(locals.cancel),
            onPressed: () {
              //Put your code here which you want to execute on Cancel button click.
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            child: Text(locals.ok),
            onPressed: () {
              onOk();
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}

showTvAlertdialog(BuildContext context, String title, List<Widget> body) {
  var locals = AppLocalizations.of(context)!;
  showTvDialog(context: context, builder: (context) => body, actions: [
    TvButton(
      autofocus: true,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
        child: Text(locals.ok),
      ),
      onPressed: (context) {
        Navigator.of(context).pop();
      },
    )
  ]);
}

showTvDialog(
    {required BuildContext context,
    String? title,
    required List<Widget> Function(BuildContext context) builder,
    required List<Widget> actions}) {
  var textTheme = Theme.of(context).textTheme;

  Navigator.of(context).push(MaterialPageRoute(
    builder: (context) {
      ColorScheme colors = Theme.of(context).colorScheme;
      return Scaffold(
        body: TvOverscan(
          child: Column(children: [
            if (title != null)
              Text(title,
                  style: textTheme.titleLarge?.copyWith(color: colors.primary)),
            Expanded(
              child: ListView(
                children: builder(context),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: actions
                  .map((e) => Padding(
                        padding: const EdgeInsets.all(16),
                        child: e,
                      ))
                  .toList(),
            )
          ]),
        ),
      );
    },
  ));
}

Country getCountryFromCode(String code) {
  return countryCodes.firstWhere((element) => element.code == code,
      orElse: () => Country('US', 'United States of America'));
}

KeyEventResult onTvSelect(
    KeyEvent event, BuildContext context, Function(BuildContext context) func) {
  if (event is KeyUpEvent) {
    log.fine('onTvSelect, ${event.logicalKey}, $event');
    if (isOk(event.logicalKey, physicalKeyboardKey: event.physicalKey)) {
      func(context);
      return KeyEventResult.handled;
    }
  }

  return KeyEventResult.ignored;
}

ColorScheme getColorSchemeOutsideOfMaterial(BuildContext context,
    {required ColorScheme dark, required ColorScheme light}) {
  var colors = switch (context.read<SettingsCubit>().state.themeMode) {
    (ThemeMode.dark) => dark,
    (ThemeMode.light) => light,
    (ThemeMode.system) =>
      MediaQuery.platformBrightnessOf(context) == Brightness.light
          ? light
          : dark
  };
  return colors;
}

SystemUiOverlayStyle getUiOverlayStyle(BuildContext context,
    {required ColorScheme dark, required ColorScheme light}) {
  var colorScheme =
      getColorSchemeOutsideOfMaterial(context, dark: dark, light: light);

  return SystemUiOverlayStyle(
      systemNavigationBarColor: colorScheme.surface,
      systemNavigationBarIconBrightness:
          colorScheme.brightness == Brightness.dark
              ? Brightness.light
              : Brightness.dark,
      statusBarColor: colorScheme.surface,
      statusBarIconBrightness: colorScheme.brightness == Brightness.dark
          ? Brightness.light
          : Brightness.dark);
}

List<Video> filteredVideos(List<Video> videos) =>
    videos.where((element) => !element.filterHide).toList();

String getWeekdayName(int weekday) {
  final DateTime now = DateTime.now().toLocal();
  final int diff = now.weekday - weekday; // weekday is our 1-7 ISO value
  DateTime udpatedDt;
  if (diff > 0) {
    udpatedDt = now.subtract(Duration(days: diff));
  } else if (diff == 0) {
    udpatedDt = now;
  } else {
    udpatedDt = now.add(Duration(days: diff * -1));
  }
  final String weekdayName = DateFormat('EEEE').format(udpatedDt);
  return weekdayName;
}

TimeOfDay timeStringToTimeOfDay(String time) {
  var split = time.split(":");
  return TimeOfDay(hour: int.parse(split[0]), minute: int.parse(split[1]));
}

Orientation getOrientation() {
  return (WidgetsBinding.instance.platformDispatcher.implicitView?.physicalSize
                  .aspectRatio ??
              1) >
          1
      ? Orientation.landscape
      : Orientation.portrait;
}

Size getFractionOfAvailableSpace(BuildContext context, double fraction) {
  var size = MediaQuery.of(context).size;
  return Size(size.width * fraction, size.height * fraction);
}
