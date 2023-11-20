import 'package:bloc/bloc.dart';

class TimePickerCubit extends Cubit<String>{
  TimePickerCubit(super.initialState);

  String getHoursString() {
    return state.split(":")[0];
  }

  String getMinutesString() {
    return state.split(":")[1];
  }

  int getHours(){
    return int.parse(getHoursString());
  }

  int getMinutes(){
    return int.parse(getMinutesString());
  }

  void addMinutes(int i) {
      int m = getMinutes();
      m = m+i;
      if(m > 59){
        m = 0;
      }
      if(m < 0){
        m = 59;
      }

      var split = state.split(":");
      split[1] = m.toString().padLeft(2, "0");

      emit(split.join(":"));
  }

  void addHours(int i) {
    int h = getHours();
    h = h+i;
    if(h > 23){
      h = 0;
    }
    if(h < 0){
      h = 23;
    }

    var split = state.split(":");
    split[0] = h.toString().padLeft(2, "0");

    emit(split.join(":"));
  }



}