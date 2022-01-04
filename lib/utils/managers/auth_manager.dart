import 'package:coach_my_body/data/sharedpref/auth_preferences.dart';

enum AuthStat {
  initialed, // - onboading screen
  member, // logged - home screen
  coach, // change mode - coach home screen
  unknown, // need to login : default - login screen
}

class AuthMan {
  ///
  /// AccountMan instance is Singleton
  ///
  static final AuthMan _man = AuthMan._internal();

  factory AuthMan() {
    if (null == _man) {
      assert(null != _man);
    }
    return _man;
  }

  // internal constructor
  AuthMan._internal();

  ///
  ///
  final _pref = AuthPreferences();

  Future<AuthStat> checkAuthStatus() async {
    print('checkAccountStatus');
    assert(null != _pref);

    var isFirst = await _pref.getIsFirstClient();
    if (true == isFirst) {
      print('onboading');
      return AuthStat.initialed;
    }

    var isLogged = await _pref.getIsLoggedIn();
    if (false == isLogged) {
      print('need to login');
      return AuthStat.unknown;
    }

    var isCoachMode = await _pref.getIsCoachMode();
    if (false == isCoachMode) {
      print('member mode');
      return AuthStat.member;
    }

    print('coach mode');
    return AuthStat.coach;
  }
}
