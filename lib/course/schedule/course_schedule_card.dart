import 'package:ceu_student/course/schedule/course_schedule.dart';
import 'package:flutter/material.dart';

class CourseScheduleCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
//      height: 490,
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text("Schedule", style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87
                ),),
              ],
            ),
          ),
          Container(
//            padding: EdgeInsets.all(10),
//            height: 420,
            child: CourseSchedule(),
          ),
        ],
      ),
    );
  }
}