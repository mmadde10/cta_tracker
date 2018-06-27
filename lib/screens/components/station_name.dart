import 'package:flutter/material.dart';

Card getStationNameCard(data){
      return new Card(
          elevation: 2.0,
          child: new Column(
              children: <Widget>[
                new ListTile(
                  title: new Text(data.stationName.toString()),
                    leading: new Icon(
                      Icons.location_on,
                      color: Colors.blue[500],
                    )
                )
              ],
          )
      );
  }