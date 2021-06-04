class RoutineExerciseDetail {
  String imageURL;
  String exerciseName;
  String exerciseSet;
  List<String> exerciseBodyTag;
  bool isSelected;

  RoutineExerciseDetail(
    this.imageURL,
    this.exerciseName,
    this.exerciseSet,
    this.exerciseBodyTag,
    {this.isSelected = false}
  );
}