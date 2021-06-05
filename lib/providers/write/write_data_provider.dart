import 'package:coach_my_body/models/routine_info.dart';
import 'package:coach_my_body/models/write_info.dart';
import 'package:coach_my_body/repository/record_repository.dart';
import 'package:flutter/material.dart';

class WriteDateProvider extends ChangeNotifier {
  bool _isRequiredDataFull;
  RecordRequestInfo _recordData;

  WriteDateProvider() {
    _isRequiredDataFull = false;
  }

  bool get isRequiredDataFull => _isRequiredDataFull;

  set isRequiredDataFull(bool bRequiredDataFull) {
    _isRequiredDataFull = bRequiredDataFull;
    notifyListeners();
  }

  RecordRequestInfo get recordData => _recordData;

  set recordData(RecordRequestInfo data) {
    _recordData = data;
    notifyListeners();
  }

  void checkRequiredData() {
    // TODO
  }
}

class MyRoutinesProvider extends ChangeNotifier {
  RoutineSimpleInfoList _routines;

  MyRoutinesProvider() {
    _fetchRoutines();
  }

  RoutineSimpleInfoList get routines => _routines;

  set routines(RoutineSimpleInfoList data) {
    _routines = data;
    notifyListeners();
  }

  Future<void> _fetchRoutines() async {
    var recordRepository = RecordRepository();

    var result = await recordRepository.routines();
    if(200 != result['result']) {
      assert(200 == result['result']);
    }

    _routines = await result['routinesList'];

    notifyListeners();
  }
}