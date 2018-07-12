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

// Displays one Entry. If the entry has children then it's displayed
// with an ExpansionTile.
class EntryItem extends StatelessWidget {
  const EntryItem(this.entry,this.entryColor);
  final Entry entry;
  final CardColor entryColor;

  Widget _buildTiles(Entry root) {
    if (root.children.isEmpty) return ListTile(title: Text(root.title));
    return ExpansionTile(
      backgroundColor: entryColor.color,
      key: PageStorageKey<dynamic>(root),
      title: Text(
          root.title,
          style: new TextStyle(color: Colors.black.withOpacity(1.0))
      ),
      children: root.children.map(_buildTiles).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildTiles(entry);
  }
}