import 'package:shared_preferences/shared_preferences.dart';

class AuthPreferences {
  // AuthPreferences._();

  static String isLoggedIn = 'isLoggedIn';

  static String accessToken = 'accessToken';
  static String refreshToken = 'refreshToken';
  static String expiredAt = 'expiredAt';

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

  Future setAccessToken(String token) async {
    var sp = await SharedPreferences.getInstance();

    await sp.setString(accessToken, token);
  }

  Future<String> getAccessToken() async {
    var sp = await SharedPreferences.getInstance();

    var token = sp.getString(accessToken);
    return token;
  }

  Future setRefreshToken(String token) async {
    var sp = await SharedPreferences.getInstance();

    await sp.setString(refreshToken, token);
  }

  Future<String> getRefreshToken() async {
    var sp = await SharedPreferences.getInstance();

    var token = sp.getString(refreshToken);
    return token;
  }

  Future setExpiredAt(String token) async {
    var sp = await SharedPreferences.getInstance();

    await sp.setString(expiredAt, token);
  }

  Future<String> getExpiredAt() async {
    var sp = await SharedPreferences.getInstance();

    var date = sp.getString(expiredAt);
    return date;
  }
}
