import 'package:flutter/material.dart';
import 'package:inzynierka/logics/hubs/hdd_hub.dart';

class AppThemeNotifier with ChangeNotifier {
  bool _darkTheme = HddHub().themeStatus;

  bool get darkTheme => _darkTheme;

  set darkTheme(bool value) {
    _darkTheme = value;
    HddHub().themeStatus = value;
    notifyListeners();
  }
}
