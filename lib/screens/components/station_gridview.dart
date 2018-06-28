import 'package:flutter/material.dart';
import 'arrivalCard.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:cta_tracker/styles/color.dart';
import '../../actions/time.dart';

getColor(routeColor){
  for(var c in myCardColors){
    if(routeColor.toString().toLowerCase() == c.name.toString().toLowerCase()) return c.color;
  }
}

List<StaggeredTile> _staggeredTiles = const <StaggeredTile>[
  const StaggeredTile.count(4, 1),
  const StaggeredTile.count(2, 4),
];



class StationGridView extends StatelessWidget{
  const StationGridView(this.data);
  final dynamic data;

  @override
  Widget build(BuildContext context) {
    return new StaggeredGridView.count(
      primary: true,
      padding: const EdgeInsets.all(1.0),
      crossAxisCount: 4,
      staggeredTiles: _staggeredTiles,
      children: <Widget>[
        StationNameTile(this.data),
        _ArrivalTile(this.data),
        _ArrivalTile(this.data),
        _ArrivalTile(this.data),
        _ArrivalTile(this.data),
        _ArrivalTile(this.data),
        _ArrivalTile(this.data),
        _ArrivalTile(this.data),
        _ArrivalTile(this.data),
        _ArrivalTile(this.data),
        _ArrivalTile(this.data)
      ],
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
                      calculateArrivalTime(snapshot.data),
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
                      displayTimeUnits(snapshot.data),
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
                        snapshot.data.destinationName,
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
        color: getColor(snapshot.data.routeColor)
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
                    snapshot.data.stationName.toString(),
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