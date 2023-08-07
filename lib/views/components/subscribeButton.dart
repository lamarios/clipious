import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';
import 'package:invidious/controllers/subscribeButtonController.dart';

class SubscribeButton extends StatelessWidget {
  final String channelId;
  final String subCount;

  const SubscribeButton({super.key, required this.channelId, required this.subCount});

  @override
  Widget build(BuildContext context) {
    var locals = AppLocalizations.of(context)!;

    return GetBuilder<SubscribeButtonController>(
      init: SubscribeButtonController(channelId: channelId),
      global: false,
      builder: (_) => SizedBox(
          height: 25,
          child: FilledButton.tonal(
            onPressed: _.isLoggedIn ? _.toggleSubscription : null,
            child: Row(
              children: _.isLoggedIn
                  ? [
                      _.loading
                          ? SizedBox(
                              width: 15,
                              height: 15,
                              child: CircularProgressIndicator(
                                strokeWidth: 1,
                              ))
                          : Icon(_.isSubscribed ? Icons.done : Icons.add),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text('${(_.isSubscribed ? locals.subscribed : locals.subscribe)} | $subCount'),
                      ),
                    ]
                  : [
                      const Icon(Icons.people),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        // child: Text('${subCount.replaceAll("^0.00\$","no")} subscribers'),
                        child: Text(locals.nSubscribers(subCount.replaceAll(RegExp(r'^0.00$'), "no"))),
                      ),
                    ],
            ),
          )),
    );
  }
}
