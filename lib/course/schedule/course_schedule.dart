import 'package:ceu_student/course/schedule/course_schedule_item.dart';
import 'package:flutter/material.dart';

class CourseSchedule extends StatefulWidget {
  @override
  _CourseScheduleState createState() => _CourseScheduleState();
}

class _CourseScheduleState extends State<CourseSchedule> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          CourseScheduleItem(title: 'Main'),
          Divider(
            color: Color(0xFFA0A0A0),
          ),
          CourseScheduleItem(
            title: 'Hospital 1',
            description: 'Ibnu Sina',
            adviser: "-",
            examiner: "-",
          ),
          Divider(
            color: Color(0xFFA0A0A0),
          ),
          CourseScheduleItem(
            title: 'Clinic',
            description: 'Ibnu Sina',
            dpk: '-'
          ),
          Divider(
            color: Color(0xFFA0A0A0),
          ),
          CourseScheduleItem(title: 'Hospital 2', description: 'Ibnu Sina',),
        ],
      ),
    );
  }
}
