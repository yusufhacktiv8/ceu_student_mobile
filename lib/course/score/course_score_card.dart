import 'package:ceu_student/course/score/course_score.dart';
import 'package:ceu_student/models/course.dart';
import 'package:flutter/material.dart';

class CourseScoreCard extends StatelessWidget {

  final Course course;

  CourseScoreCard({Key key,
    this.course,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    String classification = 'A';
    Color color = Colors.black;

    if (course != null) {
      var totalPercentage = course.totalPercentage;

      if (totalPercentage >= 80 && totalPercentage <= 100) {
        classification = 'A';
        color = Colors.blue;
      } else if (totalPercentage >= 70 && totalPercentage <= 79) {
        classification = 'B';
        color = Colors.green;
      } else if (totalPercentage >= 60 && totalPercentage <= 69) {
        classification = 'C';
        color = Colors.orange;
      } else if (totalPercentage > 0 && totalPercentage <= 59) {
        classification = 'E';
        color = Colors.red;
      } else if (totalPercentage <= 0) {
        classification = '-';
        color = Colors.grey;
      }
    }

    return Container(
//      height: 365,
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
//            padding: EdgeInsets.all(10),
//            height: 250,
            child: CourseScore(course: course),
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
                    classification,
                    style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: color),
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