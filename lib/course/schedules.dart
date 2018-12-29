import 'package:flutter/material.dart';

class Schedules extends StatefulWidget {
  @override
  _SchedulesState createState() => _SchedulesState();
}

class _SchedulesState extends State<Schedules> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Card(
          child: ListTile(
            title: Text("Main"),
            subtitle: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Text("Plan: "),
                    Text("01/01/2019 - 0106/2019"),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Text("Actual: "),
                    Text("01/01/2019 - 0106/2019"),
                  ],
                ),
              ],
            ),
          ),
        ),
        Card(
          child: ListTile(
            title: Text("Hospital 1"),
            subtitle: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Text("Plan: "),
                    Text("01/01/2019 - 0106/2019"),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Text("Actual: "),
                    Text("01/01/2019 - 0106/2019"),
                  ],
                ),
              ],
            ),
          ),
        ),
        Card(
          child: ListTile(
            title: Text("Clinic"),
            subtitle: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Text("Plan: "),
                    Text("01/01/2019 - 0106/2019"),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Text("Actual: "),
                    Text("01/01/2019 - 0106/2019"),
                  ],
                ),
              ],
            ),
          ),
        ),
        Card(
          child: ListTile(
            title: Text("Hospital 2"),
            subtitle: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Text("Plan: "),
                    Text("01/01/2019 - 0106/2019"),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Text("Actual: "),
                    Text("01/01/2019 - 0106/2019"),
                  ],
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
