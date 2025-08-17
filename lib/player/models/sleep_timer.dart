import 'package:freezed_annotation/freezed_annotation.dart';

part 'sleep_timer.freezed.dart';

@freezed
sealed class SleepTimer with _$SleepTimer {
  const factory SleepTimer({
    @Default(Duration(minutes: 5)) Duration duration,
    @Default(true) bool stopVideo,
  }) = _SleepTimer;
}
