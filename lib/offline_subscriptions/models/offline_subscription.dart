import 'dart:core';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'offline_subscription.g.dart';

part 'offline_subscription.freezed.dart';

@freezed
sealed class OfflineSubscription with _$OfflineSubscription {
  const factory OfflineSubscription({
    required String channelId,
    required String channelName,
  }) = _OfflineSubscription;

  factory OfflineSubscription.fromJson(Map<String, dynamic> json) =>
      _$OfflineSubscriptionFromJson(json);
}
