import 'package:flutter/material.dart';

class Home extends StatefulWidget{
  @override
  _HomeBar createState() => new _HomeBar();
}

enum NavItems{
  Einstellungen,
  Logout
}

class _HomeBar extends State<Home>{

  final list = ListTile.divideTiles(tiles: null);
  void _navItems (NavItems selected){
    switch(selected){
      case NavItems.Einstellungen:
            break;
      case NavItems.Logout:
        break;


    }
  }

  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new DefaultTabController(
          length: 4,
          child: new Scaffold(
            appBar: new AppBar(

              backgroundColor: Colors.red[800],
              bottom: new TabBar(
                tabs: [
                  new Tab(icon: new Icon(Icons.contacts)),
                  new Tab(icon: new Icon(Icons.location_on)),
                ],
              ),
              actions: <Widget>[
               new PopupMenuButton<NavItems>(
                 onSelected: _navItems,
                 itemBuilder: (BuildContext context){
                   return [
                     new PopupMenuItem(
                       value: NavItems.Einstellungen,
                       child: new Text('Einstellungen'),
                     ),
                     new PopupMenuItem(
                       value: NavItems.Logout,
                       child: new Text('Logout'),
                     ),
                   ];
                 },
               ),
              ],
              title: new Text('G7 Home'),
            ),
            body: new Center(
              child: new Container(
                padding: new EdgeInsets.all(10.0),
                child: new TabBarView(
                    children: [
                      new Column(
                        //könnte durch Card ersetzt werden ?
                          children: <Widget>[
                            const Divider(
                              height: 1.0, 
                              color: Colors.black,
                            ), 
                            new ListTile(
                              leading: const CircleAvatar(
                                child: const Text('BO'), 
                                backgroundColor: Colors.red, 
                                foregroundColor: Colors.white,
                              ), 
                              title: const Text('BO Informatiker'), 
                              subtitle: const Text('Mitglieder: 52'),
                             //wenn man drauf klickt dann:
                              // onTap: ,
                            ), 
                            const Divider(
                              height: 1.0, 
                              color: Colors.black,
                            ), 
                            new ListTile(
                              leading: const CircleAvatar(
                                child: const Text('FA'), 
                                backgroundColor: Colors.red, 
                                foregroundColor: Colors.white,
                              ), 
                              title: const Text('Familie'), 
                              subtitle: const Text('Mitglieder: 4'),
                            ), 
                            const Divider(
                              height: 1.0, 
                              color: Colors.black,
                            ), 
                            new ListTile(
                              leading: const CircleAvatar(
                                child: const Text('G7'), 
                                backgroundColor: Colors.red, 
                                foregroundColor: Colors.white,
                              ), 
                              title: const Text('Group7'), 
                              subtitle: const Text('Mitglieder: 3'),
                            ), 
                            const Divider(
                              height: 1.0, 
                              color: Colors.black,
                            ),
                            new ListTile(
                              leading: const CircleAvatar(
                                child: const Text('+', textScaleFactor: 3.0,),
                                backgroundColor: Colors.transparent,
                                foregroundColor: Colors.black,
                                radius: 30.0,
                              ),
                              title:const Text('Neue Gruppe erstellen', textScaleFactor: 1.4,) ,

                            ),
                          ]
                      ),
                    ]
                ),
              ),
            ),
    ),
    ),
    );
  }
}
