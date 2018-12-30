import 'package:flutter/material.dart';
import './course_summary_chart.dart';
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
        appBar: new AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          centerTitle: false,
          elevation: 2.0,
          backgroundColor: Colors.white,
          title: Text('Dashboard',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                  fontSize: 26.0)),
            actions: <Widget>[
              PopupMenuButton<Choice>(
//                onSelected: _select,
                child: Container(
                  margin: EdgeInsets.only(right: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                    Text("Yusuf",
                          style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.w700,
                              fontSize: 14.0)),
//                      FutureBuilder (
//                          future: _getUserName(),
//                          builder: (BuildContext context, AsyncSnapshot snapshot) {
//                            if (snapshot.hasData) {
//                              return Text(snapshot.data,
//                                  style: TextStyle(
//                                      color: Colors.blue,
//                                      fontWeight: FontWeight.w700,
//                                      fontSize: 14.0));
//                            } else {
//                              return Text('-',
//                                  style: TextStyle(
//                                      color: Colors.blue,
//                                      fontWeight: FontWeight.w700,
//                                      fontSize: 14.0));
//                            }
//                          }
//                      ),
                      Icon(Icons.arrow_drop_down, color: Colors.black54)
                    ],
                  ),
                ),
                itemBuilder: (BuildContext context) {
                  return choices.map((Choice choice) {
                    return PopupMenuItem<Choice>(
                      value: choice,
                      child: Text(choice.title),
                    );
                  }).toList();
                },
              ),
            ]
        ),
        body: Center(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(left: 15.0, right: 15.0, top: 15.0, bottom: 5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CourseLevelButton(level: 1, selected: true,),
                    Padding(padding: EdgeInsets.all(10.0),),
                    CourseLevelButton(level: 2, selected: false,),
                  ],
                ),
              ),
              Expanded(
                child: ListView(children: <Widget>[
                  CourseSummaryChart(),
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

class Choice {
  const Choice({this.title, this.icon});

  final String title;
  final IconData icon;
}
