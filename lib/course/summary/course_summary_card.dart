import 'package:ceu_student/course/summary/course_summary.dart';
import 'package:ceu_student/models/course.dart';
import 'package:flutter/material.dart';

class CourseSummaryCard extends StatelessWidget {

  final Course course;

  CourseSummaryCard({Key key,
    this.course,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
//      height: 430,
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey, width: 0.3),
          borderRadius: BorderRadius.all(Radius.circular(5))
      ),
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(10),
            height: 60,
            decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: Colors.grey, width: 0.3))
            ),
            child: Row(
              children: <Widget>[
                Text("Summary", style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87
                ),)
              ],
            ),
          ),
          Container(
//            padding: EdgeInsets.all(10),
//            height: 345,
            child: CourseSummary(course: course),
          ),
        ],
      ),
    );
  }
}