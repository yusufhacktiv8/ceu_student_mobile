import 'package:flutter/material.dart';

class CourseLevelButton extends StatefulWidget {

//  final int level;
//  final bool selected;
//
//  CourseLevelButton({Key key,
//    @required this.level,
//    @required this.selected
//  }) : super(key: key);

  @override
  _CourseLevelButtonState createState() => _CourseLevelButtonState();
}

class _CourseLevelButtonState extends State<CourseLevelButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(10),
      child: Row(
        children: <Widget>[
          InkWell(
            child: Container(
              width: 130,
              height: 60,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(8), bottomLeft: Radius.circular(8)),
              ),
              child: Center(
                child: Text("Tingkat 1", style: TextStyle(color: Colors.white),),
              ),
            ),
          ),
          InkWell(
            child: Container(
              width: 130,
              height: 60,
              decoration: BoxDecoration(
                color: Colors.black26,
                borderRadius: BorderRadius.only(topRight: Radius.circular(8), bottomRight: Radius.circular(8)),
              ),
              child: Center(
                child: Text("Tingkat 2", style: TextStyle(color: Colors.white),),
              ),
            ),
          )
        ],
      ),
    );
  }
}
