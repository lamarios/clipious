import 'package:clipious/player/models/sleep_timer.dart';
import 'package:clipious/player/views/components/sleep_timer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SleepTimerCubit extends Cubit<SleepTimer> {
  SleepTimerCubit(super.initialState);

  setDuration(Duration duration) {
    if (duration >= sleepTimerMinDuration &&
        duration <= sleepTimerMaxDuration) {
      emit(state.copyWith(duration: duration));
    }
  }

  setStopVideo(bool stop) {
    emit(state.copyWith(stopVideo: stop));
  }
}
