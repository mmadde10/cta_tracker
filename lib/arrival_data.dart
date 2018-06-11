import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'config.dart';
import 'package:http/http.dart' as http;

  String mapid = '40710';
  String max = '5';

Future<Arrival> fetchArrival() async {
  final response = await http.get(
    'http://lapi.transitchicago.com/api/1.0/ttarrivals.aspx' + '?key=' + properties['ctakey'] + '&mapid='+ mapid + '&max=' + max + '&outputType=JSON',
  );
  final responseJson = json.decode(response.body);
  return new Arrival.fromJson(responseJson);
}

class Arrival {

  int stopId;
  String stationName;
  String stopDestination;
  String routeColor;
  String destinationName;
  DateTime arrivalTime;
  double latitude;
  double longitude;

  Arrival({this.stopId, this.stationName, this.stopDestination, this.routeColor, this.destinationName, this.arrivalTime, this.latitude, this.longitude});

  factory Arrival.fromJson(Map<String, dynamic> json) {
    return new Arrival(
      stopId: json['ctatt']['eta']['stpId'],
      stationName: json['ctatt']['eta']['staNm'],
      stopDestination: json['ctatt']['eta']['stpDe'],
      routeColor: json['ctatt']['eta']['rt'],
      destinationName: json['ctatt']['eta']['destNm'],
      arrivalTime: json['ctatt']['eta']['arrT'],
      latitude: json['ctatt']['eta']['lat'],
      longitude: json['ctatt']['eta']['lon']
    );
  }
}