import 'actions.dart';
import 'state.dart';

typedef void StoreListener();

class Store {
  List<Function> _listeners = [];

  static Store shared = Store();

  void register({listener: StoreListener}) {
    _listeners.add(listener);
  }

  void unregister({listener: StoreListener}) {
    _listeners.removeWhere((f){
      return f == listener;
    });
  }

  void dispatch(Action action) {

  }

  ReduxState getState() {
    return ReduxState();
  }
}