import 'package:shared_preferences/shared_preferences.dart';

class PrefUtil {
  static late SharedPreferences _prefs;

  static Future<SharedPreferences> init() async {
    _prefs = await SharedPreferences.getInstance();
    return _prefs;
  }

  ///sets
  static Future<bool> setBool(String key, bool value) async =>
      await _prefs.setBool(key, value);

  ///gets
  static bool getBool(String key) => _prefs.getBool(key) ?? false;
}
