import 'dart:io';
import 'dart:async';
import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:ceu_student/models/student.dart';
import 'package:flutter/material.dart';
import 'package:ceu_student/utils/common.dart';
import '../constant.dart';

class Details extends StatefulWidget {

  final String title;

  Details({Key key, this.title}) : super(key: key);

  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {

  Student _student = new Student();

  final GlobalKey<ScaffoldState> mScaffoldState = new GlobalKey<ScaffoldState>();
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKeyProfilePage = GlobalKey<RefreshIndicatorState>();

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 500), () {
      _refreshIndicatorKeyProfilePage.currentState?.show();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          centerTitle: true,
          title: Text('Details', style: TextStyle(color: Colors.black)),
          leading: IconButton(
              icon: Icon(Icons.arrow_back_ios, color: Colors.blueAccent, size: 25),
              onPressed: () {
                Navigator.pop(context);
              }
          )
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          children: <Widget>[
            Container(color: Color(0xFFF5F5F5), height: 15,),
            Expanded(
              child: RefreshIndicator(
                key: _refreshIndicatorKeyProfilePage,
                onRefresh: loadProfile,
                child: ListView(
                  children: <Widget>[
                    ListTile(
                      leading: Icon(Icons.calendar_today),
                      title: Text(_student.birthDate != null ? DateFormat('dd MMM yyyy').format(_student.birthDate) : '-',
                          style: TextStyle(fontSize: 16)),
                    ),
                    Divider(),
                    ListTile(
                      leading: Icon(Icons.mobile_screen_share),
                      title: Text(_student.mobilePhone != null ? _student.mobilePhone : '-',
                          style: TextStyle(fontSize: 16)),
                    ),
                    Divider(),
                    ListTile(
                      leading: Icon(Icons.phone),
                      title: Text("012345678",
                          style: TextStyle(fontSize: 16)),
                    ),
                    Divider(),
                    ListTile(
                      leading: Icon(Icons.email),
                      title: Text("testhello99@gmail.com",
                          style: TextStyle(fontSize: 16)),
                    ),
                    Divider(),
                    ListTile(
                      leading: Icon(Icons.home),
                      title: Text("Jl. A.P.Pettarani",
                          style: TextStyle(fontSize: 16)),
                    ),
                    Divider(),
                  ],
                ),
              ),
            )
          ],
        )
      ),
    );
  }

  Future<Null> loadProfile() async {
    String token = await getMobileToken();
    try {
      var httpClient = new HttpClient();
      var request =
      await httpClient.getUrl(Uri.parse("$URL/studentapp/profile"));
      request.headers.set('Authorization', 'Bearer $token');
      request.headers.set('content-type', 'application/json');
      var response = await request.close();
      if (response.statusCode == HttpStatus.ok) {
        var json = await response.transform(utf8.decoder).join();
        Student student = Student.fromJson(json);
        setState(() {
          this._student = student;
        });
      } else if (response.statusCode == HttpStatus.forbidden){
        showLoginError(mScaffoldState, context, 'Session Expired');
      } else {
        showError(mScaffoldState, 'Error finding students (${response.statusCode})');
      }
    } catch (exception) {
      showError(mScaffoldState, 'Error finding students');
    }
    return null;
  }
}
