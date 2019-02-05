import 'package:ceu_student/components/status.dart';
import 'package:ceu_student/course/sgl_page.dart';
import 'package:ceu_student/course/portofolio_page.dart';
import 'package:ceu_student/course/seminar_page.dart';
import 'package:ceu_student/course/problem_page.dart';
import 'package:ceu_student/models/course.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CourseSummary extends StatelessWidget {
  final fn = new NumberFormat("#,###");

  final Course course;

  CourseSummary({Key key,
    this.course,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Widget courseStatus = Text('-');
    String sglCount = '-';
    String portofolioCount = '-';
    String seminarCount = '-';
    String problemCount = '-';
    var title = '';
    if (course != null) {
      courseStatus = Status(status: course.status);
      title = course.title;
      sglCount = course.sglCount != null ? fn.format(course.sglCount) : '-';
      portofolioCount = course.portofolioCount != null ? fn.format(course.portofolioCount) : '-';
      seminarCount = course.seminarCount != null ? fn.format(course.seminarCount) : '-';
      problemCount = course.problemCount != null ? fn.format(course.problemCount) : '-';
    }

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
                MaterialPageRoute(builder: (context) => SglPage(course: course, title: title,)),
              );
            },
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('SGL', style: TextStyle(fontWeight: FontWeight.bold)),
                Text(sglCount, style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue),),
              ],
            ),
            trailing: Icon(Icons.navigate_next),
          ),
          Divider(),
          ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PortofolioPage(course: course, title: title,)),
              );
            },
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('Portofolio', style: TextStyle(fontWeight: FontWeight.bold)),
                Text(portofolioCount, style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue),),
              ],
            ),
            trailing: Icon(Icons.navigate_next),
          ),
          Divider(),
          ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SeminarPage(course: course, title: title,)),
              );
            },
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('Seminar', style: TextStyle(fontWeight: FontWeight.bold)),
                Text(seminarCount, style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue),),
              ],
            ),
            trailing: Icon(Icons.navigate_next),
          ),
          Divider(),
          ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProblemPage(course: course, title: title,)),
              );
            },
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('Problem', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red)),
                Text(problemCount, style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue),),
              ],
            ),
            trailing: Icon(Icons.navigate_next),
          ),
        ],
      ),
    );
  }
}
