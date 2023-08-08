import 'package:shared_preferences/shared_preferences.dart';
import 'package:tambak_undang/models/report_model.dart';

class SharedPref {
  static SharedPreferences? preferences;
  static bool _init = false;
  static Future init() async {
    if (_init) return;
    preferences = await SharedPreferences.getInstance();
    _init = true;
    return preferences;
  }

  static void saveUsername(String username) => preferences?.setString("username", username);
  static String? get getUsername => preferences?.getString("username");
  static void saveToken(String token) => preferences?.setString("token", token);
  static String? get getToken => preferences?.getString("token");

  static void saveCurrentReport(ReportModel report) => preferences?.setString("currentReport", reportModelToJson(report));
  static ReportModel? get getCurrentReport => reportModelFromJson(preferences?.getString("currentReport") ?? "");

  static void logout() => preferences?.clear();
}