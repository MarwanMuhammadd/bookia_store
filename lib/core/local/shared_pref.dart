import 'dart:convert';

import 'package:bookia_store/feature/auth/data/models/respone_auth/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class SharedPref {
  static late SharedPreferences sharedPreferences;

  static const String kToken = "token";
  static const String kUserInfo = "userInfo";

  static Future<void> init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static void setToken(String? token) {
    if (token == null) {
      return;
    }
    setString(kToken, token);
  }

  static String getToken() {
    return getString(kToken);
  }

  static void setUserData(User? user) {
    //obj=>json=>String
    if (user == null) {
      return;
    }
    var json = user.toJson();
    var userString = jsonEncode(json);
    setString(kUserInfo, userString);
  }

  static User? getUserData() {
    //String=>json=>obj
    var userString = getString(kUserInfo);
    if (userString.isEmpty) {
      return null;
    }
    var json = jsonDecode(userString);
    return User.fromJson(json);
  }

  static Future<void> setString(String key, String value) async {
    await sharedPreferences.setString(key, value);
  }

  static String getString(String key) {
    return sharedPreferences.getString(key) ?? '';
  }

  static Future<void> setBool(String key, bool value) async {
    await sharedPreferences.setBool(key, value);
  }

  static bool getBool(String key) {
    return sharedPreferences.getBool(key) ?? false;
  }

  Future<void> clear() async {
    await sharedPreferences.clear();
  }

  Future<void> remove(String key) async {
    await sharedPreferences.remove(key);
  }
}
