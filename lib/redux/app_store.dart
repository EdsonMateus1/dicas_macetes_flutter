import 'package:dicas_e_macetes/redux/store.dart';

enum AppAction { increment, decrement }

class AppState {
  final int value;
  AppState({this.value = 0});
}

AppState _reducer(AppState state, AppAction action) {
  if (action == AppAction.increment) return AppState(value: state.value + 1);
  if (action == AppAction.decrement) return AppState(value: state.value - 1);
}

final AppStore =
    Store<AppAction, AppState>(initalSate: AppState(), reducer: _reducer);
