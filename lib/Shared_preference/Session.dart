import 'package:shared_preferences/shared_preferences.dart';

void saveData(int value, String dtusername, dtfirst_name, dtlast_name, dtemail,
    dttelp) async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  sharedPreferences.setInt("value", value);
  sharedPreferences.setString("username", dtusername);
  sharedPreferences.setString("firts_name", dtfirst_name);
  sharedPreferences.setString("last_name", dtlast_name);
  sharedPreferences.setString("telp", dttelp);
  sharedPreferences.setString("email", dtemail);
}
