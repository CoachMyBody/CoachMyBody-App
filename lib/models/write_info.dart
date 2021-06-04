import 'dart:ffi';

class InbodyRequestInfo {
  String date;
  double weight;
  double skeletalMuscleMass;
  double bodyFatMass;

  InbodyRequestInfo(
      this.date, this.weight, this.skeletalMuscleMass, this.bodyFatMass);

  InbodyRequestInfo.fromJson(Map<String, dynamic> json)
      : date = json['date'] as String,
        weight = json['weight'] as double,
        skeletalMuscleMass = json['skeletalMuscleMass'] as double,
        bodyFatMass = json['bodyFatMass'] as double;

  Map<String, dynamic> toJson() => {
        'date': date,
        'weight': weight,
        'skeletalMuscleMass': skeletalMuscleMass,
        'bodyFatMass': bodyFatMass
      };
}

class NunbodyRequestInfo {
  String date;
  String imageUri;
  String tag;

  NunbodyRequestInfo(this.date, this.imageUri, this.tag);

  NunbodyRequestInfo.fromJson(Map<String, dynamic> json)
      : date = json['date'] as String,
        imageUri = json['imageUri'] as String,
        tag = json['tag'] as String;

  Map<String, dynamic> toJson() =>
      {'date': date, 'imageUri': imageUri, 'tag': tag};
}

class RecordRequestInfo {
  String date;
  Uint64 routineId;
  Uint32 hours;
  Uint32 minutes;

  // optional data
  String feedbackBySelf;
  InbodyRequestInfo inbody;
  NunbodyRequestInfo nunbody;

  RecordRequestInfo(this.date, this.routineId, this.hours, this.minutes);

  RecordRequestInfo.fromJson(Map<String, dynamic> json)
      : date = json['date'] as String,
        routineId = json['routineId'] as Uint64,
        hours = json['hours'] as Uint32,
        minutes = json['minutes'] as Uint32,
        feedbackBySelf = (null != json['feedbackBySelf'])
            ? json['feedbackBySelf'] as String
            : null,
        inbody = (null != json['inbody'])
            ? json['inbody'] as InbodyRequestInfo
            : null,
        nunbody = (null != json['nunbody'])
            ? json['nunbody'] as NunbodyRequestInfo
            : null;

  Map<String, dynamic> toJson() => {
        'date': date,
        'routineId': routineId,
        'hours': hours,
        'minutes': minutes,
        'feedbackBySelf': (null != feedbackBySelf) ? feedbackBySelf : null,
        'inbody': (null != inbody) ? inbody : null,
        'nunbody': (null != nunbody) ? nunbody : null
      };
}
