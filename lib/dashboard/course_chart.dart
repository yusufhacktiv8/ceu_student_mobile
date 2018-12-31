import 'package:flutter/material.dart';
import 'package:flutter_circular_chart/flutter_circular_chart.dart';
import './course_summary_chart_legend.dart';

class  CourseChart extends StatefulWidget {
  @override
  _CourseChartState createState() => _CourseChartState();
}

const List<String> tabNames = const<String>[
  'foo', 'bar', 'baz', 'quox', 'quuz', 'corge', 'grault', 'garply', 'waldo'
];

final GlobalKey<AnimatedCircularChartState> _chartKey = new GlobalKey<AnimatedCircularChartState>();

class _CourseChartState extends State<CourseChart> {
  @override
  Widget build(BuildContext context) {
    List<CircularStackEntry> data = <CircularStackEntry>[
      new CircularStackEntry(
        <CircularSegmentEntry>[
          new CircularSegmentEntry(500.0, Colors.grey, rankKey: 'Q1'),
          new CircularSegmentEntry(1000.0, Colors.lightGreen, rankKey: 'Q2'),
          new CircularSegmentEntry(1000.0, Colors.blue, rankKey: 'Q3'),
          new CircularSegmentEntry(1000.0, Colors.yellow, rankKey: 'Q4'),
          new CircularSegmentEntry(1000.0, Colors.red, rankKey: 'Q5'),
        ],
        rankKey: 'Quarterly Profits',
      ),
    ];
    return Container(
      height: 190.0,
      color: Colors.white,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          AnimatedCircularChart(
            key: _chartKey,
            edgeStyle: SegmentEdgeStyle.round,
            size: const Size(190.0, 190.0),
            initialChartData: data,
            chartType: CircularChartType.Radial,
            holeRadius: 39.0,
            holeLabel: "7",
            labelStyle: TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold, color: Colors.black),
            duration: Duration(seconds: 1),
          ),
          CourseSummaryChartLegend(),
        ],
      ),
    );
  }
}
