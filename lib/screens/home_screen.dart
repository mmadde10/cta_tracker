import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:cta_tracker/screens/components/main_drawer.dart';
import 'package:cta_tracker/middleware/arrival_data.dart';
import 'package:cta_tracker/screens/components/loading_screen.dart';
import 'components/station_gridview.dart';
import 'error_screens/http_error.dart';
import 'package:location/location.dart';
import 'dart:async';


class HomeLocationPage extends StatefulWidget {
  @override
  HomeLocationPageState createState() => new HomeLocationPageState();
  final locations = [];

}

class HomeLocationPageState extends State<HomeLocationPage> {
  Location _location = new Location();
  Map<String, double> currentLocation;


  Future<Null> findUserLocation() async {
    Map<String, double> location;
    try {
      location = await _location.getLocation;
      setState(() {
        currentLocation = {
          "latitude": location["latitude"],
          "longitude": location['longitude'],
        };
      });
      print(currentLocation);
    } catch (exception) {}
  }


  @override
  void initState() {
    super.initState();
    findUserLocation();
  }


  @override
  Widget build(BuildContext context) {
      return new Container(
        child: new FutureBuilder<Arrival>(
            future: fetchArrival(currentLocation),
            builder: (context,snapshot){
              if(snapshot.hasData){
                return new StationGridView(snapshot);
              }
              else if (snapshot.hasError){
                return new Center(
                  child: new Card(
                    child: new Center(
                      child: getHTTPError(),
                    ),
                  ),
                );
              }
              return new Center(
                child: getLoadingScreen(snapshot),
              );
            }
        ),
      );
  }
}



class HomePage extends StatelessWidget {
  final String title;

  HomePage({Key key,this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      drawer: new MainDrawer(),
      appBar: new AppBar(
        title: new Text(title),
      ),
      body: new Container(
        child: HomeLocationPage(),
      ),
    );
  }
}