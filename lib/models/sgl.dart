import 'dart:convert';

class Sgl {
  final String name;
  final DateTime sglDate;
  final bool completed;

  Sgl({
    this.name,
    this.sglDate,
    this.completed
  });

  static Sgl fromData(Map<String, dynamic> data){
    return Sgl(
      name: data["name"],
      sglDate: data["sglDate"] != null ? DateTime.parse(data["sglDate"]) : null,
        completed: data["completed"] != null ? data["completed"] : false,
    );
  }

  static Sgl fromJson(String jsonString){
    Map<String, dynamic> data = json.decode(jsonString);
    return fromData(data);
  }

  static List<Sgl> fromJsonArray(String jsonArrayString){
    List data = json.decode(jsonArrayString);
    List<Sgl> result = [];
    for(var i=0; i<data.length; i++){
      result.add(fromData(data[i]));
    }
    return result;
  }
}