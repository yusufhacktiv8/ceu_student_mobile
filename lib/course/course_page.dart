import 'dart:io';
import 'dart:async';
import 'dart:convert';
import 'package:ceu_student/components/header.dart';
import 'package:ceu_student/course/schedule/course_schedule_card.dart';
import 'package:ceu_student/course/score/course_score_card.dart';
import 'package:ceu_student/course/summary/course_summary_card.dart';
import 'package:ceu_student/models/course.dart';
import 'package:ceu_student/utils/common.dart';
import 'package:flutter/material.dart';
import '../constant.dart';

class CoursePage extends StatefulWidget {
  CoursePage({Key key,
    this.course,
  }) : super(key: key);

  final Course course;

  @override
  _CoursePageState createState() => new _CoursePageState();
}

class _CoursePageState extends State<CoursePage> {

  Course _course = new Course();
  final GlobalKey<ScaffoldState> mScaffoldState = new GlobalKey<ScaffoldState>();
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKeyCoursePage = GlobalKey<RefreshIndicatorState>();

  @override
  void initState() {
    super.initState();
//    findCourses();
    Future.delayed(const Duration(milliseconds: 500), () {
      _refreshIndicatorKeyCoursePage.currentState?.show();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: mScaffoldState,
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
        child: RefreshIndicator(
          key: _refreshIndicatorKeyCoursePage,
          onRefresh: findCourse,
          child: ListView(
            children: <Widget>[
              CourseSummaryCard(course: _course),
              Padding(padding: EdgeInsets.only(bottom: 15)),
              CourseScoreCard(course: _course),
              Padding(padding: EdgeInsets.only(bottom: 15)),
              CourseScheduleCard(),
            ],
          ),
        ),
      ),
    );
  }

  Future<Null> findCourse() async {
    String token = await getMobileToken();
    try {
      var httpClient = new HttpClient();
      var request =
      await httpClient.getUrl(Uri.parse("$URL/studentapp/courses/${widget.course.id}"));
      request.headers.set('Authorization', 'Bearer $token');
      request.headers.set('content-type', 'application/json');
      var response = await request.close();
      if (response.statusCode == HttpStatus.ok) {
        var json = await response.transform(utf8.decoder).join();
        Course course = Course.fromJson(json);
        setState(() {
          this._course = course;
        });
      } else if (response.statusCode == HttpStatus.forbidden){
        showLoginError(mScaffoldState, context, 'Session Expired');
      } else {
        showError(mScaffoldState, 'Error finding courses (${response.statusCode})');
      }
    } catch (exception) {
      showError(mScaffoldState, 'Error finding courses');
    }
    return null;
  }
}