import 'package:bloc/bloc.dart';
import 'package:invidious/globals.dart';
import 'package:invidious/home/models/db/home_layout.dart';

const int maxSmallSources = 2;

class EditLayoutCubit extends Cubit<HomeLayout> {
  EditLayoutCubit(super.initialState);

  @override
  void emit(HomeLayout state) {
    db.upsertHomeLayout(state);
    super.emit(state);
  }

  void addSmallSource() {
    var state = this.state.copyWith();

    if (state.smallSources.length < maxSmallSources) {
      state.smallSources.add(HomeDataSource.values.where((element) => element.small).firstWhere((e) => e != state.bigSource && !state.smallSources.contains(e)));
    }
    state.smallSources = List.of(state.smallSources);
    emit(state);
  }

  void editSmallSource(int index, HomeDataSource? source) {
    var state = this.state.copyWith();
    if (index < state.smallSources.length) {
      state.smallSources[index] = source ?? HomeDataSource.trending;
    }
    state.smallSources = List.of(state.smallSources);
    emit(state);
  }

  void deleteSmallSource(int index) {
    var state = this.state.copyWith();
    if (index < state.smallSources.length) {
      state.smallSources.removeAt(index);
    }
    state.smallSources = List.of(state.smallSources);
    emit(state);
  }

  void editBigSource(HomeDataSource? newSource) {
    var state = this.state.copyWith();
    state.bigSource = newSource ?? HomeDataSource.trending;
    emit(state);
  }
}
