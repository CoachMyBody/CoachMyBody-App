import 'dart:ffi';

class RoutineExerciseInfo {
  int exerciseLab;
  int exerciseSet;
  int id;
  String imageUri;
  String name;

  RoutineExerciseInfo(
      {this.exerciseLab, this.exerciseSet, this.id, this.imageUri, this.name});

  RoutineExerciseInfo.fromJson(Map<String, dynamic> json)
      : exerciseLab = json['exerciseLab'] as int,
        exerciseSet = json['exerciseSet'] as int,
        id = json['id'] as int,
        imageUri = json['imageUri'] as String,
        name = json['name'] as String;

  Map<String, dynamic> toJson() => {
        'exerciseLab': exerciseLab,
        'exerciseSet': exerciseSet,
        'id': id,
        'imageUri': imageUri,
        'name': name
      };
}

class RoutineDetailInfo {
  List<RoutineExerciseInfo> exercises;
  int id;
  String title;

  RoutineDetailInfo({this.exercises, this.id, this.title});

  RoutineDetailInfo.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int,
        title = json['title'] as String {
    var list = json['exercises'] as List;
    exercises = list.map((index) => RoutineExerciseInfo.fromJson(index)).toList();
  }

  Map<String, dynamic> toJson() =>
      {'exercises': exercises, 'id': id, 'title': title};
}

class RoutineSimpleInfo {
  int exerciseCount;
  int id;
  String imageUri;
  String title;

  RoutineSimpleInfo({this.exerciseCount, this.id, this.imageUri, this.title});

  RoutineSimpleInfo.fromJson(Map<String, dynamic> json)
      : exerciseCount = json['exerciseCount'] as int,
        id = json['id'] as int,
        imageUri = json['imageUri'] as String,
        title = json['title'] as String;

  Map<String, dynamic> toJson() => {
        'exerciseCount': exerciseCount,
        'id': id,
        'imageUri': imageUri,
        'title': title
      };
}

class RoutineSimpleInfoList {
  List<RoutineSimpleInfo> routines;

  RoutineSimpleInfoList({this.routines});

  RoutineSimpleInfoList.fromJson(List<dynamic> json) {
    routines = json.map((i) => RoutineSimpleInfo.fromJson(i)).toList();
  }
}
