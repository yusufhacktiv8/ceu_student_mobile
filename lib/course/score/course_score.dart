import 'package:ceu_student/course/score/course_score_item.dart';
import 'package:flutter/material.dart';
import 'package:ceu_student/models/course.dart';
import 'package:ceu_student/models/score.dart';

class CourseScore extends StatelessWidget {

  final Course course;

  CourseScore({Key key,
    this.course,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    double pretest = 0.0;
    double caseReport = 0.0;

    if (course != null) {
      List<Score> scores = course.scores;
      for(var i=0; i<scores.length; i++){
        Score score = scores[i];
        switch(score.type.code) {
          case 'PRETEST':
            pretest = score.scoreValue;
            break;
          case 'CASEREPORT':
            caseReport = score.scoreValue;
            break;

        }
      }
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
            percentage: caseReport * 0.1,
          ),
          Divider(),
          CourseScoreItem(
            name: Text(
              'Weekly Discussion',
//              style: TextStyle(fontSize: 14),
            ),
            score: 89.0,
            percentage: 17.8,
          ),
          Divider(),
          CourseScoreItem(
            name: Text(
              'Case Test',
//              style: TextStyle(fontSize: 14),
            ),
            score: 85.0,
            percentage: 29.75,
          ),
          Divider(),
          CourseScoreItem(
            name: Text(
              'Post Test',
//              style: TextStyle(fontSize: 14),
            ),
            score: 85.0,
            percentage: 99.99,
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
            score: 386.5,
            percentage: 100,
          ),
        ],
      ),
    );
  }
}
