import 'package:shared_preferences/shared_preferences.dart';

import 'user_singleton.dart';

class SharedHelper {

  static SharedPreferences _prefs;
  static UserSingleton _userSingleton = UserSingleton();

  static Future<void> cacheUser()async{
    _prefs = await SharedPreferences.getInstance();
    _prefs.setString('phoneNumber', _userSingleton.phoneNumber);
    _prefs.setString('email', _userSingleton.email);
    _prefs.setInt('id', _userSingleton.id);
    _prefs.setString('name', _userSingleton.fullName);
    _prefs.setString('userName', _userSingleton.userName);
    _prefs.setString('firstName', _userSingleton.firstName);
    _prefs.setString('lastName', _userSingleton.lastName);
    // _prefs.setString('image', _userSingleton.image);
    _userSingleton.isLogged = true;
  }

  static Future<void> getUser()async{
    _prefs = await SharedPreferences.getInstance();
    _userSingleton.phoneNumber = _prefs.getString('phoneNumber');
    _userSingleton.id = _prefs.getInt('id');
    _userSingleton.userName = _prefs.getString('userName');
    _userSingleton.fullName = _prefs.getString('name');
    _userSingleton.firstName = _prefs.getString('firstName');
    _userSingleton.lastName = _prefs.getString('lastName');
    // _userSingleton.image = _prefs.getString('image');
    _userSingleton.email = _prefs.getString('email');
    if(_userSingleton.id != null)
      _userSingleton.isLogged = true;
  }

  static Future<void> clear()async{
    _prefs = await SharedPreferences.getInstance();
    await _prefs.clear();
    _userSingleton.isLogged = false;
  }
}