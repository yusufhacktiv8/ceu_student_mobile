import 'package:flutter/material.dart';

class ChartLegend extends StatelessWidget {

  final count;
  final description;
  final color;

  ChartLegend({Key key,
    @required this.count,
    @required this.description,
    @required this.color
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(height: 20, width: 20,
          child: Center(child: Text('${this.count}', style: TextStyle(fontSize: 17.0, color: Colors.white, fontWeight: FontWeight.normal))),
          decoration: BoxDecoration(
              color: this.color,
              borderRadius: BorderRadius.all(Radius.circular(5.0))
          ),
        ),
        Padding(padding: EdgeInsets.all(5),),
        Text(this.description, style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),),
        Padding(padding: EdgeInsets.all(3),),
//        Icon(Icons.arrow_forward_ios, color: Colors.black26,),
      ],
    );
  }
}
