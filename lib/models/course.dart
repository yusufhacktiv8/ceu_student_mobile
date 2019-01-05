import 'dart:convert';

import 'package:ceu_student/models/department.dart';

class Course {
  final Department department;
  final String title;
  final int status;

  Course({
    this.department,
    this.title,
    this.status,
  });

  static Course fromData(Map<String, dynamic> data){
    return Course(
      department: Department.fromData(data['Department']),
      title: data['title'],
      status: data['status'],
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