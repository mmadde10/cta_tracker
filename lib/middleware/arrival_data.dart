import 'dart:async';
import 'dart:convert';
import '../config.dart';
import 'package:http/http.dart' as http;

//TODO Beautify this function
String buildURL(mapLocation){
  int maxAmount = 15; //wont need more than 10 but 15 to be safe
  String mapID = '&mapid=' + mapLocation.toString();
  String max = '&max=' + maxAmount.toString();
  String baseURL = 'http://lapi.transitchicago.com/api/1.0/ttarrivals.aspx';
  String key = '?key=' + ctaKey;
  String outputType = '&outputType=JSON';
  String url = baseURL + key + mapID + max + outputType;

  return url;
}

Future<Arrival> fetchArrival(stationID) async {
  if(stationID == null){
    stationID = 41700;
  }
  String url = buildURL(stationID); //hard coded for now
  final response = await http.get(url);
  final responseJson = json.decode(response.body);
  return new Arrival.fromJson(responseJson);
}

class Arrival {
  dynamic response;

  Arrival({this.response});

  factory Arrival.fromJson(Map<String, dynamic> json) {
    Map<int, dynamic> responseMap = json['ctatt']['eta'].asMap();

    return new Arrival(
     response: responseMap
    );
  }
}