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
              Text("Title"),
              Text("Kardiologi"),
            ],
          ),
          Padding(padding: EdgeInsets.all(5),),
          Row(
            children: <Widget>[
              Text("1. Pre Test (SCB)"),
              Text("42.0"),
              Badge.before(
                value: "0.00 %",
                positionTop: 5,
                child: Text("")
              )
            ],
          ),
          Padding(padding: EdgeInsets.all(5),),
          Row(
            children: <Widget>[
              Text("2. Case Report"),
              Text("42.0"),
              Badge.before(
                  value: "0.00 %",
                  positionTop: 5,
                  child: Text("")
              )
            ],
          )
        ],
      ),
    );
  }
}
