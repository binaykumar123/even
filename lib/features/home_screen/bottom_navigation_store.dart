import 'package:mobx/mobx.dart';

part 'bottom_navigation_store.g.dart';

class BottomNavigationStore = _BottomNavigationStoreBase
    with _$BottomNavigationStore;

abstract class _BottomNavigationStoreBase with Store {
  _BottomNavigationStoreBase();

  @observable
  int currentTabIndex = 0;

  @action
  void changeTabIndex(int index) {
    currentTabIndex = index;
  }
}
