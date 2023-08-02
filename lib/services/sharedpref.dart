import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  static late final SharedPreferences preferences;
  static bool _init = false;
  static Future init() async {
    if (_init) return;
    preferences = await SharedPreferences.getInstance();
    _init = true;
    return preferences;
  }

  static void saveUsername(String username) => preferences.setString("username", username);
  static String? get getUsername => preferences.getString("username");
  static void saveToken(String token) => preferences.setString("token", token);
  static String? get getToken => preferences.getString("token");

  static void logout() => preferences.clear();
}