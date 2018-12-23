import 'package:flutter/material.dart';

class CourseLevelButton extends StatefulWidget {
  @override
  _CourseLevelButtonState createState() => _CourseLevelButtonState();
}

class _CourseLevelButtonState extends State<CourseLevelButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
//        radius: 50.0,
      child: Container(
        padding: EdgeInsets.only(left: 35.0, right: 35.0, top: 15.0, bottom: 15.0),
        decoration: new BoxDecoration(
          color: Colors.black12,
          borderRadius: new BorderRadius.circular(8.0),
        ),
        child: Column(
          children: <Widget>[
            Text("Tingkat 1", style: TextStyle(fontSize: 20.0, color: Colors.black87, fontWeight: FontWeight.bold),),
            Text("7 Courses", style: TextStyle(fontSize: 16.0, color: Colors.grey),),
          ],
        ),
      ),
    );
  }
}
