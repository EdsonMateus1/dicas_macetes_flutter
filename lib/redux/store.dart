import 'package:flutter/cupertino.dart' hide Action, State;

class Store<Action, State> extends ChangeNotifier {
  State _state;
  final State Function(State state, Action action) reducer;

  Store({@required State initalSate, @required this.reducer})
      : _state = initalSate;

  State get state => _state;

  void dispatcher(Action action) {
    _state = reducer(state, action);
    notifyListeners();
  }
}
