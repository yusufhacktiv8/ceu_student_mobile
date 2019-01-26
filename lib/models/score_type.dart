import 'dart:convert';

class ScoreType {
  final String code;
  final String name;

  ScoreType({
    this.code,
    this.name,
  });

  static ScoreType fromData(Map<String, dynamic> data){
    return ScoreType(
      code: data["code"],
      name: data["name"],
    );
  }

  static ScoreType fromJson(String jsonString){
    Map<String, dynamic> data = json.decode(jsonString);
    return fromData(data);
  }

  static List<ScoreType> fromJsonArray(String jsonArrayString){
    List data = json.decode(jsonArrayString);
    List<ScoreType> result = [];
    for(var i=0; i<data.length; i++){
      result.add(fromData(data[i]));
    }
    return result;
  }
}