import 'dart:convert';

class Seminar {
  final String name;
  final DateTime eventDate;

  Seminar({
    this.name,
    this.eventDate,
  });

  static Seminar fromData(Map<String, dynamic> data){
    return Seminar(
      name: data["name"],
      eventDate: data["eventDate"] != null ? DateTime.parse(data["eventDate"]) : null,
    );
  }

  static Seminar fromJson(String jsonString){
    Map<String, dynamic> data = json.decode(jsonString);
    return fromData(data);
  }

  static List<Seminar> fromJsonArray(String jsonArrayString){
    List data = json.decode(jsonArrayString);
    List<Seminar> result = [];
    for(var i=0; i<data.length; i++){
      result.add(fromData(data[i]));
    }
    return result;
  }
}