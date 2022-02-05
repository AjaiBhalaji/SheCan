import 'package:shared_preferences/shared_preferences.dart';
import 'package:shecan/models/user_profile.dart';

class SharedPrefs {
  static  setData(UserProfile user) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString("uid", user.uid!);
    prefs.setString("name", user.name);
    prefs.setString("age", user.age);
    prefs.setString("phone", user.phone);
  }

  static Future<UserProfile> getData() async {
    final prefs = await SharedPreferences.getInstance();
    final uid = prefs.getString("uid");
    final name = prefs.getString("name");
    final age = prefs.getString("age");
    final phone = prefs.getString("phone");
    return UserProfile(
        uid: uid ?? 'null',
        name: name ?? 'null',
        age: age ?? 'null',
        phone: phone ?? 'null');
  }
}
