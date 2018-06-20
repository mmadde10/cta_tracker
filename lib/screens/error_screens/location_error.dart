import 'package:flutter/material.dart';

Container getLocationError(){
    return new Container(
        child: new Center(
          child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text(
              "Error Retreving Location. Please Select your Station"
            ),
          ]
        )
    )
    );
  }