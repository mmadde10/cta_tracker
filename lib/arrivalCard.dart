import 'package:flutter/material.dart';
import 'util/color.dart';

int getColor(routeColor){
  int value = 0x565a5c;
  for (var key in Lcolors.keys){
    if(key.toString().toLowerCase() == routeColor.toString().toLowerCase()){
      value = Lcolors[key];
      // print(value);
      break;
    }
    else{
      continue;
    }
  }
  print("hello");
  print("hello");
  print(value);
  return value;
}


Card getStructuredGridCell(data) {
  return new Card(
      elevation: 1.5,
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        verticalDirection: VerticalDirection.down,
        children: <Widget>[
          new Text((data.routeColor)),
          new Text((data.destinationName)),
          new Text((data.arrivalTime))
        ],
      ),
      color: Color(getColor(data.routeColor))
    );
}