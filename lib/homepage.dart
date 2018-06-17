import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'drawer.dart';
import 'package:cta_tracker/util/arrival_data.dart';
import 'arrivalCard.dart';

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
            return new Container(
              constraints: new BoxConstraints.expand(
                height: Theme.of(context).textTheme.display1.fontSize * 1.1 + 200.0,
              ),
              child: new GridView.count(
                primary: true,
                padding: const EdgeInsets.all(1.0),
                crossAxisCount: 2,
                childAspectRatio: 0.85,
                mainAxisSpacing: 1.0,
                crossAxisSpacing: 1.0,
                children: <Widget>[
                  getStructuredGridCell(snapshot.data),
                  getStructuredGridCell(snapshot.data),
                  getStructuredGridCell(snapshot.data),
                  getStructuredGridCell(snapshot.data),
                  getStructuredGridCell(snapshot.data),
                  getStructuredGridCell(snapshot.data),
                ],
              )
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
      ),
    )
    );
  }
}