import 'dart:convert';

class Problem {
  final String title;
  final DateTime problemDate;
  final bool completed;

  Problem({
    this.title,
    this.problemDate,
    this.completed
  });

  static Problem fromData(Map<String, dynamic> data){
    return Problem(
      title: data["title"],
      problemDate: data["problemDate"] != null ? DateTime.parse(data["problemDate"]) : null,
        completed: data["completed"] != null ? data["completed"] : false,
    );
  }

  static Problem fromJson(String jsonString){
    Map<String, dynamic> data = json.decode(jsonString);
    return fromData(data);
  }

  static List<Problem> fromJsonArray(String jsonArrayString){
    List data = json.decode(jsonArrayString);
    List<Problem> result = [];
    for(var i=0; i<data.length; i++){
      result.add(fromData(data[i]));
    }
    return result;
  }
}