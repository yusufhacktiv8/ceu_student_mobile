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
            planTo: course != null ? course.planEndDate : null,
            realFrom: course != null ? course.realStartDate : null,
            realTo: course != null ? course.realEndDate : null,
          ),
          Divider(),
          CourseScheduleItem(
            title: 'Hospital 1',
            description: course != null ? course.hospital1 : null,
            planFrom: course != null ? course.planStartDate1 : null,
            planTo: course != null ? course.planEndDate1 : null,
            realFrom: course != null ? course.realStartDate1 : null,
            realTo: course != null ? course.realEndDate1 : null,
            adviser: course != null ? course.adviser : null,
            examiner: course != null ? course.examiner : null,
          ),
          Divider(),
          CourseScheduleItem(
            title: 'Clinic',
            description: course != null ? course.clinic : null,
            planFrom: course != null ? course.planStartDate2 : null,
            planTo: course != null ? course.planEndDate2 : null,
            realFrom: course != null ? course.realStartDate2 : null,
            realTo: course != null ? course.realEndDate2 : null,
            dpk: course != null ? course.dpk : null,
          ),
          Divider(),
          CourseScheduleItem(
            title: 'Hospital 2',
            description: course != null ? course.hospital2: null,
            planFrom: course != null ? course.planStartDate3 : null,
            planTo: course != null ? course.planEndDate3 : null,
            realFrom: course != null ? course.realStartDate3 : null,
            realTo: course != null ? course.realEndDate3 : null,
          ),
          Padding(padding: EdgeInsets.only(bottom: 15),)
        ],
      ),
    );
  }
}
