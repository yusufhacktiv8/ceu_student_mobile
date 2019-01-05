import 'dart:convert';

class Department {
  final String code;
  final String name;
  final String color;

  Department({
    this.code,
    this.name,
    this.color,
  });

  static Department fromData(Map<String, dynamic> data){
    return Department(
      code: data["code"],
      name: data["name"],
      color: data["color"],
    );
  }

  static Department fromJson(String jsonString){
    Map<String, dynamic> data = json.decode(jsonString);
    return fromData(data);
  }

  static List<Department> fromJsonArray(String jsonArrayString){
    List data = json.decode(jsonArrayString);
    List<Department> result = [];
    for(var i=0; i<data.length; i++){
      result.add(fromData(data[i]));
    }
    return result;
  }
}