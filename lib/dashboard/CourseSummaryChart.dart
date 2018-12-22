import 'package:flutter/material.dart';
import 'package:flutter_circular_chart/flutter_circular_chart.dart';

class  CourseSummaryChart extends StatefulWidget {
  @override
  _CourseSummaryChartState createState() => _CourseSummaryChartState();
}

const List<String> tabNames = const<String>[
  'foo', 'bar', 'baz', 'quox', 'quuz', 'corge', 'grault', 'garply', 'waldo'
];

final GlobalKey<AnimatedCircularChartState> _chartKey = new GlobalKey<AnimatedCircularChartState>();

class _CourseSummaryChartState extends State<CourseSummaryChart> {
  @override
  Widget build(BuildContext context) {
    List<CircularStackEntry> data = <CircularStackEntry>[
      new CircularStackEntry(
        <CircularSegmentEntry>[
          new CircularSegmentEntry(500.0, Colors.red[200], rankKey: 'Q1'),
          new CircularSegmentEntry(1000.0, Colors.green[200], rankKey: 'Q2'),
          new CircularSegmentEntry(2000.0, Colors.blue[200], rankKey: 'Q3'),
          new CircularSegmentEntry(1000.0, Colors.yellow[200], rankKey: 'Q4'),
        ],
        rankKey: 'Quarterly Profits',
      ),
    ];
    return Container(
      child: AnimatedCircularChart(
        key: _chartKey,
        size: const Size(300.0, 300.0),
        initialChartData: data,
        chartType: CircularChartType.Radial,
        holeRadius: 50.0,
        holeLabel: "123",
        labelStyle: TextStyle(fontSize: 25.0, color: Colors.black),
      ),
    );
  }
}
