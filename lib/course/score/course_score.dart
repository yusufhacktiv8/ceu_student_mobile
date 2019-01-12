import 'package:ceu_student/course/score/course_score_item.dart';
import 'package:flutter/material.dart';
import 'package:badge/badge.dart';

class CourseScore extends StatefulWidget {
  @override
  _CourseScoreState createState() => _CourseScoreState();
}

class _CourseScoreState extends State<CourseScore> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          CourseScoreItem(
            name: Text(
              'Pre Test (SCB)',
              style: TextStyle(fontSize: 14),
            ),
            score: 42.5,
            percentage: 0.00,
          ),
          Divider(
            color: Color(0xFFF1F1F1),
          ),
          CourseScoreItem(
            name: Text(
              'Case Report',
              style: TextStyle(fontSize: 14),
            ),
            score: 85.00,
            percentage: 8.5,
          ),
          Divider(
            color: Color(0xFFF1F1F1),
          ),
          CourseScoreItem(
            name: Text(
              'Weekly Discussion',
              style: TextStyle(fontSize: 14),
            ),
            score: 89.0,
            percentage: 17.8,
          ),
          Divider(
            color: Color(0xFFF1F1F1),
          ),
          CourseScoreItem(
            name: Text(
              'Case Test',
              style: TextStyle(fontSize: 14),
            ),
            score: 85.0,
            percentage: 29.75,
          ),
          Divider(
            color: Color(0xFFF1F1F1),
          ),
          CourseScoreItem(
            name: Text(
              'Post Test',
              style: TextStyle(fontSize: 14),
            ),
            score: 85.0,
            percentage: 99.99,
          ),
          Divider(
            color: Color(0xFFF1F1F1),
          ),
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
