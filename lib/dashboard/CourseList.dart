import 'package:flutter/material.dart';
import 'package:badge/badge.dart';
import './../course/CoursePage.dart';

class CourseList extends StatefulWidget {
  @override
  _CourseListState createState() => _CourseListState();
}

const List<String> items = const<String>[
'Kardiologi', 'Interna', 'Jiwa'
];

class _CourseListState extends State<CourseList> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        // Let the ListView know how many items it needs to build
        itemCount: items.length,
        // Provide a builder function. This is where the magic happens! We'll
        // convert each item into a Widget based on the type of item it is.
        itemBuilder: (context, index) {
          final item = items[index];
          return Column(
            children: <Widget>[
              ListTile(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CoursePage()),
                  );
                },
                title: Text(
                  item,
                  style: TextStyle(fontSize: 18.0),
                ),
//                subtitle: Text("Prerequisite for level 1"),
                leading: Badge.before(
                  value: "  JIW  ",
                  positionTop: 5,
                  child: Text(""),
                ),
                trailing: Badge.before(
                  textStyle: TextStyle(fontSize: 2.0),
                  spacing: 5,
                  color: Colors.green,
                  value: " ",
                  child: Text("Completed"),
                ),
              ),
              Divider()
            ],
          );
        },
      ));
  }
}
