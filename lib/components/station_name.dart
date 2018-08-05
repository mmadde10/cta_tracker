import 'package:flutter/material.dart';

Card getStationNameCard(data){
      return new Card(
          elevation: 1.5,
          child: new Column(
              children: <Widget>[
                new ListTile(
                  title: new Text(data.stationName.toString()),
                    leading: new Icon(
                      Icons.location_on, //TODO Change logo based on location
                      color: Colors.blue[500],
                    )
                )
              ],
          )
      );
  }