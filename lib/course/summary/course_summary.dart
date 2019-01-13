import 'package:ceu_student/components/status.dart';
import 'package:ceu_student/course/score/course_score_item.dart';
import 'package:ceu_student/course/sgl.dart';
import 'package:ceu_student/models/course.dart';
import 'package:flutter/material.dart';
import 'package:badge/badge.dart';

class CourseSummary extends StatefulWidget {

  final Course course;

  CourseSummary({Key key,
    this.course,
  }) : super(key: key);

  @override
  _CourseSummaryState createState() => _CourseSummaryState();
}

class _CourseSummaryState extends State<CourseSummary> {

  @override
  Widget build(BuildContext context) {

    var courseStatus = widget.course != null ? Status(status: widget.course.status,) : Text('-');

    return Container(
      child: Column(
        children: <Widget>[
          ListTile(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('Status', style: TextStyle(fontWeight: FontWeight.bold)),
//                Status(status: 2,),
              ],
            ),
            trailing: courseStatus,
          ),
          Divider(),
          ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Sgl(title: "Kardiologi - SGL",)),
              );
            },
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('SGL', style: TextStyle(fontWeight: FontWeight.bold)),
                Text("20", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue),),
              ],
            ),
            trailing: Icon(Icons.navigate_next),
          ),
          Divider(),
          ListTile(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('Portofolio', style: TextStyle(fontWeight: FontWeight.bold)),
                Text("20", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue),),
              ],
            ),
            trailing: Icon(Icons.navigate_next),
          ),
          Divider(),
          ListTile(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('Seminar', style: TextStyle(fontWeight: FontWeight.bold)),
                Text("20", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue),),
              ],
            ),
            trailing: Icon(Icons.navigate_next),
          ),
          Divider(),
          ListTile(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('Problem', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red)),
                Text("20", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue),),
              ],
            ),
            trailing: Icon(Icons.navigate_next),
          ),
        ],
      ),
    );
  }
}
