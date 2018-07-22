import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:cta_tracker/screens/components/main_drawer.dart';
import 'package:cta_tracker/middleware/arrival_data.dart';
import 'package:cta_tracker/screens/components/loading_screen.dart';
import 'components/station_gridview.dart';
import 'error_screens/http_error.dart';

class HomeLocationPage extends StatefulWidget {
  final int stationID;
  HomeLocationPage(this.stationID);
  @override
  HomeLocationPageState createState() => new HomeLocationPageState(stationID);
}

class HomeLocationPageState extends State<HomeLocationPage> {
  final int stationID;
  HomeLocationPageState(this.stationID);
  @override
  Widget build(BuildContext context) {
      return new Container(
        child: new FutureBuilder<Arrival>(
            future: fetchArrival(stationID),
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
  final int stationID;

  HomePage({Key key,this.title, this.stationID}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      drawer: new MainDrawer(),
      appBar: new AppBar(
        title: new Text(title),
      ),
      body: new Container(
        child: HomeLocationPage(stationID),
      ),
    );
  }
}