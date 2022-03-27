import 'package:shared_preferences/shared_preferences.dart';

class HddHub {
  HddHub._internal();
  factory HddHub() {
    return _hddRepository;
  }
  static final HddHub _hddRepository = HddHub._internal();

  late SharedPreferences _prefs;

  Future<void> initHddHub() async {
    _prefs = await SharedPreferences.getInstance();
  }

  SharedPreferences get prefs => _prefs;
  bool get themeStatus => _prefs.getBool('themeStatus') ?? false;
  set themeStatus(bool value) => _prefs.setBool('themeStatus', value);
}
