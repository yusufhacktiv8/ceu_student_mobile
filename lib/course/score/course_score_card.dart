import 'package:ceu_student/course/score/course_score.dart';
import 'package:flutter/material.dart';

class CourseScoreCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 365,
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey, width: 0.3),
          borderRadius: BorderRadius.all(Radius.circular(5))
      ),
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(10),
            height: 60,
            decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: Colors.grey, width: 0.3))
            ),
            child: Row(
              children: <Widget>[
                Text("Score", style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87
                ),)
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            height: 250,
            child: CourseScore(),
          ),
          Container(
            padding: EdgeInsets.all(10),
            height: 54,
            decoration: BoxDecoration(
                color: Color(0xFFFBFBFB),
//                        border: Border(top: BorderSide(color: Colors.grey, width: 0.3)),
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(5), bottomRight: Radius.circular(5))
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Classification',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey),
                ),
                Container(
                  width: 85,
                  alignment: Alignment.center,
                  child: Text(
                    'A',
                    style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}