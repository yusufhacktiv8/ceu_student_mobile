import 'package:ceu_student/models/course.dart';
import 'package:flutter/material.dart';
import '../components/chart_legend.dart';

class CourseChartLegend extends StatelessWidget {

  final List<Course> courses;

  CourseChartLegend({Key key,
    @required this.courses,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var onGoingCount = courses.where((course) => course.status == 1).length;
    var completedCount = courses.where((course) => course.status == 2).length;
    var scheduledCount = courses.where((course) => course.status == 0).length;
    var problemCount = courses.where((course) => course.status == 3).length;
    var pendingCount = courses.where((course) => course.status == 4).length;

    return Container(
        height: 200.0,
        width: 120.0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ChartLegend(count: scheduledCount, description: "Scheduled", color: Colors.grey,),
            Padding(padding: EdgeInsets.all(3),),
            ChartLegend(count: onGoingCount, description: "On Going", color: Colors.blue,),
            Padding(padding: EdgeInsets.all(3),),
            ChartLegend(count: completedCount, description: "Completed", color: Colors.green,),
            Padding(padding: EdgeInsets.all(3),),
            ChartLegend(count: problemCount, description: "Problem", color: Colors.red,),
            Padding(padding: EdgeInsets.all(3),),
            ChartLegend(count: pendingCount, description: "Pending", color: Colors.yellow,),
            Padding(padding: EdgeInsets.all(3),),
          ],
        ));
  }
}
