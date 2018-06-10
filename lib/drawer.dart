import 'package:flutter/material.dart';


class HomeDrawer extends StatelessWidget{
   @override
  Widget build(BuildContext context) {
    return new Drawer(
            child: new ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            new DrawerHeader(
              child: new Text('L Tracker'),
              decoration: new BoxDecoration(
                color: Color.fromRGBO(8, 76, 97, 1.0),
              ),
            ),
            new ListTile(
              title: new Text('Item 1'),
              onTap: () {
                // Update the state of the app
                // ...
              },
            ),
            new ListTile(
              title: new Text('Item 2'),
              onTap: () {
                // Update the state of the app
                // ...
              },
            ),
          ],
        ),
      );
  }
}