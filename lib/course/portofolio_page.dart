import 'dart:io';
import 'dart:async';
import 'dart:convert';
import 'package:ceu_student/models/portofolio.dart';
import 'package:flutter/material.dart';
import 'package:ceu_student/components/header.dart';
import 'package:ceu_student/utils/common.dart';
import '../constant.dart';
import '../models/course.dart';
import 'package:intl/intl.dart';

class PortofolioPage extends StatefulWidget {

  final String title;
  final Course course;
  final String departmentCode;

  PortofolioPage({Key key, this.title, this.course, this.departmentCode}) : super(key: key);

  @override
  _PortofolioPageState createState() => _PortofolioPageState();
}

class _PortofolioPageState extends State<PortofolioPage> {

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
  List<Portofolio> portofolios = [];
  
  @override
  Widget build(BuildContext context) {

    Widget portofolioWidget = Center(
      child: Text('No Data',
        style: TextStyle(fontSize: 17, color: Colors.grey),
      ),
    );

    if (portofolios.length > 0) {
      portofolioWidget = ListView.separated
        (
          separatorBuilder: (context, index) => Divider(
            color: Colors.grey,
          ),
          itemCount: portofolios.length,
          itemBuilder: (BuildContext ctxt, int index) {
            return ListTile(
              leading: Icon(portofolios[index].completed ? Icons.check_box : Icons.check_box_outline_blank, color: Colors.blue, size: 35,),
              title: Text(portofolios[index].name,
                  style: TextStyle(fontSize: 16)),
              trailing: Text(portofolios[index].portofolioDate != null ? DateFormat('dd MMM yyyy').format(portofolios[index].portofolioDate) : 'No Date',
                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),),
            );
          }
      );
    }
    return Scaffold(
      appBar: Header(label: widget.title, onSelect: (choice) {
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
              child: Text("Portofolio", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
            ),
            Container(color: Color(0xFFF5F5F5), height: 15,),
            Expanded(
              child: RefreshIndicator(
                key: _refreshIndicatorKey,
                onRefresh: findPortofolios,
                child: portofolioWidget,
              )
            )
          ],
        )
      ),
    );
  }

  Future<Null> findPortofolios() async {
    String token = await getMobileToken();
    try {
      var httpClient = new HttpClient();
      var request =
      await httpClient.getUrl(Uri.parse("$URL/studentapp/courses/${widget.course.id}/portofolios?department=${widget.course.department.code}"));
      request.headers.set('Authorization', 'Bearer $token');
      request.headers.set('content-type', 'application/json');
      var response = await request.close();
      if (response.statusCode == HttpStatus.ok) {
        var json = await response.transform(utf8.decoder).join();
        List<Portofolio> portofolios = Portofolio.fromJsonArray(json);
        setState(() {
          this.portofolios = portofolios;
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
        profile(context);
        break;
      default:
        logout(context);
    }
  }
}
