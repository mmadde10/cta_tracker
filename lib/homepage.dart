import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'drawer.dart';
import 'arrival_data.dart';

class HomePage extends StatelessWidget {
  final String title;

  HomePage({Key key,this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      drawer: new HomeDrawer(),
      appBar: new AppBar(
        title: new Text(title),
      ),
      body: new Container(
        child: new FutureBuilder<Arrival>(
        future: fetchArrival(),
        builder: (context,snapshot){
          if(snapshot.hasData){
            return new GridView.count(
                primary: true,
                padding: const EdgeInsets.all(20.0),
                crossAxisSpacing: 10.0,
                crossAxisCount: 2,
                children: <Widget>[
                   new Card(
                    child: new Container(
                      child: new Column(
                        children: <Widget>[
                          new Text((snapshot.data.routeColor)),
                          new Text((snapshot.data.destinationName)),
                          new Text((snapshot.data.arrivalTime))
                        ],
                      ),
                      padding: const EdgeInsets.all(25.0),
                    ),
                  ),
                ]
            );
          }
          else if (snapshot.hasError){
            return new Center(
              child: new Card(
                child: new Center(
                  child: new Text("${snapshot.error}"),
                ),
              ),
            );
          }
          return new CircularProgressIndicator();
        }
      ) ,
    )
    );
  }
}