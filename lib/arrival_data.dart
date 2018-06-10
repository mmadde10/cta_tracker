import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

Future<Arrival> fetchPost() async {
  final response = await http.get(
    'http://lapi.transitchicago. com/api/1.0/ttarrivals.aspx',
    headers: {HttpHeaders.AUTHORIZATION: "Basic your_api_token_here"},
  );
  final responseJson = json.decode(response.body);
  return new Arrival().fromJson(responseJson);
}


class Arrival {
  int mapid;
  int max;
  String key;

  int stopId;
  String stationName;
  String stopDestination;
  String routeColor;


}