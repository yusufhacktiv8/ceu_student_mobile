import 'package:flutter/material.dart';

class CourseSummaryItem extends StatelessWidget {

  final String name;

  CourseSummaryItem({Key key, this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Container(
          width: 150,
          child: Text(
            name,
            style: TextStyle(fontSize: 14),
          ),
        ),
        Text(
          "42.0",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Container(
          padding:
          EdgeInsets.only(left: 10, right: 10, top: 3, bottom: 3),
          decoration: BoxDecoration(
              color: Color(0xFFFBFBFB),
              border: Border.all(color: Colors.grey, width: 0.3),
              borderRadius: BorderRadius.all(Radius.circular(5))),
          child: Text(
            "0.5 %",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}