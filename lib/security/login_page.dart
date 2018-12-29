import 'package:flutter/material.dart';
import 'package:flutter_circular_chart/flutter_circular_chart.dart';

final GlobalKey<AnimatedCircularChartState> _chartKey = new GlobalKey<AnimatedCircularChartState>();

class CoursePage extends StatefulWidget {
  CoursePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _CoursePageState createState() => new _CoursePageState();
}

const List<String> tabNames = const<String>[
  'foo', 'bar', 'baz', 'quox', 'quuz', 'corge', 'grault', 'garply', 'waldo'
];

class _CoursePageState extends State<CoursePage> {
  int _screen = 0;

  @override
  Widget build(BuildContext context) {
    List<CircularStackEntry> data = <CircularStackEntry>[
      new CircularStackEntry(
        <CircularSegmentEntry>[
          new CircularSegmentEntry(500.0, Colors.red[200], rankKey: 'Q1'),
          new CircularSegmentEntry(1000.0, Colors.green[200], rankKey: 'Q2'),
          new CircularSegmentEntry(2000.0, Colors.blue[200], rankKey: 'Q3'),
          new CircularSegmentEntry(1000.0, Colors.yellow[200], rankKey: 'Q4'),
        ],
        rankKey: 'Quarterly Profits',
      ),
    ];
    return DefaultTabController(
      length: tabNames.length,
      child: new Scaffold(
        appBar: new AppBar(
          title: new Text('Navigation example'),
        ),
        body: new TabBarView(
          children: new List<Widget>.generate(tabNames.length, (int index) {
            switch (_screen) {
              case 0: return new Center(
                child: new Text('First screen, ${tabNames[index]}'),
              );
              case 1: return new Center(
                child: new Text('Second screen'),
              );
            }
          }),
        ),
        bottomNavigationBar: new Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            new AnimatedCrossFade(
              firstChild: new Material(
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
              secondChild: new Container(),
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
                  icon: new Icon(Icons.airplanemode_active),
                  title: new Text('Airplane'),
                ),
                new BottomNavigationBarItem(
                  icon: new Icon(Icons.motorcycle),
                  title: new Text('Motorcycle'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}