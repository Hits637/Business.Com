// Share Preference
import 'package:shared_preferences/shared_preferences.dart';

class SessionData {
  static bool? isLogin;
  static String? emailId;
  static bool? firstTime;
  static String? role;

  static Future<void> storeSessionData(
      {required bool loginData,
      required String emailId,
      required String role
   }) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    // Set Data

    sharedPreferences.setBool("loginSession", loginData);
    sharedPreferences.setString("email", emailId);
    sharedPreferences.setString("role", role);

    SessionData.isLogin = loginData;
    SessionData.emailId = emailId;
    SessionData.role = role;

  }

  static Future<void> getSessionData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    isLogin = sharedPreferences.getBool("loginSession") ?? false;
    emailId = sharedPreferences.getString("email") ?? "";
    role = sharedPreferences.getString("role")?? "";

  }
}
