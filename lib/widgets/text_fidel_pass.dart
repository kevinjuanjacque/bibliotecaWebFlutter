import 'package:flutter/material.dart';

class TextPass extends ChangeNotifier {
  bool candado = true;
  Icon iconCandado = Icon(Icons.lock);
  void changeVisibility() {
    if (candado) {
      candado = false;
      iconCandado = Icon(Icons.lock_open);
    } else {
      candado = true;
      iconCandado = Icon(Icons.lock);
    }

    notifyListeners();
  }
}
