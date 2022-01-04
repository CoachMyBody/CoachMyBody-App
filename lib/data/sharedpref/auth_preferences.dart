import 'package:coach_my_body/data/sharedpref/constants/auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthPreferences {
  // AuthPreferences._();

  /// isFirstClient
  /// true : 앱 첫실행 (OnBoarding 페이지 띄워줘야함) - default
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

  /// isLoggedIn
  /// true : Already LogIn
  /// false : Need LogIn - default
  Future<bool> getIsLoggedIn() async {
    var sp = await SharedPreferences.getInstance();

    return (sp.getBool('isLoggedIn') ?? false);
  }

  void setIsLoggedIn(bool isLoggedIn) async {
    var sp = await SharedPreferences.getInstance();

    await sp.setBool('isLoggedIn', isLoggedIn);
    print('IsLoggedIn -> $isLoggedIn 등록 완료');
  }

  /// isCoachMode
  /// true : coach home
  /// false : member home - default
  Future<bool> getIsCoachMode() async {
    var sp = await SharedPreferences.getInstance();

    return (sp.getBool('isCoachMode') ?? false);
  }

  void setIsCoachMode(bool isCoachMode) async {
    var sp = await SharedPreferences.getInstance();

    await sp.setBool('isCoachMode', isCoachMode);
    print('isCoachMode -> $isCoachMode 등록 완료');
  }


  ///
  /// Token manage
  ///

  Future setAccessToken(String token) async {
    var sp = await SharedPreferences.getInstance();

    await sp.setString(Auth.accessToken, token);
  }

  Future<String> getAccessToken() async {
    var sp = await SharedPreferences.getInstance();

    var token = sp.getString(Auth.accessToken);
    return token;
  }

  Future setRefreshToken(String token) async {
    var sp = await SharedPreferences.getInstance();

    await sp.setString(Auth.refreshToken, token);
  }

  Future<String> getRefreshToken() async {
    var sp = await SharedPreferences.getInstance();

    var token = sp.getString(Auth.refreshToken);
    return token;
  }

  Future setExpiredAt(String token) async {
    var sp = await SharedPreferences.getInstance();

    await sp.setString(Auth.expiredAt, token);
  }

  Future<String> getExpiredAt() async {
    var sp = await SharedPreferences.getInstance();

    var date = sp.getString(Auth.expiredAt);
    return date;
  }
}
