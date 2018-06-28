import 'dart:async';
import 'dart:convert';
import '../config.dart';
import 'package:http/http.dart' as http;

  int mapIDLocation = 40710; //TODO mapId brought in from location services
  int maxAmount = 10;
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
  dynamic predictedTime;
  dynamic isApproaching;
  dynamic response;

  Arrival({this.stopId, this.stationName, this.stopDestination, this.routeColor, this.destinationName, this.arrivalTime, this.latitude, this.longitude, this.predictedTime,this.isApproaching, this.response});


  factory Arrival.fromJson(Map<String, dynamic> json) {
    Map<int, dynamic> responseMap = json['ctatt']['eta'].asMap();

    return new Arrival(
     response: responseMap
    );
  }
}