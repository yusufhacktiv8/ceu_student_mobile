import 'package:ceu_student/utils/hex_color.dart';
import 'package:flutter/material.dart';
import 'package:badge/badge.dart';
import './../score/score_page.dart';
import '../models/course.dart';

class CourseList extends StatelessWidget {

  final List<Course> courses;

  CourseList({Key key,
    @required this.courses,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: this.courses.map((course) {
          return Column(
            children: <Widget>[
              ListTile(
                onTap: () {
                  Navigator.push(
                    context,
//                  MaterialPageRoute(builder: (context) => CoursePage(title: "Kardiologi",)),
                    MaterialPageRoute(builder: (context) => ScorePage()),
                  );
                },
                title: Text(
                  course.title,
                  style: TextStyle(
                      fontSize: 17.0,
                      fontWeight: FontWeight.bold,
                    color: Colors.black87
                  ),
                ),
//                subtitle: Text("Prerequisite for level 1"),
                leading: Badge.before(
                  color: HexColor(course.department.color),
                  textStyle: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                  value: "  ${course.department.code}  ",
                  positionTop: 5,
                  child: Text(""),
                ),
                trailing: Badge.before(
                  textStyle: TextStyle(fontSize: 2.0),
                  spacing: 5,
                  color: Colors.green,
                  value: " ",
                  child: Text("Completed", style: TextStyle(fontSize: 16, color: Colors.black87),),
                ),
              ),
              Divider(),
            ],
          );
        }).toList(),
      ),
    );
  }
}
