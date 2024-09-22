import 'package:shared_preferences/shared_preferences.dart';

class User {
  final Future<SharedPreferences> _prefs =  SharedPreferences.getInstance();
  
  User();

  Future<void> saveUser(String fullName, String email, String pass) async {
    var prefs = await _prefs;

    prefs.setString('Fullname', fullName);
    prefs.setString('email', email);
    prefs.setString('pass', pass);
  }

  Future<String?> getFullname() async {
    var prefs = await _prefs;
    return prefs.getString('Fullname');
  }

  Future<String?> getEmail() async {
    var prefs = await _prefs;
    return prefs.getString('email');
  }

  Future<String?> getPass() async{
    var prefs = await _prefs;
    return prefs.getString('pass');
  }
}