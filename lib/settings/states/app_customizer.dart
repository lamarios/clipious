import 'package:bloc/bloc.dart';
import 'package:invidious/home/models/db/home_layout.dart';
import 'package:invidious/settings/states/settings.dart';

class AppCustomizerCubit extends Cubit<List<HomeDataSource>> {
  final SettingsCubit settings;

  AppCustomizerCubit(super.initialState, this.settings);

  @override
  emit(List<HomeDataSource> state) {
    settings.setAppLayout(state);
    super.emit(state);
  }

  updateSource(HomeDataSource source, bool value) {
    var state = List.of(this.state);

    if (!value) {
      state.remove(source);
    } else if (!state.contains(source)) {
      state.add(source);
    }

    emit(state);
  }

  void reorder(int oldIndex, int newIndex) {
    var onStart = this.state[settings.state.onOpen];

    var state = List.of(this.state);
    var source = state.removeAt(oldIndex);
    if (newIndex >= state.length) {
      state.add(source);
    } else {
      state.insert(newIndex, source);
    }

    emit(state);

    var newOnStartIndex = state.indexOf(onStart);
    settings.selectOnOpen(newOnStartIndex);
  }
}
