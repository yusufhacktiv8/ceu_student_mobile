import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {

  final label;
  final radius;
  final onClick;

  RoundButton({Key key,
    @required this.label,
    @required this.radius,
    this.onClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: new Container(
        //width: 100.0,
        height: 50.0,
        decoration: new BoxDecoration(
          color: Colors.blueAccent,
//          border: new Border.all(color: Colors.white, width: 2.0),
          borderRadius: new BorderRadius.circular(this.radius),
        ),
        child: new Center(child: new Text(this.label, style: new TextStyle(fontSize: 18.0, color: Colors.white),),),
      ),
    );
  }
}
