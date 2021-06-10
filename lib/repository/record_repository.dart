import 'dart:convert';

import 'package:coach_my_body/data/sharedpref/constants/preferences.dart';
import 'package:coach_my_body/models/routine_info.dart';
import 'package:coach_my_body/models/write_info.dart';
import 'package:http/http.dart' as http;

class RecordRepository {
  RecordRepository();

  Future<void> _getAccessToken() async {
    var pref = AuthPreferences();
    String accessToken = await pref.getAccessToken();

    // 헤더에 담아줘야함
    headers = {
      'Accept': 'application/json',
      'content-type': 'application/json',
      'Authorization': 'Bearer $accessToken' // TODO: Just for test
    };
  }

  // 따로 관리할 예정
  final String apiAddress =
      'http://ec2-3-36-145-144.ap-northeast-2.compute.amazonaws.com:8080/api/v1/';
  Map<String, String> headers;

  /// routines
  Future<Map<String, dynamic>> routines() async {
    var result = 0;
    var routinesList;

    var response;
    var client = http.Client();

    await _getAccessToken();

    try {
      response = await client.get(
        Uri.parse(apiAddress + 'users/routines?hasExercise=true'),
        headers: headers,
      );
      result = response.statusCode;
      // print('users/routines api 호출 결과 : $result');
    } catch (e) {
      print('users/routines api 호출 실패\n에러 : $e');
    } finally {

      client.close();
    }

    if (200 == result) {
      // print(response.body);
      routinesList = RoutineSimpleInfoList.fromJson(
          json.decode(utf8.decode(response.bodyBytes)));
    }

    return {'result': result, 'routinesList': routinesList};
  }

  /// details
  Future<Map<String, dynamic>> details(int id) async {
    var result = 0;
    var routineDetail;

    var response;
    var client = http.Client();

    await _getAccessToken();

    try {
      print('details: ' + id.toString());
      response = await client.get(
        Uri.parse(apiAddress + 'routines/' + id.toString()),
        headers: headers,
      );
      result = response.statusCode;
      // print('routines/$id api 호출 결과 : $result');
    } catch (e) {
      print('routines/$id api 호출 실패\n에러 : $e');
    } finally {

      client.close();
    }

    if(200 == result) {
      routineDetail = RoutineDetailInfo.fromJson(
          json.decode(utf8.decode(response.bodyBytes)));
    }

    return {
      'result': result,
      'routineDetail': routineDetail
    };
  }

  /// records
  Future<int> records(RecordRequestInfo recordInfo) async {
    var result = 0;

    var client = http.Client();
    var body = json.encode(recordInfo.toJson());
    // print(body);

    await _getAccessToken();

    try {
      var response = await client.post(Uri.parse(apiAddress + 'records'),
          headers: headers, body: body);

      result = response.statusCode;
      // print('api 호출 결과 : $result');
    } catch (e) {
      print('records api 호출 실패\n에러 : $e');
    } finally {
      client.close();
    }

    return result;
  }
}
