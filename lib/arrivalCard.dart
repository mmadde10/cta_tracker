import 'package:flutter/material.dart';
import 'util/color.dart';

Color getColor(routeColor){
 for(var c in myCardColors){
    if(routeColor.toString().toLowerCase() == c.name.toString().toLowerCase()) return c.color;
 }
}

Card getStructuredGridCell(data){
  return new Card(
      elevation: 1.5,
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        verticalDirection: VerticalDirection.down,
        children: <Widget>[
          new Text((data.destinationName)),
          new Text((data.arrivalTime))
        ],
      ),
      color: getColor(data.routeColor)
    );
}