import 'package:ceu_student/events/events.dart';
import 'package:flutter/material.dart';
import 'package:flutter_circular_chart/flutter_circular_chart.dart';
import './course_chart_legend.dart';
import '../models/course.dart';

class  CourseChart extends StatefulWidget {
  @override
  _CourseChartState createState() => _CourseChartState();

  final List<Course> courses;

  CourseChart({Key key,
    @required this.courses,
  }) : super(key: key);

}

final GlobalKey<AnimatedCircularChartState> _chartKey = new GlobalKey<AnimatedCircularChartState>();

class _CourseChartState extends State<CourseChart> {

  List<Course> courses = [];

  @override
  void initState() {
    super.initState();
    this.courses = widget.courses;
    eventBus.on<CoursesChangedEvent>().listen((event) {
      this.courses = event.courses;
      _chartKey.currentState.updateData(getChartData(event.courses));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 15, top: 0),
      height: 200.0,
      color: Colors.white,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          AnimatedCircularChart(
            key: _chartKey,
            edgeStyle: SegmentEdgeStyle.round,
            size: const Size(200.0, 200.0),
            initialChartData: getChartData(widget.courses),
            chartType: CircularChartType.Radial,
            holeRadius: 41.0,
            holeLabel: "${courses.length}",
            labelStyle: TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold, color: Colors.black),
            duration: Duration(seconds: 1),
          ),
          Padding(padding: EdgeInsets.all(5),),
          CourseChartLegend(courses: courses,),
        ],
      ),
    );
  }

  List<CircularStackEntry> getChartData(List<Course> courses) {
    var onGoingCount = courses.where((course) => course.status == 1).length.toDouble();
    var completedCount = courses.where((course) => course.status == 2).length.toDouble();
    var scheduledCount = courses.where((course) => course.status == 0).length.toDouble();
    var problemCount = courses.where((course) => course.status == 3).length.toDouble();
    var pendingCount = courses.where((course) => course.status == 4).length.toDouble();
    return <CircularStackEntry>[
      new CircularStackEntry(
        <CircularSegmentEntry>[
          new CircularSegmentEntry(scheduledCount.toDouble(), Colors.grey, rankKey: 'Q1'),
          new CircularSegmentEntry(completedCount.toDouble(), Colors.lightGreen, rankKey: 'Q2'),
          new CircularSegmentEntry(onGoingCount.toDouble(), Colors.blue, rankKey: 'Q3'),
          new CircularSegmentEntry(pendingCount.toDouble(), Colors.yellow, rankKey: 'Q4'),
          new CircularSegmentEntry(problemCount.toDouble(), Colors.red, rankKey: 'Q5'),
        ],
      ),
    ];
  }
}
