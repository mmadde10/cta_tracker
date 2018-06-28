import 'package:flutter/material.dart';


//arrivalTime
//predictedTime
String calculateArrivalTime(data){

  String displayTime = " ";

  DateTime parsedArrivalTime = DateTime.parse(data['arrT'].toString());
  DateTime parsedPredictedTime = DateTime.parse(data['prdt'].toString());

  Duration calculatedArrivalTime = parsedArrivalTime.difference(parsedPredictedTime);
  int appr = int.parse(data['isApp']);

  if(appr == 1){
    displayTime = "Due";
  }
  else {
    displayTime = calculatedArrivalTime.inMinutes.toString();
  }
  return displayTime;
}

String displayTimeUnits(data){

  int appr = int.parse(data['isApp']);
  String displayTimeUnits = "";
  if(appr == 0){
    displayTimeUnits = "Minutes";
  }
  return displayTimeUnits;

}