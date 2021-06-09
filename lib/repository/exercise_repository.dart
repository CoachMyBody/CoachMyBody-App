import 'dart:convert';

import 'package:coach_my_body/models/exercises.dart';
import 'package:http/http.dart' as http;

class ExerciseRepository {
  // 따로 관리할 예정
  final String apiAddress = 'http://ec2-3-36-145-144.ap-northeast-2.compute.amazonaws.com:8080/api/v1/';
  final String apiAddress_get = 'ec2-3-36-145-144.ap-northeast-2.compute.amazonaws.com:8080/api/v1/';

  // 헤더에 담아줘야함
  final Map<String, String> headers = {
    'Accept': 'application/json',
    'content-type': 'application/json'
  };

  /// exercises
  /// 운동 리스트 조회
  Future<Map<String, dynamic>> exercises(ExercisesSelectModel item) async {
    var result = 0;
    List<ExerciseInfo> exercisesList;

    var client = http.Client();
    final body = item.toJson();

    // final uri = Uri.http(apiAddress_get, 'exercises', body);
    // print(uri);

    try {
      var response = await client.get(
        Uri.parse('http://ec2-3-36-145-144.ap-northeast-2.compute.amazonaws.com:8080/api/v1/exercises?bodyPart=NONE&category=FITNESS&page=0&size=100'),
        headers: headers
      );

      result = response.statusCode;
      if (result == 200) {
        List<dynamic> tempJson = json.decode(response.body);
        exercisesList = tempJson.map((e) => ExerciseInfo.fromJson(e)).toList();
      }

      print('exercises api 호출 결과 : ${exercisesList[0].name}');
    }
    catch (e) {
      print('exercises api 호출 실패\n에러 : $e');
    }
    finally {
      client.close();
    }

    return {'result': result, 'exercisesList': exercisesList};
  }
}