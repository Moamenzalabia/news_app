import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  
  static late SharedPreferences sharedPreferences;
  static init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future<bool> saveCashedBoolen(
      {required String key, required bool value}) async {
    return await sharedPreferences.setBool(key, value);
  }

  static Future<dynamic> getCashedData({required String key}) async{
    return sharedPreferences.get(key);
  }
}
