import 'dart:convert';

class Course {
  final String name;

  Course({
    this.name,
  });

  static Course fromData(Map<String, dynamic> data){
    return Course(
      name: data["name"],
    );
  }

  static Course fromJson(String jsonString){
    Map<String, dynamic> data = json.decode(jsonString);
    return fromData(data);
  }

  static List<Course> fromJsonArray(String jsonArrayString){
    List data = json.decode(jsonArrayString);
    List<Course> result = [];
    for(var i=0; i<data.length; i++){
      result.add(fromData(data[i]));
    }
    return result;
  }
}