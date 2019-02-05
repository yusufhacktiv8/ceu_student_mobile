import 'package:ceu_student/course/schedule/course_schedule_item.dart';
import 'package:flutter/material.dart';
import 'package:ceu_student/models/course.dart';

class CourseSchedule extends StatelessWidget {

  final Course course;

  CourseSchedule({Key key,
    this.course,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          CourseScheduleItem(
            title: 'Main',
            planFrom: course != null ? course.planStartDate : null,
          ),
          Divider(),
          CourseScheduleItem(
            title: 'Hospital 1',
            description: 'Ibnu Sina',
            planFrom: course != null ? course.planStartDate1 : null,
            adviser: "-",
            examiner: "-",
          ),
          Divider(),
          CourseScheduleItem(
            title: 'Clinic',
            description: 'Ibnu Sina',
            dpk: '-'
          ),
          Divider(),
          CourseScheduleItem(title: 'Hospital 2', description: 'Ibnu Sina',),
          Padding(padding: EdgeInsets.only(bottom: 15),)
        ],
      ),
    );
  }
}
