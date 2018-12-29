import 'package:flutter/material.dart';
import 'package:flutter_circular_chart/flutter_circular_chart.dart';
import './course_summary.dart';
import './sgl.dart';

final GlobalKey<AnimatedCircularChartState> _chartKey = new GlobalKey<AnimatedCircularChartState>();

class CoursePage extends StatefulWidget {
  CoursePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _CoursePageState createState() => new _CoursePageState();
}

const List<String> tabNames = const<String>[
  'SGL', 'Schedules', 'Scores', 'Portofolios', 'Seminars', 'Problems'
];

class _CoursePageState extends State<CoursePage> {
  int _screen = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabNames.length,
      child: new Scaffold(
        appBar: new AppBar(
          title: new Text(widget.title),
        ),
        body: new TabBarView(
          children: new List<Widget>.generate(tabNames.length, (int index) {
            switch (_screen) {
              case 0: return new Center(
//                child: new Text('First screen, ${tabNames[index]}'),
                child: CourseSummary(),
              );
              case 1:
                switch(index) {
                  case 0: return Sgl();
                  default: return Sgl();
                }
            }
          }),
        ),
        bottomNavigationBar: new Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            new AnimatedCrossFade(
              firstChild: new Container(),
              secondChild: new Material(
                color: Theme
                    .of(context)
                    .primaryColor,
                child: new TabBar(
                  isScrollable: true,
                  tabs: new List.generate(tabNames.length, (index) {
                    return new Tab(text: tabNames[index].toUpperCase());
                  }),
                ),
              ),
              crossFadeState: _screen == 0
                  ? CrossFadeState.showFirst
                  : CrossFadeState.showSecond,
              duration: const Duration(milliseconds: 300),
            ),
            new BottomNavigationBar(
              currentIndex: _screen,
              onTap: (int index) {
                setState(() {
                  _screen = index;
                });
              },
              items: [
                new BottomNavigationBarItem(
                  icon: new Icon(Icons.dehaze),
                  title: new Text('Summary'),
                ),
                new BottomNavigationBarItem(
                  icon: new Icon(Icons.assignment),
                  title: new Text('Details'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}