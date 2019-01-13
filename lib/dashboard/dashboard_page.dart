import 'package:ceu_student/events/events.dart';
import 'package:ceu_student/profile/profile_page.dart';
import 'package:ceu_student/utils/common.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:async';
import 'dart:convert';
import '../components/header.dart';
import './course_chart.dart';
import './course_list.dart';
import '../constant.dart';
import '../models/course.dart';

class DashboardPage extends StatefulWidget {

  @override
  _DashboardPageState createState() => new _DashboardPageState();

}

class _DashboardPageState extends State<DashboardPage> {

//  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey = GlobalKey<RefreshIndicatorState>();
  final GlobalKey<ScaffoldState> mScaffoldState = new GlobalKey<ScaffoldState>();

  static final List<Choice> choices = const <Choice>[
    const Choice(title: 'Tingkat 1', id: 1),
    const Choice(title: 'Tingkat 2', id: 2),
  ];

  List<Course> courses = [];
  Choice selectedChoice = choices[0];

  @override
  void initState() {
    super.initState();
//    findCourses();
    Future.delayed(const Duration(milliseconds: 500), () {
      _refreshIndicatorKey.currentState?.show();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: mScaffoldState,
        appBar: Header(label: 'Dashboard', onSelect: (choice) {
          onSelectChoice(choice);
        },
//          leading: Icon(Icons.chat, color: Colors.blueAccent, size: 30,),
        ),
        body: Center(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(color: Color(0xFFF5F5F5), height: 15,),
              Expanded(
                child: RefreshIndicator(
                  key: _refreshIndicatorKey,
                  onRefresh: findCourses,
                  child: ListView(
                    children: <Widget>[
//                  CourseSummaryChart(),
                  Container(
                    padding: EdgeInsets.only(left: 15, top: 10, right: 15),
                    color: Colors.white,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text("Chart", style: TextStyle(fontSize: 17.0, fontWeight: FontWeight.bold, color: Colors.black87),),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                            PopupMenuButton<Choice>(
                              onSelected: (choice) {
                                setState(() {
                                  this.selectedChoice = choice;
                                });
                                _refreshIndicatorKey.currentState?.show();
                              },
                              child: Container(
                                margin: EdgeInsets.only(right: 8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Text("${selectedChoice.title}", style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 16)),
                                    Icon(Icons.arrow_drop_down, color: Colors.black54)
                                  ],
                                ),
                              ),
                              itemBuilder: (BuildContext context) {
                                return choices.map((Choice choice) {
                                  return PopupMenuItem<Choice>(
                                    value: choice,
                                    child: Text(choice.title, style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),),
                                  );
                                }).toList();
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                    CourseChart(courses: courses,),
                    Container(color: Color(0xFFF5F5F5), height: 15,),
                    Container(
                      padding: EdgeInsets.only(left: 15, top: 10),
                      color: Colors.white,
                      child: Text("Courses", style: TextStyle(fontSize: 17.0, fontWeight: FontWeight.bold, color: Colors.black87),),
                    ),
                    CourseList(courses: courses),
                  ],),
                ),
              ),
            ],
          ),
        ),
//        bottomNavigationBar: new BottomNavigationBar(
//          type: BottomNavigationBarType.fixed,
//          currentIndex: 1,
////          onTap: (int index) {
////            setState(() {
////              _screen = index;
////            });
////          },
//          items: [
//            new BottomNavigationBarItem(
//              icon: new Icon(Icons.home),
//              title: new Text('Home'),
//            ),
//            new BottomNavigationBarItem(
//              icon: new Icon(Icons.collections),
//              title: new Text('Scores'),
//            ),
////            new BottomNavigationBarItem(
////              icon: new Icon(Icons.event),
////              title: new Text('Schedules'),
////            ),
//            new BottomNavigationBarItem(
//              icon: new Icon(Icons.account_circle),
//              title: new Text('Profile'),
//            ),
//          ],
//        )
    );
  }

  onSelectChoice(choice) {
    switch (choice.title) {
      case 'Profile':
        setMobileToken('');
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ProfilePage()),
        );
        break;
      default:
        logout(context);
    }

  }

  Future<Null> findCourses() async {
    String token = await getMobileToken();
    try {
      var httpClient = new HttpClient();
      var request =
      await httpClient.getUrl(Uri.parse("$URL/studentapp/courses?level=${selectedChoice.id}"));
      request.headers.set('Authorization', 'Bearer $token');
      request.headers.set('content-type', 'application/json');
      var response = await request.close();
      if (response.statusCode == HttpStatus.ok) {
        var json = await response.transform(utf8.decoder).join();
        List<Course> courses = Course.fromJsonArray(json);
        setState(() {
          this.courses = courses;
        });
        eventBus.fire(CoursesChangedEvent(courses));
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
