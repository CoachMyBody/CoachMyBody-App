import 'package:coach_my_body/models/exercises.dart';
import 'package:coach_my_body/models/routine_exercise_detail.dart';
import 'package:coach_my_body/repository/exercise_repository.dart';
import 'package:flutter/cupertino.dart';

class RoutineExerciseDetailViewModel extends ChangeNotifier {
  ExerciseRepository _exerciseRepository = ExerciseRepository();
  List<ExerciseInfo> _exerciseInfoLists = [];

  List<ExerciseInfo> get exerciseInfoLists => _exerciseInfoLists;

  loadExerciseInfoLists(String bodyPart, String exerciseName) async {
    // bodyPart 분류
    String bodyPart = '';
    switch (bodyPart) {
      case '전체':
        bodyPart = 'NONE';
        break;
      case '전신':
        bodyPart = 'FULL_BODY';
        break;
      case '상체':
        bodyPart = 'UPPER_BODY';
        break;
      case '하체':
        bodyPart = 'LOWER_BODY';
        break;
    }

    // category 분류
    String category = '';
    switch (exerciseName) {
      case '헬스':
        category = 'FITNESS';
        break;
      case '필라테스':
        category = 'PILATES';
        break;
    }

    // 추후에 페이징 기능 들어갈 때 동적코드로 수정
    int page = 0;
    int size = 100;

    final exercisesSelectModel = ExercisesSelectModel(
      bodyPart: bodyPart,
      category: category,
      page: page,
      size: size
    );

    var result = await _exerciseRepository.exercises(exercisesSelectModel);

    notifyListeners();
  }


}