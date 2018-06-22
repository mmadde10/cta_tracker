import 'package:flutter/material.dart';
import 'package:cta_tracker/styles/color.dart';
import '../../actions/time.dart';

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
          new Padding(
              padding: new EdgeInsets.fromLTRB(00.0,25.0,8.0,8.0),
              child: new Center(
                child: new Text(
                    calculateArrivalTime(data), //Placement text for minutes
                    style: new TextStyle(
                      fontSize: 50.0,
                      fontFamily: 'Roboto',
                      color: new Color(0xFFFFFFFF),
                    )
                ),
              )
          ),
          new Padding(padding: new EdgeInsets.fromLTRB(0.0,0.0,0.0,8.0),
              child: new Center(
                  child: new Text(
                      displayTimeUnits(data), //placeholder for min, will go away when its due
                      style: new TextStyle(
                        fontSize: 15.0,
                        fontFamily: 'Roboto',
                        color: new Color(0xFFFFFFFF),
                      )
                  )
              ),
          ),
          new Padding(
              padding: new EdgeInsets.fromLTRB(0.0,45.0,0.0,8.0),
            child: new Center(
              child: new Text(
                    data.destinationName,
                    style: new TextStyle(
                      fontSize: 25.0,
                      fontFamily: 'Roboto',
                      color: new Color(0xFFFFFFFF),
                    )
                )
            )
          )
        ],
      ),
      color: getColor(data.routeColor)
  );
}