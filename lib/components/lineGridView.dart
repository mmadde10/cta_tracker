import 'package:flutter/material.dart';

class LineGridViewCard extends StatelessWidget {
  final String name;
  LineGridViewCard(this.name);
   
   @override
   Widget build(BuildContext context){
    return new Card(
        elevation: 1.5,
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          verticalDirection: VerticalDirection.down,
          children: <Widget>[
            new Center(
              child: new Text(name),
            ),
            new Center(
              child: new Icon(
                Icons.train,
              )
            )
          ],
        )
        );
   }
}
class LineGridView extends StatelessWidget {
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
        LineGridViewCard("Red Line"),
        LineGridViewCard("Blue Line"),
        LineGridViewCard("Brown Line"),
        LineGridViewCard("Green Line"),
        LineGridViewCard("Orange Line"),
        LineGridViewCard("Pink Line"),
        LineGridViewCard("Purple Line"),
        LineGridViewCard("Yellow Line"),
      ],
    );
  }
}