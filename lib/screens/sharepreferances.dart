import 'package:shared_preferences/shared_preferences.dart';

class AppManager{

  static const String isIDKey = 'isIDIn';

  static Future<void> saveID(String isIDIn) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('isIDIn', isIDIn);
  }

  static Future<String> getID() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('isIDIn') ?? '';
  }

}