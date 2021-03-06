import 'dart:io';
import 'dart:async';
import 'dart:convert';
import 'package:ceu_student/models/problem.dart';
import 'package:flutter/material.dart';
import 'package:ceu_student/components/header.dart';
import 'package:ceu_student/utils/common.dart';
import '../constant.dart';
import '../models/course.dart';
import 'package:intl/intl.dart';

class ProblemPage extends StatefulWidget {

  final String title;
  final Course course;
  final String departmentCode;
  final String userPhoto;

  ProblemPage({Key key, this.title, this.course, this.departmentCode, this.userPhoto}) : super(key: key);

  @override
  _ProblemPageState createState() => _ProblemPageState();
}

class _ProblemPageState extends State<ProblemPage> {

  @override
  void initState() {
    super.initState();
//    findCourses();
    Future.delayed(const Duration(milliseconds: 500), () {
      _refreshIndicatorKey.currentState?.show();
    });
  }

  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey = GlobalKey<RefreshIndicatorState>();
  final GlobalKey<ScaffoldState> mScaffoldState = new GlobalKey<ScaffoldState>();
  List<Problem> problems = [];
  
  @override
  Widget build(BuildContext context) {

    Widget problemWidget = Center(
      child: Text('No Data',
        style: TextStyle(fontSize: 17, color: Colors.grey),
      ),
    );

    if (problems.length > 0) {
      problemWidget = ListView.separated
        (
          separatorBuilder: (context, index) => Divider(
            color: Colors.grey,
          ),
          itemCount: problems.length,
          itemBuilder: (BuildContext ctxt, int index) {
            return ListTile(
              leading: Icon(problems[index].completed ? Icons.check_box : Icons.check_box_outline_blank, color: Colors.blue, size: 35,),
              title: Text(problems[index].title,
                  style: TextStyle(fontSize: 16)),
              trailing: Text(problems[index].problemDate != null ? DateFormat('dd MMM yyyy').format(problems[index].problemDate) : 'No Date',
                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),),
            );
          }
      );
    }
    return Scaffold(
      appBar: Header(label: widget.title, userPhoto: widget.userPhoto, onSelect: (choice) {
          onSelectChoice(choice);
      },
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios, color: Colors.blueAccent, size: 25),
            onPressed: () {
              Navigator.pop(context);
            }
        ),
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          children: <Widget>[
            Container(
              height: 35,
              child: Text("Problem", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
            ),
            Container(color: Color(0xFFF5F5F5), height: 15,),
            Expanded(
              child: RefreshIndicator(
                key: _refreshIndicatorKey,
                onRefresh: findProblems,
                child: problemWidget,
              )
            )
          ],
        )
      ),
    );
  }

  Future<Null> findProblems() async {
    String token = await getMobileToken();
    try {
      var httpClient = new HttpClient();
      var request =
      await httpClient.getUrl(Uri.parse("$URL/studentapp/courses/${widget.course.id}/problems?department=${widget.course.department.code}"));
      request.headers.set('Authorization', 'Bearer $token');
      request.headers.set('content-type', 'application/json');
      var response = await request.close();
      if (response.statusCode == HttpStatus.ok) {
        var json = await response.transform(utf8.decoder).join();
        List<Problem> problems = Problem.fromJsonArray(json);
        setState(() {
          this.problems = problems;
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

  onSelectChoice(choice) {
    switch (choice.title) {
      case 'Profile':
        profile(context, widget.userPhoto);
        break;
      default:
        logout(context);
    }
  }
}
