import 'package:flutter/material.dart';

Container getLoadingScreen(snapshot){
  return new Container(
    child: new Center(
      child: new CircularProgressIndicator(
          strokeWidth: 2.0
      ),
    )
  );
}