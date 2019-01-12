import 'package:ceu_student/components/header.dart';
import 'package:ceu_student/course/schedule/course_schedule_card.dart';
import 'package:ceu_student/course/score/course_score_card.dart';
import 'package:ceu_student/course/summary/course_summary_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_circular_chart/flutter_circular_chart.dart';
import 'package:ceu_student/course/score/course_score.dart';
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

class _CoursePageState extends State<CoursePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: Header(label: widget.title, onSelect: (title) {
//          logout(title);
        },
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios, color: Colors.blueAccent, size: 25),
            onPressed: () {
              Navigator.pop(context);
            }
          ),
        ),
      body: Container(
        color: Color(0xFFF5F5F5),
        padding: EdgeInsets.all(15),
        child: ListView(
          children: <Widget>[
            CourseSummaryCard(),
            Padding(padding: EdgeInsets.only(bottom: 15)),
            CourseScoreCard(),
            Padding(padding: EdgeInsets.only(bottom: 15)),
            CourseScheduleCard(),
          ],
        ),
      ),
    );
  }
}