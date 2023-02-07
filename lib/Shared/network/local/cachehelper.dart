import 'package:shared_preferences/shared_preferences.dart';

class cashehelper {
  static late SharedPreferences sharedPreferences;

  static init() async {
    sharedPreferences = await SharedPreferences.getInstance();
    print("getinstane success");
  }

  static Future<bool> putboolean({
    required bool value,
    required String key
  }) async {
    print("put data success");
    return await sharedPreferences.setBool(key, value);
  }

  static bool? getdata({required String key}) {
    print("get data success");
    return sharedPreferences.getBool(key);

  }
}
