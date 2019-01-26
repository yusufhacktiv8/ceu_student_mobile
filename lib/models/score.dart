import 'dart:convert';

import 'package:ceu_student/models/score_type.dart';

class Score {
  final int id;
  final double scoreValue;
  final DateTime scoreDate;
  final ScoreType type;

  Score({
    this.id,
    this.scoreValue,
    this.scoreDate,
    this.type,
  });

  static Score fromData(Map<String, dynamic> data){
    return Score(
      id: data['id'],
      scoreValue: data['scoreValue'] != null ? (data['scoreValue'] as num).toDouble() : 0.0,
      scoreDate: data["scoreDate"] != null ? DateTime.parse(data["scoreDate"]) : null,
      type: ScoreType.fromData(data['ScoreType']),
    );
  }

  static List<Score> fromList(List data){
    List<Score> result = [];
    for(var i=0; i<data.length; i++){
      result.add(fromData(data[i]));
    }
    return result;
  }

  static Score fromJson(String jsonString){
    Map<String, dynamic> data = json.decode(jsonString);
    return fromData(data);
  }

  static List<Score> fromJsonArray(String jsonArrayString){
    List data = json.decode(jsonArrayString);
    List<Score> result = [];
    for(var i=0; i<data.length; i++){
      result.add(fromData(data[i]));
    }
    return result;
  }
}