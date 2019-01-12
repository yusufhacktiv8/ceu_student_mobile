import 'package:ceu_student/components/header.dart';
import 'package:ceu_student/course/schedule/course_schedule_card.dart';
import 'package:ceu_student/course/score/course_score_card.dart';
import 'package:ceu_student/course/summary/course_summary_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_circular_chart/flutter_circular_chart.dart';

final GlobalKey<AnimatedCircularChartState> _chartKey = new GlobalKey<AnimatedCircularChartState>();

class ProfilePage extends StatefulWidget {
  ProfilePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ProfilePageState createState() => new _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          centerTitle: true,
          title: Text('Profile', style: TextStyle(color: Colors.black)),
          leading: IconButton(
              icon: Icon(Icons.arrow_back_ios, color: Colors.blueAccent, size: 25),
              onPressed: () {
                Navigator.pop(context);
              }
          )
        ),
      body: Container(
//        color: Color(0xFFF5F5F5),
        color: Colors.white,
//        padding: EdgeInsets.all(15),
        child: ListView(
          children: <Widget>[
            Container(color: Color(0xFFF5F5F5), height: 15,),
            Container(
              height: 130,
              padding: EdgeInsets.all(15),
              child: Center(
                child: Icon(Icons.account_circle, color: Colors.black12, size: 100,)
              ),
            ),
            Container(color: Color(0xFFF5F5F5), height: 35,),
            Container(color: Color(0xFFF5F5F5), height: 25,
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(left: 15, bottom: 10),
              child: Text('NAME')
            ),
            Container(color: Colors.white, height: 40,
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.all(15),
                child: Text('Yusuf')
            ),
            Container(color: Color(0xFFF5F5F5), height: 35,),
            Container(color: Color(0xFFF5F5F5), height: 25,
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(left: 15, bottom: 10),
                child: Text('STAMBUK')
            ),
            Container(color: Colors.white, height: 40,
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.all(15),
                child: Text('110 2014 0118 - 111 2017 2120')
            ),
            Container(color: Color(0xFFF5F5F5), height: 45,),
            Container(color: Colors.white, height: 45,
                alignment: Alignment.center,
//                padding: EdgeInsets.all(15),
                child: Text('Change Password', style: TextStyle(color: Colors.red),)
            ),
            Divider(),
            Container(color: Colors.white, height: 45,
                alignment: Alignment.center,
//                padding: EdgeInsets.all(15),
                child: Text('Logout', style: TextStyle(color: Colors.blue),)
            ),
            Container(color: Color(0xFFF5F5F5), height: 45,),
          ],
        ),
      ),
    );
  }
}