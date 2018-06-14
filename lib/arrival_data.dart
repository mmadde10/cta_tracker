import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'config.dart';
import 'package:http/http.dart' as http;

  String mapid = '40710';
  String max = '5';
//'http://lapi.transitchicago.com/api/1.0/ttarrivals.aspx' + '?key=' + properties['ctakey'] + '&mapid='+ mapid + '&max=' + max + '&outputType=JSON',
Future<Arrival> fetchArrival() async {
  final response = await http.get('');
  final responseJson = json.decode(response.body);
  return new Arrival.fromJson(responseJson);
}

class Arrival {

  dynamic stopId;
  dynamic stationName;
  dynamic stopDestination;
  dynamic routeColor;
  dynamic destinationName;
  dynamic arrivalTime;
  dynamic latitude;
  dynamic longitude;

  Arrival({this.stopId, this.stationName, this.stopDestination, this.routeColor, this.destinationName, this.arrivalTime, this.latitude, this.longitude});

  factory Arrival.fromJson(Map<String, dynamic> json) {
    Map<int, dynamic> responseMap = json['ctatt']['eta'].asMap();
    return new Arrival(
      stopId: responseMap[0]['stpId'],
      stationName: responseMap[0]['staNm'],
      stopDestination: responseMap[0]['stpDe'],
      routeColor: responseMap[0]['rt'],
      destinationName: responseMap[0]['destNm'],
      arrivalTime: responseMap[0]['arrT'],
      latitude: responseMap[0]['lat'],
      longitude: responseMap[0]['lon']
    );
  }
}