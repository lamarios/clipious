import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';
import 'package:invidious/controllers/subscribeButtonController.dart';
import 'package:invidious/views/tv/tvButton.dart';

class TvSubscribeButton extends StatelessWidget {
  final String channelId;
  final String subCount;
  final bool? autoFocus;
  final Function(bool focus)? onFocusChanged;

  const TvSubscribeButton({Key? key, required this.channelId, required this.subCount, this.autoFocus, this.onFocusChanged}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var locals = AppLocalizations.of(context)!;
    ColorScheme colors = Theme.of(context).colorScheme;

    return GetBuilder<SubscribeButtonController>(
        global: false,
        init: SubscribeButtonController(channelId: channelId),
        builder: (_) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: TvButton(
              autofocus: autoFocus,
              onFocusChanged: onFocusChanged,
              unfocusedColor: colors.background.withOpacity(0.0),
              onPressed: (context) => _.isLoggedIn ? _.toggleSubscription() : null,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: !_.loading && _.isLoggedIn
                      ? [
                          Icon(_.isSubscribed ? Icons.done : Icons.add),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Text(
                              '${(_.isSubscribed ? locals.subscribed : locals.subscribe)} | $subCount',
                            ),
                          ),
                        ]
                      : [
                          const Icon(Icons.people),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Text(locals.nSubscribers(subCount.replaceAll(RegExp(r'^0.00$'), "no"))),
                          ),
                        ],
                ),
              ),
            ),
          );
        });
  }
}
