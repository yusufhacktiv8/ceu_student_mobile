import 'package:flutter/material.dart';

class ChartLegend extends StatelessWidget {

  final count;
  final description;

  ChartLegend({Key key, @required this.count, @required this.description}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(color: Colors.grey, height: 50, width: 5),
        Padding(padding: EdgeInsets.all(5),),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('${this.count}', style: TextStyle(fontSize: 27.0, color: Colors.black54)),
            Text(this.description)
          ],
        ),
        Padding(padding: EdgeInsets.all(3),),
        Icon(Icons.arrow_forward_ios, color: Colors.black26,),
      ],
    );
  }
}
