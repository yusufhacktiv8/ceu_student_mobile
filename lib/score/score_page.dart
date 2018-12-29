import 'package:flutter/material.dart';
import './kompre.dart';

class ScorePage extends StatefulWidget {
  ScorePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ScorePageState createState() => new _ScorePageState();
}

const List<String> tabNames = const<String>[
  'Kompre', 'UKMPPD'
];

class _ScorePageState extends State<ScorePage> {

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabNames.length,
      child: new Scaffold(
        appBar: new AppBar(
          title: new Text("Score"),
        ),
        body: new TabBarView(
          children: new List<Widget>.generate(tabNames.length, (int index) {
            switch(index) {
              case 0: return Kompre();
              default: return Kompre();
            }
          }),
        ),
        bottomNavigationBar: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Material(
              color: Theme
                  .of(context)
                  .primaryColor,
              child: new TabBar(
//                isScrollable: true,
                tabs: new List.generate(tabNames.length, (index) {
                  return new Tab(text: tabNames[index].toUpperCase());
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}