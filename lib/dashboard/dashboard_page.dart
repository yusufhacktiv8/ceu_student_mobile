import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../components/header.dart';
import './course_chart.dart';
import './course_list.dart';
import '../security/login_page.dart';
import '../constant.dart';

class DashboardPage extends StatefulWidget {

  @override
  _DashboardPageState createState() => new _DashboardPageState();

}

class _DashboardPageState extends State<DashboardPage> {

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  static final List<Choice> choices = const <Choice>[
    const Choice(title: 'Tingkat 1', icon: Icons.directions_bike),
    const Choice(title: 'Tingkat 2', icon: Icons.directions_car),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: Header(onSelect: (title) {
          logout(title);
        },),
        body: Center(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(color: Color(0xFFF5F5F5), height: 15,),
              Expanded(
                child: ListView(children: <Widget>[
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
                            //                onSelected: _select,
                            child: Container(
                              margin: EdgeInsets.only(right: 8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Text("Tingkat 1", style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 16)),
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
                  CourseChart(),
//                  Container(
//                    color: Colors.white,
//                    child: Row(
//                      mainAxisAlignment: MainAxisAlignment.center,
//                      children: <Widget>[
//                        CourseLevelButton(),
//                      ],
//                    ),
//                  ),
                  Container(color: Color(0xFFF5F5F5), height: 15,),
                  Container(
                    padding: EdgeInsets.only(left: 15, top: 10),
                    color: Colors.white,
                    child: Text("Courses", style: TextStyle(fontSize: 17.0, fontWeight: FontWeight.bold, color: Colors.black87),),
                  ),
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

  logout(title) {
    _setMobileToken('');
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => LoginPage()),
    );
  }

  Future<bool> _setMobileToken(String token) async {
    final SharedPreferences prefs = await _prefs;

    return prefs.setString(MOBILE_TOKEN_KEY, token);
  }
}
