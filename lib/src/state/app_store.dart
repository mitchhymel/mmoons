import 'package:mobx/mobx.dart';

part 'app_store.g.dart';

class AppStore = _AppStore with _$AppStore;

abstract class _AppStore with Store {
  @observable 
  int value = 0;

  @action
  void increment() {
    value++;
  }
}