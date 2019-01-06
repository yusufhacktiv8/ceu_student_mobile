import 'package:ceu_student/course/course_summary_item.dart';
import 'package:flutter/material.dart';
import 'package:badge/badge.dart';

class CourseSummary extends StatefulWidget {
  @override
  _CourseSummaryState createState() => _CourseSummaryState();
}

class _CourseSummaryState extends State<CourseSummary> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          CourseSummaryItem(
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
          CourseSummaryItem(
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
          CourseSummaryItem(
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
          CourseSummaryItem(
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
          CourseSummaryItem(
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
          CourseSummaryItem(
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
