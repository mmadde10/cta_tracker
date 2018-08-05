import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:cta_tracker/styles/color.dart';
import 'package:cta_tracker/actions/time.dart';

List<StaggeredTile> addStaggeredTiles(snapshot){

  List<StaggeredTile> staggeredTilesList = new List();
  const longTile =  StaggeredTile.count(4, 1);
  const smallTile = StaggeredTile.count(2, 2);

  for(var i in snapshot.data.response.keys){
    staggeredTilesList.add(smallTile);
  }
  return staggeredTilesList;
}

List<Widget> addArrivalTile(snapshot){
  List<Widget> arrivalTileList = new List();
  for(var i in snapshot.data.response.keys){
    arrivalTileList.add(_ArrivalTile(snapshot.data.response[i]));
  }
  return arrivalTileList;
}

class StationGridView extends StatelessWidget{
  const StationGridView(this.data);
  final dynamic data;

  @override
  Widget build(BuildContext context) {
    return new StaggeredGridView.count(
      primary: true,
      padding: const EdgeInsets.all(1.0),
      crossAxisCount: 4,
      staggeredTiles: addStaggeredTiles(this.data),
      children: addArrivalTile(this.data),
      mainAxisSpacing: 1.0,
      crossAxisSpacing: 1.0,
    );
  }
}

class _ArrivalTile extends StatelessWidget {
  const _ArrivalTile(this.snapshot);
  final dynamic snapshot;

  @override
  Widget build(BuildContext context) {
    return new Card(
        elevation: 1.5,
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          verticalDirection: VerticalDirection.down,
          children: <Widget>[
            new Padding(
                padding: new EdgeInsets.fromLTRB(00.0, 10.0, 8.0, 8.0),
                child: new Center(
                  child: new Text(
                      calculateArrivalTime(snapshot),
                      style: new TextStyle(
                        fontSize: 50.0,
                        fontFamily: 'Roboto',
                        color: new Color(0xFFFFFFFF),
                      )
                  ),
                )
            ),
            new Padding(padding: new EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 8.0),
              child: new Center(
                  child: new Text(
                      displayTimeUnits(snapshot),
                      style: new TextStyle(
                        fontSize: 15.0,
                        fontFamily: 'Roboto',
                        color: new Color(0xFFFFFFFF),
                      )
                  )
              ),
            ),
            new Padding(
                padding: new EdgeInsets.fromLTRB(0.0, 25.0, 0.0, 8.0),
                child: new Center(
                    child: new Text(
                        snapshot['destNm'],
                        style: new TextStyle(
                          fontSize: 25.0,
                          fontFamily: 'Roboto',
                          color: new Color(0xFFFFFFFF),
                        )
                    )
                )
            )
          ],
        ),
        color: getColor(snapshot['rt'])
    );
  }
}

class StationNameTile extends StatelessWidget {
  const StationNameTile(this.snapshot);
  final dynamic snapshot;

  @override
  Widget build(BuildContext context){
    return new Card(
        elevation: 2.0,
        child: new Center(
            child: new ListTile(
                title: new Text(
                    snapshot['staNm'].toString(),
                    style: new TextStyle(
                        fontSize: 20.0,
                        fontFamily: 'Roboto'
                    ),
                ),
                leading: new Icon(
                  Icons.location_on,
                  color: Colors.blue[500],
                )
            )
        )
    );
  }
}