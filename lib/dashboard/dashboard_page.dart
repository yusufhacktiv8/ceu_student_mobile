import 'package:flutter/material.dart';
import '../components/header.dart';
import './course_chart.dart';
import './course_list.dart';
import './course_level_button.dart';

class DashboardPage extends StatelessWidget {

  static final List<Choice> choices = const <Choice>[
    const Choice(title: 'Change Password', icon: Icons.directions_bike),
    const Choice(title: 'Logout', icon: Icons.directions_car),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: Header(),
        body: Center(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(color: Color(0xFFF5F5F5), height: 10,),
//              Container(
//                padding: EdgeInsets.only(left: 15.0, right: 15.0, top: 15.0, bottom: 5.0),
//                child: Row(
//                  mainAxisAlignment: MainAxisAlignment.center,
//                  children: <Widget>[
//                    CourseLevelButton(level: 1, selected: true,),
//                    Padding(padding: EdgeInsets.all(10.0),),
//                    CourseLevelButton(level: 2, selected: false,),
//                  ],
//                ),
//              ),
              Expanded(
                child: ListView(children: <Widget>[
//                  CourseSummaryChart(),
                  CourseChart(),
                  Divider(),
                  CourseList(),
                ],),
              ),
            ],
          ),
        ),
        bottomNavigationBar: new BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: 1,
//          onTap: (int index) {
//            setState(() {
//              _screen = index;
//            });
//          },
          items: [
            new BottomNavigationBarItem(
              icon: new Icon(Icons.home),
              title: new Text('Home'),
            ),
            new BottomNavigationBarItem(
              icon: new Icon(Icons.collections),
              title: new Text('Scores'),
            ),
            new BottomNavigationBarItem(
              icon: new Icon(Icons.event),
              title: new Text('Schedules'),
            ),
            new BottomNavigationBarItem(
              icon: new Icon(Icons.account_circle),
              title: new Text('Profile'),
            ),
          ],
        )
    );
//        body: new Center(
//          // Center is a layout widget. It takes a single child and positions it
//          // in the middle of the parent.
//          child: new Column(
//            mainAxisAlignment: MainAxisAlignment.center,
//            children: <Widget>[
//              CourseSummaryChart(),
//              Divider(),
//              CourseList(),
//            ],
//          ),
//        ),
//      );
  }
}
