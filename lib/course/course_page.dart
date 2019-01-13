import 'package:ceu_student/components/header.dart';
import 'package:ceu_student/course/schedule/course_schedule_card.dart';
import 'package:ceu_student/course/score/course_score_card.dart';
import 'package:ceu_student/course/summary/course_summary_card.dart';
import 'package:ceu_student/models/course.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../constant.dart';
import 'package:flutter_circular_chart/flutter_circular_chart.dart';
import 'package:ceu_student/course/score/course_score.dart';
import './sgl.dart';
import './schedules.dart';
import './scores.dart';
import './portofolios.dart';
import './seminars.dart';
import './problems.dart';

class CoursePage extends StatefulWidget {
  CoursePage({Key key,
    this.course,
  }) : super(key: key);

  final Course course;

  @override
  _CoursePageState createState() => new _CoursePageState();
}

class _CoursePageState extends State<CoursePage> {

  Course _course;
  final GlobalKey<ScaffoldState> mScaffoldState = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: Header(label: widget.course.title, onSelect: (title) {
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

//  Future<Null> findCourseById(double courseId) async {
//    String token = await _getMobileToken();
//    try {
//      var httpClient = new HttpClient();
//      var request =
//      await httpClient.getUrl(Uri.parse("$URL/studentapp/courses?level=${selectedChoice.id}"));
//      request.headers.set('Authorization', 'Bearer $token');
//      request.headers.set('content-type', 'application/json');
//      var response = await request.close();
//      if (response.statusCode == HttpStatus.ok) {
//        var json = await response.transform(utf8.decoder).join();
//        Course course = Course.fromJson(json);
//        setState(() {
//          this._course = course;
//        });
//      } else if (response.statusCode == HttpStatus.forbidden){
//        _showLoginError('Session Expired');
//      } else {
//        _showError('Error finding courses (${response.statusCode})');
//      }
//    } catch (exception) {
//      _showError('Error finding courses');
//    }
//    return null;
//  }
}