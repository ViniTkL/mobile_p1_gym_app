import 'package:shared_preferences/shared_preferences.dart';

class Auth {
  final Future<SharedPreferences> _prefs =  SharedPreferences.getInstance();
  
  Auth();

  Future<void> saveUser(String fullName, String email, String pass) async {
    var prefs = await _prefs;

    prefs.setString('Fullname', fullName);
    prefs.setString('email', email);
    prefs.setString('pass', pass);
  }

  Future<void> setPassword(String password) async {
    var prefs = await _prefs;
    prefs.setString('pass', password);
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