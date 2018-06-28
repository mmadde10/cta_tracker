import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'main_drawer.dart';
import 'package:cta_tracker/middleware/arrival_data.dart';
import 'error_screens/location_error.dart';
import 'loading_screen.dart';
import 'components/station_gridview.dart';

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
        child: new FutureBuilder<Arrival>(
        future: fetchArrival(),
        builder: (context,snapshot){
          if(snapshot.hasData){
               return new StationGridView(snapshot);
          }
          else if (snapshot.hasError){
            return new Center(
              child: new Card(
                child: new Center(
                  child: getLocationError(),
                ),
              ),
            );
          }
          return new Center(
            child: getLoadingScreen(snapshot),
          );
        }
      ),
    )
    );
  }
}