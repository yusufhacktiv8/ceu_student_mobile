import 'dart:convert';

class Student {
  final String oldSid;
  final String newSid;
  final String name;
  final DateTime birthDate;
  final String mobilePhone;
  final String phone;
  final String email;
  final String address;

  Student({
    this.oldSid,
    this.newSid,
    this.name,
    this.birthDate,
    this.mobilePhone,
    this.phone,
    this.email,
    this.address,
  });

  static Student fromData(Map<String, dynamic> data){
    return Student(
      oldSid: data["oldSid"],
      newSid: data["newSid"],
      name: data["name"],
      birthDate: data["birthDate"] != null ? DateTime.parse(data["birthDate"]) : null,
      mobilePhone: data["mobilePhone"],
      phone: data["phone"],
      email: data["email"],
      address: data["address"],

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