import 'package:ceu_student/components/header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_circular_chart/flutter_circular_chart.dart';
import './course_summary.dart';
import './sgl.dart';
import './schedules.dart';
import './scores.dart';
import './portofolios.dart';
import './seminars.dart';
import './problems.dart';

final GlobalKey<AnimatedCircularChartState> _chartKey = new GlobalKey<AnimatedCircularChartState>();

class CoursePage extends StatefulWidget {
  CoursePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _CoursePageState createState() => new _CoursePageState();
}

const List<String> tabNames = const<String>[
  'SGL', 'Schedules', 'Scores', 'Portofolios', 'Seminars', 'Problems'
];

class _CoursePageState extends State<CoursePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: Header(label: widget.title, onSelect: (title) {
//          logout(title);
        },),
      body: Container(
        color: Color(0xFFF5F5F5),
        padding: EdgeInsets.all(15),
        child: Column(
          children: <Widget>[
            Container(
              height: 200,
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.grey, width: 0.3),
                  borderRadius: BorderRadius.all(Radius.circular(5))
              ),
              child: Column(
                children: <Widget>[
                  Container(
                    height: 50,
                    decoration: BoxDecoration(
                      border: Border(bottom: BorderSide(color: Colors.grey, width: 0.3))
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}