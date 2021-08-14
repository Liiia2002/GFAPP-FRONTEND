import 'package:flutter/material.dart';

class LanguageProvider extends ChangeNotifier {
  // 1 中文  2 English
  String _language = "中文";
  int _languageIndex = 1;
  bool _isChinese = true;

  get language => _language;
  get languageIndex => _languageIndex;
  get isChinese => _isChinese;
  void change(int index) {
    _language = (index == 1) ? "中文" : "English";
    _languageIndex = index;
    _isChinese = (index == 1);
    notifyListeners();
  }
}
