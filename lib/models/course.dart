import 'dart:convert';

import 'package:ceu_student/models/department.dart';

class Course {
  final int id;
  final Department department;
  final String title;
  final int status;
  final int sglCount;

  Course({
    this.id,
    this.department,
    this.title,
    this.status,
    this.sglCount,
  });

  static Course fromData(Map<String, dynamic> data){
    return Course(
      id: data['id'],
      department: Department.fromData(data['Department']),
      title: data['title'],
      status: data['status'],
      sglCount: data['sglCount'],
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