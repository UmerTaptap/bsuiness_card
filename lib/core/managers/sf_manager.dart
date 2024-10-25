import 'package:shared_preferences/shared_preferences.dart';

import '../globals/app_constants.dart';
class SfManager{
  // Singleton
  static final SfManager _instance = SfManager._internal();
  late SharedPreferences _sf;

  factory SfManager() => _instance;
  SfManager._internal();

  Future<void> init() async {
    _sf = await SharedPreferences.getInstance();
  }

  Future<bool> setString(String key, String value) async {
    return _sf.setString(key, value);
  }

  String? getString(String key) {
    return _sf.getString(key);
  }

  Future<bool> setInt(String key, int value) async {
    return _sf.setInt(key, value);
  }

  int? getInt(String key) {
    return _sf.getInt(key);
  }

  Future<bool> setTheme(String theme) async {
    return _sf.setString(AppConstants.THEME, theme);
  }

  String getTheme() {
    return _sf.getString(AppConstants.THEME) ?? AppConstants.THEME_DARK;
  }


  // remove, clear, etc.
  Future<bool> remove(String key) async {
    return _sf.remove(key);
  }

  Future<bool> clear() async {
    return _sf.clear();
  }

}