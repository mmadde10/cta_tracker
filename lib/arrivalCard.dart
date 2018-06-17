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
          new Center(
              child: new Text(
                  '2', //Placement text for minutes
                  style: new TextStyle(
                    fontSize: 60.0,
                    fontFamily: 'Roboto',
                    color: new Color(0xFFFFFFFF),
                  )
              )
          ),
          new Center(
              child: new Text(
                  'minutes', //placeholder for min, will go away when its due
                  style: new TextStyle(
                    fontSize: 15.0,
                    fontFamily: 'Roboto',
                    color: new Color(0xFFFFFFFF),
                  )
              )
          ),
          new Center(
            child: new Text(
                    data.destinationName,
                    style: new TextStyle(
                      fontSize: 25.0,
                      fontFamily: 'Roboto',
                      color: new Color(0xFFFFFFFF),
                )
            )
          )
        ],
      ),
      color: getColor(data.routeColor)
  );
}