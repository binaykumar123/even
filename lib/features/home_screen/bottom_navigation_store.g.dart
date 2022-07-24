// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bottom_navigation_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$BottomNavigationStore on _BottomNavigationStoreBase, Store {
  final _$currentTabIndexAtom =
      Atom(name: '_BottomNavigationStoreBase.currentTabIndex');

  @override
  int get currentTabIndex {
    _$currentTabIndexAtom.reportRead();
    return super.currentTabIndex;
  }

  @override
  set currentTabIndex(int value) {
    _$currentTabIndexAtom.reportWrite(value, super.currentTabIndex, () {
      super.currentTabIndex = value;
    });
  }

  final _$_BottomNavigationStoreBaseActionController =
      ActionController(name: '_BottomNavigationStoreBase');

  @override
  void changeTabIndex(int index) {
    final _$actionInfo = _$_BottomNavigationStoreBaseActionController
        .startAction(name: '_BottomNavigationStoreBase.changeTabIndex');
    try {
      return super.changeTabIndex(index);
    } finally {
      _$_BottomNavigationStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
currentTabIndex: ${currentTabIndex}
    ''';
  }
}
