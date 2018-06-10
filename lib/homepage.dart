import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'drawer.dart';

class HomePage extends StatelessWidget {
  final String title;

  HomePage({Key key,this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      drawer: new HomeDrawer(),
      appBar: new AppBar(
        title: new Text(title),
      ),
    );
  }
}