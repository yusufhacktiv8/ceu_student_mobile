import 'dart:convert';

import 'package:ceu_student/models/department.dart';
import 'package:ceu_student/models/score.dart';

class Course {
  final int id;
  final Department department;
  final String title;
  final int status;
  final int sglCount;
  final int portofolioCount;
  final int seminarCount;
  final int problemCount;
  final List<Score> scores;
  final DateTime planStartDate;
  final DateTime planStartDate1;

  double pretest = 0.0;
  double caseReport = 0.0;
  double caseReportPercentage = 0.0;
  double weeklyDiscussion = 0.0;
  double weeklyDiscussionPercentage = 0.0;
  double caseTest = 0.0;
  double caseTestPercentage = 0.0;
  double postTest = 0.0;
  double postTestPercentage = 0.0;
  double total = 0.0;
  double totalPercentage = 0.0;

  Course({
    this.id,
    this.department,
    this.title,
    this.status,
    this.sglCount,
    this.portofolioCount,
    this.seminarCount,
    this.problemCount,
    this.scores,
    this.planStartDate,
    this.planStartDate1
  });

  static Course fromData(Map<String, dynamic> data){
    List scoreList = data['scores'] != null ? data['scores'] : new List();
    var scores = Score.fromList(scoreList);
    var course =  Course(
      id: data['id'],
      department: Department.fromData(data['Department']),
      title: data['title'],
      status: data['status'],
      sglCount: data['sglCount'],
      portofolioCount: data['portofolioCount'],
      seminarCount: data['seminarCount'],
      problemCount: data['problemCount'],
      planStartDate: data["planStartDate"] != null ? DateTime.parse(data["planStartDate"]) : null,
      planStartDate1: data["planStartDate1"] != null ? DateTime.parse(data["planStartDate1"]) : null,
      scores: scores,
    );

    if (scores != null) {
      List<Score> scores = course.scores;
      for(var i=0; i<scores.length; i++){
        Score score = scores[i];
        double scoreValue = score.scoreValue;
        switch(score.type.code) {
          case 'PRETEST':
            course.pretest = scoreValue;
            break;
          case 'CASEREPORT':
            course.caseReport = scoreValue;
            course.caseReportPercentage = course.caseReport * 0.1;
            break;
          case 'WEEKLYDISCUSSION':
            course.weeklyDiscussion = scoreValue;
            course.weeklyDiscussionPercentage = course.weeklyDiscussion * 0.2;
            break;
          case 'CASETEST':
            course.caseTest = scoreValue;
            course.caseTestPercentage = course.caseTest * 0.35;
            break;
          case 'POSTTEST':
            course.postTest = scoreValue;
            course.postTestPercentage = course.postTest * 0.35;
            break;

        }
      }

      course.total = course.pretest + course.caseReport + course.weeklyDiscussion + course.caseTest + course.postTest;
      course.totalPercentage = course.caseReportPercentage + course.weeklyDiscussionPercentage + course.caseTestPercentage + course.postTestPercentage;
    }

    return course;
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