import 'package:flutter/material.dart';

Container getHTTPError(){
  return new Container(
      child: new Center(
          child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Text(
                  "Error Retreving Trains. Please Retry",
                  style: new TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
                ),
              ]
          )
      )
  );
}