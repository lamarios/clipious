import 'package:flutter/cupertino.dart';
import 'package:invidious/player/states/player.dart';

class TestPlayerCubit extends PlayerCubit {
  TestPlayerCubit(super.initialState, super.settings);

  Orientation get _orientation => Orientation.portrait;

  @override
  onReady() {}
}
