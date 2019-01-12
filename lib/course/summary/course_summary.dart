import 'package:ceu_student/components/status.dart';
import 'package:ceu_student/course/score/course_score_item.dart';
import 'package:flutter/material.dart';
import 'package:badge/badge.dart';

class CourseSummary extends StatefulWidget {
  @override
  _CourseSummaryState createState() => _CourseSummaryState();
}

class _CourseSummaryState extends State<CourseSummary> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Text("Status: ", style: TextStyle(fontWeight: FontWeight.bold),),
              Padding(padding: EdgeInsets.only(right: 10),),
              Status(status: 2,),
            ],
          ),
          Padding(padding: EdgeInsets.only(bottom: 10),),
          Row(
            children: <Widget>[
              Text("SGL: ", style: TextStyle(fontWeight: FontWeight.bold)),
              Padding(padding: EdgeInsets.only(right: 10),),
              Text("20 Item(s)", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue),),
            ],
          ),
          Padding(padding: EdgeInsets.only(bottom: 10),),
          Row(
            children: <Widget>[
              Text("Portofolio: ", style: TextStyle(fontWeight: FontWeight.bold)),
              Padding(padding: EdgeInsets.only(right: 10),),
              Text("20 Item(s)", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue),),
            ],
          ),
          Padding(padding: EdgeInsets.only(bottom: 10),),
          Row(
            children: <Widget>[
              Text("Seminar: ", style: TextStyle(fontWeight: FontWeight.bold)),
              Padding(padding: EdgeInsets.only(right: 10),),
              Text("20 Item(s)", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue),),
            ],
          ),
          Padding(padding: EdgeInsets.only(bottom: 10),),
          Row(
            children: <Widget>[
              Text("Problem: ", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red),),
              Padding(padding: EdgeInsets.only(right: 10),),
              Text("-"),
            ],
          ),
        ],
      ),
    );
  }
}
