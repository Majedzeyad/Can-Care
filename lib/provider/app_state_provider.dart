import 'package:flutter/material.dart';

class AppStateProvider extends ChangeNotifier {
  bool isArabic = false;
  bool isDarkMode = false;

  void toggleLanguage() {
    isArabic = !isArabic;
    notifyListeners();
  }

  void toggleDarkMode() {
    isDarkMode = !isDarkMode;
    notifyListeners();
  }
}
