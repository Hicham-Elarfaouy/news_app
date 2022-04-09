import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {

  static SharedPreferences? sharedPreferences;

  static init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future<bool> putShared({
    required String key,
    required bool value,
}) async {
    return await sharedPreferences!.setBool(key, value);
  }

  static bool? getShared({
    required String key,
}) {
    return sharedPreferences!.getBool(key);
  }

//  static Future<bool> putCountry({
//    required String key,
//    required String value,
//  }) async {
//    return await sharedPreferences!.setString(key, value);
//  }

//  static String? getCountry({
//    required String key,
//  }) {
//    return sharedPreferences!.getString(key);
// }
}