import 'package:flutter/material.dart';


class Home extends StatefulWidget{
  @override
  _HomeBar createState() => new _HomeBar();
}

class _HomeBar extends State<Home>{
  Auswahl _gewaehlt = aus[0];

  void _select(Auswahl auswahl){
    setState(() {
      _gewaehlt = auswahl;
    });
  }

  @override
  Widget build(BuildContext context) {

    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: const Text('G7 Home'),
          backgroundColor: Colors.red[800],
          actions: <Widget>[
            // action button
            new IconButton(
              icon: new Icon(aus[0].icon),
              onPressed: () {
                _select(aus[0]);
              },
            ),
            // action button
            new IconButton(
              icon: new Icon(aus[1].icon),
              onPressed: () {
                _select(aus[1]);
              },
            ),
            // overflow menu
            new PopupMenuButton<Auswahl>(
              onSelected: _select,
              itemBuilder: (BuildContext context) {
                return aus.skip(2).map((Auswahl auswahl) {
                  return new PopupMenuItem<Auswahl>(
                    value: auswahl,
                    child: new Text(auswahl.titel),
                  );
                }).toList();
              },
            ),
          ],
        ),
        body: new Padding(
          padding: const EdgeInsets.all(16.0),
          child: new AuswahlKarte(auswahl: _gewaehlt),
        ),
      ),
    );
  }
}

class Auswahl{
  const Auswahl({this.titel, this.icon});
  final String titel;
  final IconData icon;
}

const List<Auswahl> aus = const <Auswahl>[
  const Auswahl(titel: 'Gruppen', icon: Icons.contacts),
  const Auswahl(titel: 'Map', icon: Icons.map),
  const Auswahl(titel: 'Einstellung', icon: Icons.settings),
  const Auswahl(titel: 'Logout', icon: Icons.block),
];

class AuswahlKarte extends StatelessWidget{
  const AuswahlKarte({Key key, this.auswahl}) : super(key: key);

  final Auswahl auswahl;

  @override
  Widget build(BuildContext context) {
    final TextStyle textStyle = Theme.of(context).textTheme.display1;
    return new Card(
      color: Colors.white,
      child: new Center(
        child: new Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            new Icon(auswahl.icon, size: 128.0, color: textStyle.color),
            new Text(auswahl.titel, style: textStyle),
          ],
        ),
      ),
    );
  }
}
