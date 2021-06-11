class RecordRoutineSimpleInfo {
  int exerciseCount;
  int id;
  String imageUri;
  String title;

  bool hasFeedbackByTrainer;
  int hours;
  int minutes;

  RecordRoutineSimpleInfo(
      {this.exerciseCount,
      this.id,
      this.imageUri,
      this.title,
      this.hasFeedbackByTrainer,
      this.hours,
      this.minutes});

  RecordRoutineSimpleInfo.fromJson(Map<String, dynamic> json)
      : exerciseCount = json['exerciseCount'] as int,
        id = json['id'] as int,
        imageUri = json['imageUri'] as String,
        title = json['title'] as String,
        hasFeedbackByTrainer = json['hasFeedbackByTrainer'] as bool,
        hours = json['hours'] as int,
        minutes = json['minutes'] as int;

  Map<String, dynamic> toJson() => {
        'exerciseCount': exerciseCount,
        'id': id,
        'imageUri': imageUri,
        'title': title,
        'hasFeedbackByTrainer': hasFeedbackByTrainer,
        'hours': hours,
        'minutes': minutes
      };
}

class RecordMuscleInfo {
  int count;
  String muscle;

  RecordMuscleInfo(this.count, this.muscle);

  RecordMuscleInfo.fromJson(Map<String, dynamic> json)
      : count = json['count'] as int,
        muscle = json['muscle'] as String;

  Map<String, dynamic> toJson() => {'count': count, 'muscle': muscle};
}

class RecordDailyInfo {
  List<RecordRoutineSimpleInfo> routines;
  List<RecordMuscleInfo> muscles;

  RecordDailyInfo(this.routines, this.muscles);

  RecordDailyInfo.fromJson(Map<String, dynamic> json) {
    var routineList = json['routines'] as List;
    routines = routineList
        .map((index) => RecordRoutineSimpleInfo.fromJson(index))
        .toList();
    var musclesList = json['muscles'] as List;
    muscles =
        musclesList.map((index) => RecordMuscleInfo.fromJson(index)).toList();
  }
}
