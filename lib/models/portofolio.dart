import 'dart:convert';

class Portofolio {
  final String name;
  final DateTime portofolioDate;
  final bool completed;

  Portofolio({
    this.name,
    this.portofolioDate,
    this.completed
  });

  static Portofolio fromData(Map<String, dynamic> data){
    return Portofolio(
      name: data["name"],
      portofolioDate: data["portofolioDate"] != null ? DateTime.parse(data["portofolioDate"]) : null,
        completed: data["completed"] != null ? data["completed"] : false,
    );
  }

  static Portofolio fromJson(String jsonString){
    Map<String, dynamic> data = json.decode(jsonString);
    return fromData(data);
  }

  static List<Portofolio> fromJsonArray(String jsonArrayString){
    List data = json.decode(jsonArrayString);
    List<Portofolio> result = [];
    for(var i=0; i<data.length; i++){
      result.add(fromData(data[i]));
    }
    return result;
  }
}