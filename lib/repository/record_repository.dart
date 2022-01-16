import 'dart:convert';
import 'dart:io';

import 'package:coach_my_body/data/sharedpref/auth_preferences.dart';
import 'package:coach_my_body/models/routine_info.dart';
import 'package:coach_my_body/models/write_info.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

class RecordRepository {
  RecordRepository();

  Future<void> _getAccessToken() async {
    var pref = AuthPreferences();
    String accessToken = await pref.getAccessToken();

    // 헤더에 담아줘야함
    _headers = {
      'Accept': 'application/json',
      'content-type': 'application/json',
      'Authorization': 'Bearer $accessToken' // TODO: Just for test
    };
  }

  // 따로 관리할 예정
  final String apiAddress =
      'http://ec2-3-36-145-144.ap-northeast-2.compute.amazonaws.com:8080/api/v1/';
  Map<String, String> _headers;

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
        headers: _headers,
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
        headers: _headers,
      );
      result = response.statusCode;
      // print('routines/$id api 호출 결과 : $result');
    } catch (e) {
      print('routines/$id api 호출 실패\n에러 : $e');
    } finally {
      client.close();
    }

    if (200 == result) {
      routineDetail = RoutineDetailInfo.fromJson(
          json.decode(utf8.decode(response.bodyBytes)));
    }

    return {'result': result, 'routineDetail': routineDetail};
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
          headers: _headers, body: body);

      result = response.statusCode;
      // print('api 호출 결과 : $result');
    } catch (e) {
      print('records api 호출 실패\n에러 : $e');
    } finally {
      client.close();
    }

    return result;
  }

  Future<int> nunbody_image(File image) async {
    print('nunbody_image');
    var result = 0;

    var client = http.Client();

    await _getAccessToken();

    // var formData = FormData.fromMap({
    //   'image': http.MultipartFile.fromBytes('file', image.readAsBytesSync(), contentType: MediaType('multipart', 'form-data')),
    // });
    // var dio = Dio();

    try {
      // var response = await dio.post(
      //   Uri.parse(apiAddress + 'nunbody/image').toString(),
      //   data: formData,
      // );

      var request = http.MultipartRequest(
          'POST', Uri.parse(apiAddress + 'nunbody/image'));
      // var pic = await http.MultipartFile('image', image.readAsBytes().asStream(), image.lengthSync(), contentType: );
      var pic = http.MultipartFile.fromBytes('file', image.readAsBytesSync(),
          contentType: MediaType('multipart', 'form-data'));
      print(pic.contentType);
      request.files.add(pic);
      request.headers.addAll(_headers);

      var response = await request.send();

      result = response.statusCode;
      print(result);

      // print('api 호출 결과 : $result');
    } catch (e) {
      print('nunbody_image api 호출 실패\n에러 : $e');
    } finally {
      client.close();
      // dio.close();
    }

    return result;
  }

  /// daily
  Future<Map<String, dynamic>> daily(String date) async {
    var result = 0;
    var routinesList;

    var response;
    var client = http.Client();

    await _getAccessToken();

    try {
      response = await client.get(
        Uri.parse(apiAddress + 'records/daily?date=$date'),
        headers: _headers,
      );
      result = response.statusCode;
      // print('users/routines api 호출 결과 : $result');
    } catch (e) {
      print('records/daily api 호출 실패\n에러 : $e');
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
}
