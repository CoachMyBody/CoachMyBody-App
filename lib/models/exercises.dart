import 'dart:convert';

enum BodyPart {
  FULL_BODY,
  LOWER_BODY,
  NONE,
  UPPER_BODY,
}

enum ExerciseCategory {
  CARDIO,
  FITNESS,
  PILATES,
  YOGA
}

class ExercisesSelectModel {
  String bodyPart;
  String category;
  int page;
  int size;

  ExercisesSelectModel({
    this.bodyPart,
    this.category,
    this.page,
    this.size
  });

  Map<String, dynamic> toJson() => {
    'bodyPart': bodyPart,
    'category': category,
    'page': page,
    'size': size
  };
}

class ExerciseInfo {
  int id;
  String imageUri;
  String name;
  String sets;
  List<String> tags;

  ExerciseInfo({
    this.id,
    this.imageUri,
    this.name,
    this.sets,
    this.tags
  });

  factory ExerciseInfo.fromJson(Map<String, dynamic> json) {
    return ExerciseInfo(
      id: json['id'] as int,
      imageUri: json['imageUri'] as String,
      name: json['name'] as String,
      sets: json['sets'] as String,
    );
  }

}

class ExerciseDetailInfo {

}