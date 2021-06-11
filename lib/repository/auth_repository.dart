import 'dart:convert';

import 'package:coach_my_body/data/sharedpref/constants/preferences.dart';
import 'package:coach_my_body/models/user_info.dart';
import 'package:http/http.dart' as http;

class AuthRepository {
  // 따로 관리할 예정
  final String apiAddress = 'http://ec2-3-36-145-144.ap-northeast-2.compute.amazonaws.com:8080/api/v1/';

  // 헤더에 담아줘야함
  final Map<String, String> headers = {
    'Accept': 'application/json',
    'content-type': 'application/json'
  };

  void _saveTokens(String body) {
    var pref = AuthPreferences();
    var token = CMBTokenInfo.fromJson(json.decode(body));

    pref.setAccessToken(token.accessToken);
    print(token.accessToken);
    pref.setRefreshToken(token.refreshToken);
    pref.setExpiredAt(token.expiredAt);
    print(token.expiredAt);

    print(token.accessToken);
  }

  /// auth/register
  Future<int> register(UserInfo userInfo) async{
    var result = 0;

    var client = http.Client();
    var body = json.encode(userInfo.toJson());

    try {
      var response = await client.post(
          Uri.parse(apiAddress + 'auth/register'),
          headers: headers,
          body: body
      );

      result = response.statusCode;
      print('api 호출 결과 : $result');
    } catch (e) {
      print('로그인 api 호출 실패\n에러 : $e');
    } finally {
      client.close();
    }

    return result;
  }

  /// auth/login
  Future<int> login(String socialId) async {
    print('로그인 api 호출');
    var result = 0;

    var client = http.Client();
    var bodyMap = {
      'socialId':  socialId
    };
    var body = json.encode(bodyMap);

    try {
      var response = await client.post(
        Uri.parse(apiAddress + 'auth/login'),
        headers: headers,
        body: body
      );

      result = response.statusCode;
      print('api 호출 결과 : $result');

      if (response.statusCode == 200) {
        print('로그인 성공');
        // save token
        _saveTokens(utf8.decode(response.bodyBytes));
      } else if (response.statusCode == 400) {
        print('존재하지 않는 회원');
      }

    } catch (e) {
      print('로그인 api 호출 실패\n에러 : $e');
    } finally {
      client.close();
    }

    return result;
  }
}