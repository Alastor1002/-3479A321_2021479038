import 'package:flutter/material.dart';

class AppData extends ChangeNotifier {
  int _counter = 0;
  String _userName = "Usuario";
  bool _resetEnabled = true; 

  int get counter => _counter;
  String get userName => _userName;
  bool get resetEnabled => _resetEnabled;

  void incrementCounter() {
    _counter++;
    notifyListeners();
  }

  void decrementCounter() {
    _counter--;
    notifyListeners();
  }

  void resetCounter() {
    _counter = 0;
    notifyListeners();
  }
  void updateUserName(String newName) {
    _userName = newName;
    notifyListeners();
  }
  void toggleResetEnabled(bool enabled) {
    _resetEnabled = enabled;
    notifyListeners();
  }
}
