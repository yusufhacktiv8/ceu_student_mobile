import 'package:ceu_student/course/score/course_score_item.dart';
import 'package:flutter/material.dart';
import 'package:ceu_student/models/course.dart';

class CourseScore extends StatelessWidget {

  final Course course;

  CourseScore({Key key,
    this.course,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    double pretest = 0.0;
    double caseReport = 0.0;
    double caseReportPercentage = 0.0;
    double weeklyDiscussion = 0.0;
    double weeklyDiscussionPercentage = 0.0;
    double caseTest = 0.0;
    double caseTestPercentage = 0.0;
    double postTest = 0.0;
    double postTestPercentage = 0.0;

    if (course != null) {
      pretest = course.pretest;
      caseReport = course.caseReport;
      caseReportPercentage = course.caseReportPercentage;
      weeklyDiscussion = course.weeklyDiscussion;
      weeklyDiscussionPercentage = course.weeklyDiscussionPercentage;
      caseTest = course.caseTest;
      caseTestPercentage = course.caseTestPercentage;
      postTest = course.postTest;
      postTestPercentage = course.postTestPercentage;
    }
    return Container(
      child: Column(
        children: <Widget>[
          CourseScoreItem(
            name: Text(
              'Pre Test (SCB)',
//              style: TextStyle(fontSize: 14),
            ),
            score: pretest,
            percentage: 0.00,
          ),
          Divider(),
          CourseScoreItem(
            name: Text(
              'Case Report',
//              style: TextStyle(fontSize: 14),
            ),
            score: caseReport,
            percentage: caseReportPercentage,
          ),
          Divider(),
          CourseScoreItem(
            name: Text(
              'Weekly Discussion',
//              style: TextStyle(fontSize: 14),
            ),
            score: weeklyDiscussion,
            percentage: weeklyDiscussionPercentage,
          ),
          Divider(),
          CourseScoreItem(
            name: Text(
              'Case Test',
//              style: TextStyle(fontSize: 14),
            ),
            score: caseTest,
            percentage: caseTestPercentage,
          ),
          Divider(),
          CourseScoreItem(
            name: Text(
              'Post Test',
//              style: TextStyle(fontSize: 14),
            ),
            score: postTest,
            percentage: postTestPercentage,
          ),
          Divider(),
          CourseScoreItem(
            name: Text(
              'Total',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.green),
            ),
            score: (pretest + caseReport + weeklyDiscussion + caseTest + postTest),
            percentage: (caseReportPercentage + weeklyDiscussionPercentage + caseTestPercentage + postTestPercentage),
          ),
        ],
      ),
    );
  }
}
