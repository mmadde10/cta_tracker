import 'package:flutter/material.dart';
import 'homepage.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appName = 'My L Trains';

    return new MaterialApp(
      title: appName,
      theme: new ThemeData(
        brightness: Brightness.light,
        primaryColor: Color.fromRGBO(8, 76, 97, 1.0),
        accentColor: Color.fromRGBO(219, 80, 74, 1.0),
      ),
      home: new HomePage(
        title: appName,
      ),
    );
  }
}