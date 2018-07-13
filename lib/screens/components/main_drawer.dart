import 'package:flutter/material.dart';
import 'package:cta_tracker/styles/color.dart';

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
  Entry(this.title, [this.children = const <Entry>[]]);
  final String title;
  final List<Entry> children;
}

// The entire multilevel list displayed by this app.
final List<dynamic> data = <dynamic>[
  Entry(
    'Red Line',
    <Entry>[
      Entry('Section A1'),
      Entry('Section A2'),
    ],
  ),
  Entry(
    'Brown Line',
    <Entry>[
      Entry('Section B0'),
      Entry('Section B1'),
    ],
  ),
  Entry(
    'Orange Line',
    <Entry>[
      Entry('Section C0'),
      Entry('Section C1'),
    ],
  ),
  Entry(
    'Purple Line',
    <Entry>[
      Entry('Section C0'),
      Entry('Section C1'),
    ],
  ),
  Entry(
    'Blue Line',
    <Entry>[
      Entry('Section C0'),
      Entry('Section C1'),
    ],
  ),
  Entry(
    'Green Line',
    <Entry>[
      Entry('Section C0'),
      Entry('Section C1'),
    ],
  ),
  Entry(
    'Pink Line',
    <Entry>[
      Entry('Section C0'),
      Entry('Section C1'),
    ],
  ),
  Entry(
    'Yellow Line',
    <Entry>[
      Entry('Section C0'),
      Entry('Section C1'),
    ],
  ),
];

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
        )
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