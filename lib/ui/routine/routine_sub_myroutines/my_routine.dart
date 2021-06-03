class MyRoutine {
  int myRoutineId;
  String myRoutineImg;
  String myRoutineTitle;
  int exerciseCount;
  bool isSelected;

  MyRoutine(
      {this.myRoutineId,
      this.myRoutineImg,
      this.myRoutineTitle,
      this.exerciseCount,
      this.isSelected = false});

  void toggleChecked() {
    isSelected = !isSelected;
  }
}
