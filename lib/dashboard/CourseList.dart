import 'package:flutter/material.dart';

class CourseList extends StatefulWidget {
  @override
  _CourseListState createState() => _CourseListState();
}

const List<String> items = const<String>[
'Course 1', 'Course 2', 'Course 3'
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
          return ListTile(
            title: Text(
              item,
              style: Theme.of(context).textTheme.headline,
            ),
          );
        },
      ));
  }
}
