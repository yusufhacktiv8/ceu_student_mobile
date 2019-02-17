import 'dart:convert';

class Student {
  final String oldSid;
  final String newSid;
  final String name;
  final String mobilePhone;
  final DateTime birthDate;

  Student({
    this.oldSid,
    this.newSid,
    this.name,
    this.mobilePhone,
    this.birthDate,
  });

  static Student fromData(Map<String, dynamic> data){
    return Student(
      oldSid: data["oldSid"],
      newSid: data["newSid"],
      name: data["name"],
      mobilePhone: data["mobilePhone"],
      birthDate: data["birthDate"] != null ? DateTime.parse(data["birthDate"]) : null,
    );
  }

  static Student fromJson(String jsonString){
    Map<String, dynamic> data = json.decode(jsonString);
    return fromData(data);
  }

  static List<Student> fromJsonArray(String jsonArrayString){
    List data = json.decode(jsonArrayString);
    List<Student> result = [];
    for(var i=0; i<data.length; i++){
      result.add(fromData(data[i]));
    }
    return result;
  }
}