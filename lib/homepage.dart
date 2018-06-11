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
      body: new Center(
        child: new FutureBuilder<Arrival>(
        future: fetchArrival(),
        builder: (context,snapshot){
          if(snapshot.hasData){
            return new Text((snapshot.data).toString());
          }
          else if (snapshot.hasError){
            return new Text("${snapshot.error}");
          }
          return new CircularProgressIndicator();
        }
      ) ,
    )
    );
  }
}