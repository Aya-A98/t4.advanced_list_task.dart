import 'package:shared_preferences/shared_preferences.dart';

//singelton
abstract class PreferencesService {
  static SharedPreferences? prefs ;

  static bool checkuser(){
    return prefs?.getBool("islogin")?? false;
  }
}
