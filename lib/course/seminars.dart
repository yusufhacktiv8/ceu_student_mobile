import 'package:flutter/material.dart';

class Seminars extends StatefulWidget {
  @override
  _SeminarsState createState() => _SeminarsState();
}

class _SeminarsState extends State<Seminars> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: <Widget>[
          ListTile(
            title: Text("Fraktur pada tulang"),
            subtitle: Text("29/12/2018"),
          )
        ],
      ),
    );
  }
}
