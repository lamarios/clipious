import 'package:bloc/bloc.dart';
import 'package:clipious/home/models/db/home_layout.dart';
import 'package:clipious/settings/states/settings.dart';

class AppCustomizerCubit extends Cubit<List<HomeDataSource>> {
  final SettingsCubit settings;

  AppCustomizerCubit(super.initialState, this.settings);

  updateSource(HomeDataSource source, bool value) async {
    var state = List.of(this.state);

    if (!value) {
      state.remove(source);
    } else if (!state.contains(source)) {
      state.add(source);
    }
    await settings.setAppLayout(state);
    emit(state);
  }

  Future<void> reorder(int oldIndex, int newIndex) async {
    var onStart = this.state[settings.state.onOpen];

    var state = List.of(this.state);
    var source = state.removeAt(oldIndex);
    if (newIndex >= state.length) {
      state.add(source);
    } else {
      state.insert(newIndex, source);
    }

    await settings.setAppLayout(state);
    emit(state);

    var newOnStartIndex = state.indexOf(onStart);
    await settings.selectOnOpen(newOnStartIndex);
  }
}
