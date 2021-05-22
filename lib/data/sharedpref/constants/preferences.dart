import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  //Preferences._();

  static String is_logged_in = "isLoggedIn";
  static String auth_token = "authToken";
  static String is_dark_mode = "is_dark_mode";
  static String current_language = "current_language";

  /// true : 앱 첫실행 (OnBoarding 페이지 띄워줘야함)
  /// false : 바로 로그인페이지
  Future<bool> getIsFirstClient() async {
    var sp = await SharedPreferences.getInstance();

    return (sp.getBool('isFirstClient') ?? true);
  }

  void setIsFirstClient(bool isFirstClient) async {
    var sp = await SharedPreferences.getInstance();

    await sp.setBool('isFirstClient', isFirstClient);
    print('IsFirstClient -> false 등록 완료');
  }
}