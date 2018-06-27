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
  const StaggeredTile.count(2, 2),
  const StaggeredTile.count(2, 2),
  const StaggeredTile.count(2, 2),
  const StaggeredTile.count(2, 2),
  const StaggeredTile.count(2, 2),
  const StaggeredTile.count(2, 2),
  const StaggeredTile.count(2, 2),
  const StaggeredTile.count(2, 2),
  const StaggeredTile.count(2, 2),
  const StaggeredTile.count(2, 2)
];

List<Widget> _tiles = const <Widget>[
  const _Example01Tile(Colors.green, Icons.widgets),
  const _Example01Tile(Colors.lightBlue, Icons.wifi),
  const _Example01Tile(Colors.amber, Icons.panorama_wide_angle),
  const _Example01Tile(Colors.brown, Icons.map),
  const _Example01Tile(Colors.deepOrange, Icons.send),
  const _Example01Tile(Colors.indigo, Icons.airline_seat_flat),
  const _Example01Tile(Colors.red, Icons.bluetooth),
  const _Example01Tile(Colors.pink, Icons.battery_alert),
  const _Example01Tile(Colors.purple, Icons.desktop_windows),
  const _Example01Tile(Colors.blue, Icons.radio),
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
      children: _tiles,
      mainAxisSpacing: 1.0,
      crossAxisSpacing: 1.0,
    );
  }
}

class _Example01Tile extends StatelessWidget {
  const _Example01Tile(this.backgroundColor, this.iconData);

  final Color backgroundColor;
  final IconData iconData;

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
                padding: new EdgeInsets.fromLTRB(00.0, 25.0, 8.0, 8.0),
                child: new Center(
                  child: new Text(
                      calculateArrivalTime(data), //Placement text for minutes
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
                      displayTimeUnits(data),
                      //placeholder for min, will go away when its due
                      style: new TextStyle(
                        fontSize: 15.0,
                        fontFamily: 'Roboto',
                        color: new Color(0xFFFFFFFF),
                      )
                  )
              ),
            ),
            new Padding(
                padding: new EdgeInsets.fromLTRB(0.0, 45.0, 0.0, 8.0),
                child: new Center(
                    child: new Text(
                        data.destinationName,
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
        color: getColor(data.routeColor)
    );
  }
}