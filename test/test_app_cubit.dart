import 'package:invidious/app/states/app.dart';

class TestAppCubit extends AppCubit{
  TestAppCubit(super.initialState);

  @override
  onReady() {
   // do nothing, this is causing problems with tests
  }
}