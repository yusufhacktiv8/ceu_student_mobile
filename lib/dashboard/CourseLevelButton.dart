import 'package:flutter/material.dart';

class CourseLevelButton extends StatefulWidget {

  final int level;
  final bool selected;

  CourseLevelButton({Key key,
    @required this.level,
    @required this.selected
  }) : super(key: key);

  @override
  _CourseLevelButtonState createState() => _CourseLevelButtonState();
}

class _CourseLevelButtonState extends State<CourseLevelButton> {
  @override
  Widget build(BuildContext context) {
    var decoration;
    if (widget.selected) {
      decoration = BoxDecoration(
        color: Color(0xFFE5E7E9),
        borderRadius: new BorderRadius.circular(8.0),
      );
    }
    return InkWell(
//        radius: 50.0,
      child: Container(
        padding: EdgeInsets.only(left: 35.0, right: 35.0, top: 15.0, bottom: 15.0),
        decoration: decoration,
        child: Column(
          children: <Widget>[
            Text("Tingkat ${widget.level}", style: TextStyle(fontSize: 20.0, color: Colors.black87, fontWeight: FontWeight.bold),),
            Text("7 Courses", style: TextStyle(fontSize: 16.0, color: Colors.grey),),
            Text("Active", style: TextStyle(fontSize: 16.0, color: Colors.green),),
          ],
        ),
      ),
    );
  }
}
