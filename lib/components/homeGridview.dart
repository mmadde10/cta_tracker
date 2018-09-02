import 'package:flutter/material.dart';
import 'package:cta_tracker/screens/lineSelectScreen.dart';

class HomeGridViewCard extends StatelessWidget {
  final String name;
  HomeGridViewCard(this.name);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(
        context,
          MaterialPageRoute(builder: (context) => LineSelectPage()),
      );
      },
      child: new Card(
        elevation: 1.5,
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          verticalDirection: VerticalDirection.down,
          children: <Widget>[
            new Center(
              child: new Text(name),
            )
          ],
        )
      )
      );
  }

}

class HomeGridView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new GridView.count(
      primary: true,
      padding: const EdgeInsets.all(1.0),
      crossAxisCount: 2,
      childAspectRatio: 0.85,
      mainAxisSpacing: 1.0,
      crossAxisSpacing: 1.0,
      children: <Widget>[
        HomeGridViewCard("Near Me"),
        HomeGridViewCard("L Trains"),
        HomeGridViewCard("Busses"),
        HomeGridViewCard("Metra"),
      ],
    );
  }

}