import 'package:flutter/material.dart';

class CourseScheduleItem extends StatelessWidget {

  String title;
  String description;
  CourseScheduleItem({Key key, @required this.title, this.description}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var descriptionText = description != null ? "($description)" : '';
    return Container(
      padding: EdgeInsets.only(left: 15, right: 15, bottom: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              Text(title, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.blue),),
              Padding(padding: EdgeInsets.only(right: 5),),
              Text(descriptionText, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
            ],
          ),

          Padding(padding: EdgeInsets.only(bottom: 7),),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("Plan", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey)),
                  Text("19-02-2019")
                ],),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Text("Realization", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey)),
                  Text("19-03-2019")
                ],)
            ],
          ),
        ],
      ),
    );
  }
}