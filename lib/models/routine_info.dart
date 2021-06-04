import 'dart:ffi';

class RoutineExerciseInfo {
  Uint32 exerciseLab;
  Uint32 exerciseSet;
  Uint64 id;
  String imageUri;
  String name;

  RoutineExerciseInfo(
      {this.exerciseLab, this.exerciseSet, this.id, this.imageUri, this.name});

  RoutineExerciseInfo.fromJson(Map<String, dynamic> json)
      : exerciseLab = json['exerciseLab'] as Uint32,
        exerciseSet = json['exerciseSet'] as Uint32,
        id = json['id'] as Uint64,
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
  Uint64 id;
  String title;

  RoutineDetailInfo(this.exercises, this.id, this.title);

  RoutineDetailInfo.fromJson(Map<String, dynamic> json)
      : exercises = json['exercises'] as List<RoutineExerciseInfo>,
        id = json['id'] as Uint64,
        title = json['title'] as String;

  Map<String, dynamic> toJson() =>
      {'exercises': exercises, 'id': id, 'title': title};
}

class RoutineSimpleInfo {
  Uint32 exerciseCount;
  Uint64 id;
  String imageUri;
  String title;

  RoutineSimpleInfo(this.exerciseCount, this.id, this.imageUri, this.title);

  RoutineSimpleInfo.fromJson(Map<String, dynamic> json)
      : exerciseCount = json['exerciseCount'] as Uint32,
        id = json['id'] as Uint64,
        imageUri = json['imageUri'] as String,
        title = json['title'] as String;

  Map<String, dynamic> toJson() => {
        'exerciseCount': exerciseCount,
        'id': id,
        'imageUri': imageUri,
        'title': title
      };
}
