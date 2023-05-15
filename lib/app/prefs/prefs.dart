import 'package:shared_preferences/shared_preferences.dart';

const onBoardingComplete = 'on_Boarding_Complete';

class AppPrefs {
  AppPrefs(this._sharedPreferences);
  final SharedPreferences _sharedPreferences;

  setOnBoardingComplete() {
    _sharedPreferences.setBool(onBoardingComplete, true);
  }

  bool isOnBoardingComplete() {
    if (_sharedPreferences.containsKey(onBoardingComplete)) {
      return _sharedPreferences.getBool(onBoardingComplete) ?? false;
    } else {
      return false;
    }
  }
}
