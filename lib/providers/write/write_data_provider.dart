import 'package:coach_my_body/models/routine_info.dart';
import 'package:coach_my_body/models/write_info.dart';
import 'package:coach_my_body/repository/record_repository.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class WriteDataProvider extends ChangeNotifier {
  bool _bRoutineSelected;
  bool _bRequiredDataFull;
  DateTime _timeToShow;

  // For sending data to server
  String _date;
  int _routineId;
  int _hours;
  int _minutes;

  InbodyRequestInfo _inbodyRequestInfo;
  NunbodyRequestInfo _nunbodyRequestInfo;

  WriteDataProvider() {
    _bRoutineSelected = false;
    _bRequiredDataFull = false;

    _timeToShow = DateTime.now();
    _date = DateFormat('yyyy-MM-dd').format(_timeToShow);
  }

  ///
  /// getters, setters
  ///
  bool get isRoutineSelected => _bRoutineSelected;

  set bRoutineSelected(bool bRoutineSelected) {
    _bRoutineSelected = bRoutineSelected;
    notifyListeners();
  }

  bool get isRequiredDataFull => _bRequiredDataFull;

  DateTime get timeToShow => _timeToShow;

  set timeToShow(DateTime dateTime) {
    _timeToShow = dateTime;
    notifyListeners();
  }

  String get getDate => _date;

  set date(String date) {
    _date = date;
    notifyListeners();
  }

  int get getRoutineId => _routineId;

  set routineId(int routineId) {
    _routineId = routineId;
    checkRequiredData();
  }

  int get getHours => _hours;

  set hours(int hours) {
    _hours = hours;
    checkRequiredData();
  }

  int get getMinutes => _minutes;

  set minutes(int minutes) {
    _minutes = minutes;
    checkRequiredData();
  }

  ///
  /// Internal
  ///
  void checkRequiredData() {
    if (true == _date.isEmpty) {
      print('checkRequiredData: date is empty.');
      _bRequiredDataFull = false;
      notifyListeners();
      return;
    }

    if ((null == _routineId || _routineId < 0) || false == _bRoutineSelected) {
      print('checkRequiredData: routineId is invalid value.');
      _bRequiredDataFull = false;
      notifyListeners();
      return;
    }

    if (null == _hours) {
      print('checkRequiredData: hours is null value.');
      _bRequiredDataFull = false;
      notifyListeners();
      return;
    }

    if (null == _minutes) {
      print('checkRequiredData: minutes is null value.');
      _bRequiredDataFull = false;
      notifyListeners();
      return;
    }

    _bRequiredDataFull = true;
    notifyListeners();
  }

  int _validateData() {
    // TODO
    return 0;
  }

  ///
  /// Interface
  ///

  void clean() {
    _bRoutineSelected = false;
    _bRequiredDataFull = false;

    _timeToShow = DateTime.now();
    _date = DateFormat('yyyy-MM-dd').format(_timeToShow);

    _routineId = 0;
    _hours = null;
    _minutes = null;

    notifyListeners();
  }

  Future<void> recordToServer() async {
    var recordRepository = RecordRepository();

    //
    // make RecordInfo
    //
    var recordInfo = RecordRequestInfo(_date, _routineId, _hours, _minutes);

    var result = await recordRepository.records(recordInfo);
    switch (result) {
      case 201:
        {
          break;
        }
      case 400:
        {
          print('recordToServer: property error.');
          assert(201 == result);
          break;
        }
      default:
        {
          print('recordToServer: Unknown error');
          assert(201 == result);
          break;
        }
    }

    // Clean data
    clean();

    notifyListeners();
  }
}

class InbodyDataProvider extends ChangeNotifier {
  String _date;
  int _weight;
  int _bfm;
  int _smm;

  String get getDate => _date;

  set date(String date) {
    _date = date;
  }

  int get getWeight => _weight;

  set weight(int weight) {
    _weight = weight;
  }

  int get getBfm => _bfm;

  set bfm(int bfm) {
    _bfm = bfm;
  }

  int get getSmm => _smm;

  set smm(int smm) {
    _smm = smm;
  }
}

class NunbodyDataProvider extends ChangeNotifier {
  String _date;
  String _imageUri;
  String _tag;

  String get getDate => _date;

  set date(String date) {
    _date = date;
  }

  String get getImageUri => _imageUri;

  set imageUri(String imageUri) {
    _imageUri = imageUri;
    notifyListeners();
  }

  String get getTag => _tag;

  set tag(String tag) {
    _tag = tag;
    notifyListeners();
  }
}

class MyRoutinesProvider extends ChangeNotifier {
  RoutineSimpleInfoList _routines;
  RoutineDetailInfo _selected;

  MyRoutinesProvider() {
    fetchRoutines();
  }

  void clean() {
    if (null != _routines) {
      _routines = null;
    }

    if (null != _selected) {
      _selected != null;
    }
  }

  RoutineSimpleInfoList get routines => _routines;

  set routines(RoutineSimpleInfoList data) {
    _routines = data;
    notifyListeners();
  }

  Future<void> fetchRoutines() async {
    if (null != _routines) {
      print('fetchRoutines: _routines is already exist');
      return;
    }

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
    switch (result['result']) {
      case 200:
        {
          print('_fetchDetailRoutine: success');
          break;
        }
      case 401:
        {
          print('_fetchDetailRoutine: 인증 실패');
          assert(200 == result['result']);
          break;
        }
      case 404:
        {
          print('_fetchDetailRoutine: 존재하지 않는 데이터 입니다.');
          assert(200 == result['result']);
          break;
        }
      default:
        {
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
