import 'dart:io';
import 'dart:async';
import 'dart:convert';
import 'package:ceu_student/models/student.dart';
import 'package:ceu_student/profile/change_password.dart';
import 'package:flutter/material.dart';
import 'package:ceu_student/utils/common.dart';
import '../constant.dart';
import 'package:ceu_student/profile/details.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ProfilePageState createState() => new _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

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

    var _sid = '';
    if (_student.oldSid != null && _student.newSid != null) {
      _sid = '${_student.oldSid} - ${_student.newSid}';
    } else if (_student.oldSid != null) {
      _sid = _student.oldSid;
    }  else if (_student.newSid != null) {
      _sid = _student.newSid;
    }
    
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
        child: RefreshIndicator(
          key: _refreshIndicatorKeyProfilePage,
          onRefresh: loadProfile,
          child: ListView(
            children: <Widget>[
              Container(color: Color(0xFFF5F5F5), height: 15,),
              Container(
                height: 120,
                padding: EdgeInsets.all(10),
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
                  child: Text(_student.name != null ? _student.name : '-')
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
                  child: Text(_sid)
              ),
              Container(color: Color(0xFFF5F5F5), height: 35,),
              Container(
                child: ListTile(
                  title: Text('Details', style: TextStyle(color: Colors.blue),),
                  trailing: Icon(Icons.navigate_next),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Details(title: "Details",)),
                    );
                  },
                ),
              ),
              Container(color: Color(0xFFF5F5F5), height: 35,),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ChangePassword()),
                  );
                },
                child: Container(color: Colors.white, height: 45,
                  alignment: Alignment.center,
//                padding: EdgeInsets.all(15),
                  child: Text('Change Password', style: TextStyle(color: Colors.red),),
                ),
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