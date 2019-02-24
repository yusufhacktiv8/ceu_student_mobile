import 'dart:io';
import 'dart:async';
import 'dart:convert';
import 'package:ceu_student/models/seminar.dart';
import 'package:flutter/material.dart';
import 'package:ceu_student/components/header.dart';
import 'package:ceu_student/utils/common.dart';
import '../constant.dart';
import '../models/course.dart';
import 'package:intl/intl.dart';

class SeminarPage extends StatefulWidget {

  final String title;
  final Course course;
  final String departmentCode;
  final String userPhoto;

  SeminarPage({Key key, this.title, this.course, this.departmentCode, this.userPhoto}) : super(key: key);

  @override
  _SeminarPageState createState() => _SeminarPageState();
}

class _SeminarPageState extends State<SeminarPage> {

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
  List<Seminar> seminars = [];
  
  @override
  Widget build(BuildContext context) {

    Widget seminarWidget = Center(
      child: Text('No Data',
        style: TextStyle(fontSize: 17, color: Colors.grey),
      ),
    );

    if (seminars.length > 0) {
      seminarWidget = ListView.separated
        (
          separatorBuilder: (context, index) => Divider(
            color: Colors.grey,
          ),
          itemCount: seminars.length,
          itemBuilder: (BuildContext ctxt, int index) {
            return ListTile(
              title: Text(seminars[index].name,
                  style: TextStyle(fontSize: 16)),
              trailing: Text(seminars[index].eventDate != null ? DateFormat('dd MMM yyyy').format(seminars[index].eventDate) : 'No Date',
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
              child: Text("Seminar", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
            ),
            Container(color: Color(0xFFF5F5F5), height: 15,),
            Expanded(
              child: RefreshIndicator(
                key: _refreshIndicatorKey,
                onRefresh: findSeminars,
                child: seminarWidget,
              )
            )
          ],
        )
      ),
    );
  }

  Future<Null> findSeminars() async {
    String startDate = DateFormat('yyyy-MM-dd').format(widget.course.realStartDate);
    String endDate = DateFormat('yyyy-MM-dd').format(widget.course.realEndDate);
    String token = await getMobileToken();
    try {
      var httpClient = new HttpClient();
      var request =
      await httpClient.getUrl(Uri.parse("$URL/studentapp/courses/${widget.course.id}/seminars?startDate=$startDate&endDate=$endDate"));
      request.headers.set('Authorization', 'Bearer $token');
      request.headers.set('content-type', 'application/json');
      var response = await request.close();
      if (response.statusCode == HttpStatus.ok) {
        var json = await response.transform(utf8.decoder).join();
        List<Seminar> seminars = Seminar.fromJsonArray(json);
        setState(() {
          this.seminars = seminars;
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
