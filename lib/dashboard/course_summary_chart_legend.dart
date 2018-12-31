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
            ChartLegend(count: 5, description: "Scheduled", color: Colors.grey,),
            Padding(padding: EdgeInsets.all(3),),
            ChartLegend(count: 0, description: "On Going", color: Colors.blue,),
            Padding(padding: EdgeInsets.all(3),),
            ChartLegend(count: 2, description: "Completed", color: Colors.green,),
            Padding(padding: EdgeInsets.all(3),),
            ChartLegend(count: 0, description: "Problem", color: Colors.red,),
            Padding(padding: EdgeInsets.all(3),),
            ChartLegend(count: 0, description: "Pending", color: Colors.black87,),
            Padding(padding: EdgeInsets.all(3),),
          ],
        ));
  }
}
