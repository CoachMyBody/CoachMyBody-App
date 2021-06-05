import 'package:coach_my_body/models/routine_info.dart';
import 'package:coach_my_body/models/write_info.dart';
import 'package:coach_my_body/repository/record_repository.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class WriteDataProvider extends ChangeNotifier {
  bool _bRoutineSelected;
  bool _bRequiredDataFull;
  RecordRequestInfo _recordData; // TODO: 지워? 말아? 아직 안 씀

  String _date;
  int _routineId;
  int _hours;
  int _minutes;

  WriteDataProvider() {
    _bRoutineSelected = false;

    DateTime now = DateTime.now();
    _date = DateFormat('yyyy-MM-dd').format(now);
  }

  bool get isRoutineSelected => _bRoutineSelected;

  set bRoutineSelected(bool bRequiredDataFull) {
    _bRoutineSelected = bRequiredDataFull;
    notifyListeners();
  }

  bool get isRequiredDataFull => _bRequiredDataFull;

  set bRequiredDataFull(bool bRequiredDataFull) {
    _bRequiredDataFull = bRequiredDataFull;
    notifyListeners();
  }

  RecordRequestInfo get recordData => _recordData;

  set recordData(RecordRequestInfo data) {
    _recordData = data;
    notifyListeners();
  }

  String get getDate => _date;

  set date(String date) {
    _date = date;
  }

  int get getRoutineId => _routineId;

  set routineId(int routineId) {
    _routineId = routineId;
  }

  int get getHours => _hours;

  set hours(int hours) {
    _hours = hours;
  }

  int get getMinutes => _minutes;

  set minutes(int minutes) {
    _minutes = minutes;
  }

  void checkRequiredData() {
    // TODO
  }
}

class MyRoutinesProvider extends ChangeNotifier {
  RoutineSimpleInfoList _routines;
  RoutineDetailInfo _selected;

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
    if (200 != result['result']) {
      assert(200 == result['result']);
    }

    _routines = await result['routinesList'];

    notifyListeners();
  }

  RoutineDetailInfo get selected => _selected;

  set selected(RoutineDetailInfo data) {
    _selected = data;
    notifyListeners();
  }

  Future<void> fetchDetailRoutine(int id) async {
    var recordRepository = RecordRepository();

    var result = await recordRepository.details(id);
    switch(result['result']) {
      case 200: {
        break;
      }
      case 404: {
        print('_fetchDetailRoutine: 존재하지 않는 데이터 입니다.');
        assert(200 == result['result']);
        break;
      }
      default: {
        print('_fetchDetailRoutine: Unknown error');
        assert(200 == result['result']);
        break;
      }
    }

    _selected = await result['routineDetail'];
    print(_selected.title);

    notifyListeners();
  }
}
