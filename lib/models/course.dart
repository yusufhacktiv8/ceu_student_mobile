import 'dart:convert';

import 'package:ceu_student/models/department.dart';
import 'package:ceu_student/models/score.dart';

class Course {
  final int id;
  final Department department;
  final String title;
  final int status;
  final String problemDescription;
  final int sglCount;
  final int portofolioCount;
  final int seminarCount;
  final int problemCount;
  final List<Score> scores;
  final DateTime planStartDate;
  final DateTime planStartDate1;
  final DateTime planStartDate2;
  final DateTime planStartDate3;
  final DateTime planEndDate;
  final DateTime planEndDate1;
  final DateTime planEndDate2;
  final DateTime planEndDate3;
  final DateTime realStartDate;
  final DateTime realStartDate1;
  final DateTime realStartDate2;
  final DateTime realStartDate3;
  final DateTime realEndDate;
  final DateTime realEndDate1;
  final DateTime realEndDate2;
  final DateTime realEndDate3;
  final String hospital1;
  final String hospital2;
  final String clinic;
  final String adviser;
  final String examiner;
  final String dpk;

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
    this.problemDescription,
    this.sglCount,
    this.portofolioCount,
    this.seminarCount,
    this.problemCount,
    this.scores,
    this.planStartDate,
    this.planStartDate1,
    this.planStartDate2,
    this.planStartDate3,
    this.planEndDate,
    this.planEndDate1,
    this.planEndDate2,
    this.planEndDate3,
    this.realStartDate,
    this.realStartDate1,
    this.realStartDate2,
    this.realStartDate3,
    this.realEndDate,
    this.realEndDate1,
    this.realEndDate2,
    this.realEndDate3,
    this.adviser,
    this.examiner,
    this.dpk,
    this.hospital1,
    this.hospital2,
    this.clinic,
  });

  static Course fromData(Map<String, dynamic> data){
    List scoreList = data['scores'] != null ? data['scores'] : new List();
    var scores = Score.fromList(scoreList);
    var course =  Course(
      id: data['id'],
      department: Department.fromData(data['Department']),
      title: data['title'],
      status: data['status'],
      problemDescription: data['problemDescription'],
      sglCount: data['sglCount'],
      portofolioCount: data['portofolioCount'],
      seminarCount: data['seminarCount'],
      problemCount: data['problemCount'],
      planStartDate: data["planStartDate"] != null ? DateTime.parse(data["planStartDate"]) : null,
      planStartDate1: data["planStartDate1"] != null ? DateTime.parse(data["planStartDate1"]) : null,
      planStartDate2: data["planStartDate2"] != null ? DateTime.parse(data["planStartDate2"]) : null,
      planStartDate3: data["planStartDate3"] != null ? DateTime.parse(data["planStartDate3"]) : null,
      planEndDate: data["planEndDate"] != null ? DateTime.parse(data["planEndDate"]) : null,
      planEndDate1: data["planEndDate1"] != null ? DateTime.parse(data["planEndDate1"]) : null,
      planEndDate2: data["planEndDate2"] != null ? DateTime.parse(data["planEndDate2"]) : null,
      planEndDate3: data["planEndDate3"] != null ? DateTime.parse(data["planEndDate3"]) : null,

      realStartDate: data["realStartDate"] != null ? DateTime.parse(data["realStartDate"]) : null,
      realStartDate1: data["realStartDate1"] != null ? DateTime.parse(data["realStartDate1"]) : null,
      realStartDate2: data["realStartDate2"] != null ? DateTime.parse(data["realStartDate2"]) : null,
      realStartDate3: data["realStartDate3"] != null ? DateTime.parse(data["realStartDate3"]) : null,
      realEndDate: data["realEndDate"] != null ? DateTime.parse(data["realEndDate"]) : null,
      realEndDate1: data["realEndDate1"] != null ? DateTime.parse(data["realEndDate1"]) : null,
      realEndDate2: data["realEndDate2"] != null ? DateTime.parse(data["realEndDate2"]) : null,
      realEndDate3: data["realEndDate3"] != null ? DateTime.parse(data["realEndDate3"]) : null,
      adviser: data['adviser'],
      examiner: data['examiner'],
      dpk: data['dpk'],
      hospital1: data['hospital1'],
      hospital2: data['hospital2'],
      clinic: data['clinic'],
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