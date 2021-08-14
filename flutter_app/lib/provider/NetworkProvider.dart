import 'package:flutter/material.dart';

class NetworkProvider extends ChangeNotifier {
  String _stateText = "检测中...";

  get stateText => _stateText;
  void change(String text) {
    _stateText = text;
    notifyListeners();
  }
}
