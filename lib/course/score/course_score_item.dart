import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CourseScoreItem extends StatelessWidget {

  final Widget name;
  final double score;
  final double percentage;
  final fn = new NumberFormat("#,###.00");

  CourseScoreItem({Key key,
    @required this.name,
    @required this.score,
    @required this.percentage
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            width: 142,
            child: name,
          ),
          Container(
            width: 50,
            alignment: Alignment.centerRight,
            child: Text(
              fn.format(score),
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
            ),
          ),
          Container(
            width: 100,
            padding: EdgeInsets.only(left: 10),
            child: Container(
              alignment: Alignment.centerRight,
              padding:
              EdgeInsets.only(left: 10, right: 10, top: 3, bottom: 3),
              decoration: BoxDecoration(
                  color: Color(0xFFFBFBFB),
                  border: Border.all(color: Colors.grey, width: 0.3),
                  borderRadius: BorderRadius.all(Radius.circular(5))),
              child: Text(
                fn.format(percentage),
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
//    return Row(
//      mainAxisAlignment: MainAxisAlignment.spaceBetween,
//      children: <Widget>[
//        Container(
//          width: 130,
//          child: name,
//        ),
//        Container(
//          width: 50,
//          alignment: Alignment.centerRight,
//          child: Text(
//            "$score",
//            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
//          ),
//        ),
//        Container(
//          width: 85,
//          padding: EdgeInsets.only(left: 10),
//          child: Container(
//            alignment: Alignment.centerRight,
//            padding:
//            EdgeInsets.only(left: 10, right: 10, top: 3, bottom: 3),
//            decoration: BoxDecoration(
//                color: Color(0xFFFBFBFB),
//                border: Border.all(color: Colors.grey, width: 0.3),
//                borderRadius: BorderRadius.all(Radius.circular(5))),
//            child: Text(
//              "$percentage %",
//              style: TextStyle(fontWeight: FontWeight.bold),
//            ),
//          ),
//        ),
//      ],
//    );
  }
}