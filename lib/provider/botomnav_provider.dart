import 'package:flutter/material.dart';

class BottomProvider extends ChangeNotifier {
  int _curentabIndex = 0;

  int get curentabIndex => _curentabIndex;
  void updateState(index) {
    _curentabIndex = index;
    notifyListeners();
  }
}
