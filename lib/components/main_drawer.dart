import 'package:flutter/material.dart';
import 'package:cta_tracker/styles/color.dart';
import 'package:cta_tracker/actions/stations.dart';
import 'package:cta_tracker/screens/home_screen.dart';

class MainDrawer extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new Drawer(
      child: new ListView.builder(
        padding: new EdgeInsets.only(top: 100.0),
        itemBuilder: (BuildContext context, int index) =>
        EntryItem(data[index],myCardColors[index]),
        itemCount: data.length,
      ),
    );
  }
}

// One entry in the multilevel list displayed by this app.
class Entry {
  Entry(this.title, this.stationID,[this.children = const <Entry>[]]);
  final String title;
  final List<Entry> children;
  final int stationID;
}

// The entire multilevel list displayed by this app.

class EntryItem extends StatefulWidget {

  EntryItem(this.entry,this.entryColor);
  final Entry entry;
  final CardColor entryColor;

  @override
  _EntryItemState createState() {
   return new _EntryItemState(this.entry,this.entryColor);
  }
}

// Displays one Entry. If the entry has children then it's displayed
// with an ExpansionTile.
class _EntryItemState extends State<EntryItem> {
  _EntryItemState(this.entry,this.entryColor);
  final Entry entry;
  final CardColor entryColor;
  Color textColor = Colors.white10;

  _changeTextColor(){
      setState(() {
        textColor = Colors.black;
      });
  }

  Widget _buildTiles(Entry root) {
    if (root.children.isEmpty)
      return ListTile(
        title: Text(
            root.title, //Station Names for that Line color
            style: new TextStyle(
                color: Colors.white
            )
        ),
        onTap: (){
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => HomePage(title: root.title,
                stationID: root.stationID)),
          );
        },
    );
    return ExpansionTile(
      onExpansionChanged: _changeTextColor(),
      leading:new Icon(
        Icons.train,
        color: entryColor.color,
      ),
      backgroundColor: entryColor.color,
      key: PageStorageKey<dynamic>(root),
      title: Text(
          root.title, //Line color
          style: new TextStyle(color: textColor)
      ),
      children: root.children.map(_buildTiles).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildTiles(entry);
  }
}