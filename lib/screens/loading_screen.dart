import 'package:flutter/material.dart';

Container getLoadingScreen(){
  return new Container(
    child: new Center(
      child: new CircularProgressIndicator(
          strokeWidth: 2.0
      ),
    )
  );
}