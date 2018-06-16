import 'dart:async';
import 'dart:convert';
import 'config.dart';
import 'package:http/http.dart' as http;

  int mapIDLocation = 40710;
  int maxAmount = 5;
  String mapID = '&mapid=' + mapIDLocation.toString();
  String max = '&max=' + maxAmount.toString();
  String baseURL = 'http://lapi.transitchicago.com/api/1.0/ttarrivals.aspx';
  String key = '?key=' + ctaKey;
  String outputType = '&outputType=JSON';
  String url = baseURL + key + mapID + max + outputType;


Future<Arrival> fetchArrival() async {
  final response = await http.get(url);
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