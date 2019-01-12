import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CourseScheduleItem extends StatelessWidget {

  String title;
  String description;
  DateTime planFrom;
  DateTime planTo;
  DateTime realFrom;
  DateTime realTo;
  String adviser;
  String examiner;
  String dpk;
  CourseScheduleItem({Key key,
    @required this.title,
    this.description,
    this.planFrom,
    this.planTo,
    this.realFrom,
    this.realTo,
    this.adviser,
    this.examiner,
    this.dpk
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var descriptionText = description != null ? "($description)" : '';
    var columnItems = [
      Row(
        children: <Widget>[
          Icon(Icons.date_range, size: 13, color: Colors.grey,),
          Padding(padding: EdgeInsets.only(right: 5),),
          Text("19 Feb 2019", style: TextStyle(fontSize: 14),),
          Padding(padding: EdgeInsets.only(right: 5),),
          Icon(Icons.indeterminate_check_box, size: 15, color: Colors.black26,),
          Padding(padding: EdgeInsets.only(right: 5),),
          Text("19 Feb 2019", style: TextStyle(fontSize: 14),),
        ],
      ),
      Padding(padding: EdgeInsets.only(bottom: 10),),
      Row(
        children: <Widget>[
          Icon(Icons.calendar_today, size: 13, color: Colors.grey,),
          Padding(padding: EdgeInsets.only(right: 5),),
          Text("19 Feb 2019", style: TextStyle(fontSize: 14),),
          Padding(padding: EdgeInsets.only(right: 5),),
          Icon(Icons.indeterminate_check_box, size: 15, color: Colors.black26,),
          Padding(padding: EdgeInsets.only(right: 5),),
          Text("19 Feb 2019", style: TextStyle(fontSize: 14),),
        ],
      ),
    ];

    if (adviser != null) {
      columnItems.add(Padding(padding: EdgeInsets.only(bottom: 10),),);
      columnItems.add(Row(
        children: <Widget>[
          Icon(Icons.recent_actors, size: 15, color: Colors.grey,),
          Padding(padding: EdgeInsets.only(right: 5),),
          Text(adviser, style: TextStyle(fontSize: 14),),
        ],
      ));
    }
    if (examiner != null) {
      columnItems.add(Padding(padding: EdgeInsets.only(bottom: 10),),);
      columnItems.add(Row(
        children: <Widget>[
          Icon(Icons.rate_review, size: 15, color: Colors.grey,),
          Padding(padding: EdgeInsets.only(right: 5),),
          Text(examiner, style: TextStyle(fontSize: 14),),
        ],
      ));
    }
    if (dpk != null) {
      columnItems.add(Padding(padding: EdgeInsets.only(bottom: 10),),);
      columnItems.add(Row(
        children: <Widget>[
          Icon(Icons.streetview, size: 15, color: Colors.grey,),
          Padding(padding: EdgeInsets.only(right: 5),),
          Text(dpk, style: TextStyle(fontSize: 14),),
        ],
      ));
    }
    return Container(
      padding: EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 10),
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
                children: columnItems,
              ),
            ],
          ),
        ],
      ),
    );
  }
}