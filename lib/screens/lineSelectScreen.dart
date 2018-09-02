import 'package:flutter/material.dart';
import 'package:cta_tracker/components/main_drawer.dart';
import 'package:cta_tracker/components/lineGridView.dart';


class LineSelectPage extends StatelessWidget {

final LineGridView lineGridView = new LineGridView();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      drawer: new MainDrawer(),
      appBar: new AppBar(
        title: new Text("L Trains"),
      ),
      body: lineGridView,
      );
  }
}