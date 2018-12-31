import 'package:flutter/material.dart';
import 'package:badge/badge.dart';
import '../components/chart_legend.dart';

class CourseSummaryChartLegend extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 200.0,
        width: 120.0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ChartLegend(count: 5, description: "Scheduled",),
//            new Badge.before(
//              color: Colors.grey,
//              textStyle: TextStyle(fontSize: 17.0, color: Colors.white),
//              spacing: 5.0,
//              value: " ",
//              child: new Text("Scheduled", style: TextStyle(fontSize: 16.0))
//            ),
            new Badge.before(
              color: Colors.blueAccent,
              textStyle: TextStyle(fontSize: 17.0, color: Colors.white),
              spacing: 5.0,
              value: " 0 ",
              child: new Text("On Going  ", style: TextStyle(fontSize: 16.0))
            ),
            new Badge.before(
              color: Colors.green,
              textStyle: TextStyle(fontSize: 17.0, color: Colors.white),
              spacing: 5.0,
              value: " 2 ",
              child: new Text("Completed", style: TextStyle(fontSize: 16.0))
            ),
            new Badge.before(
              textStyle: TextStyle(fontSize: 17.0, color: Colors.white),
              spacing: 5.0,
              value: " 0 ",
              child: new Text("Problem", style: TextStyle(fontSize: 16.0))
            ),
            new Badge.before(
              color: Colors.black87,
              textStyle: TextStyle(fontSize: 17.0, color: Colors.white),
              spacing: 5.0,
              value: " 0 ",
              child: new Text("Pending", style: TextStyle(fontSize: 16.0))
            ),
          ],
        ));
  }
}
