import 'package:flutter/material.dart';
import 'groupeMaking.dart';
import 'einladungen.dart';
import 'chat.dart';
import 'dart:async';
import 'package:map_view/map_view.dart';
import 'roundedButton.dart';
import 'locationMap.dart';
import 'gruppen.dart';
import 'groupScreen.dart';


class Home extends StatefulWidget{
  final List<Gruppen> gruppen;
  Home({Key key, @required this.gruppen}) : super(key:key);
  @override
  _HomeBar createState() => new _HomeBar(gruppen: gruppen);
}

enum NavItems{
  Einstellungen,
  Logout
}

class _HomeBar extends State<Home>{
  final List<Gruppen> gruppen;
  _HomeBar({Key key, @required this.gruppen});



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
      debugShowCheckedModeBanner: false,
      home: new DefaultTabController(
          length: 4,
          child: new Scaffold(
            floatingActionButton: new FloatingActionButton(
              child: new Icon(Icons.add),
              backgroundColor: Colors.black,
              foregroundColor: Colors.white,
              onPressed: (){
                Navigator.push(context, new MaterialPageRoute(builder: (context) => new GroupMaking(gruppen: gruppen,)));
              },
            ),
            appBar: new AppBar(
              backgroundColor: Colors.red[800],
              title: new Text('Home'),
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
            ),
            body: new Center(
              child: new Container(
                padding: new EdgeInsets.all(10.0),
                child: ListView.builder(
                        itemCount: gruppen.length,
                        addAutomaticKeepAlives: true,
                        itemBuilder: (context, index) {
                          return new Container(
                            child: Card(
                                color: Colors.red[800],
                                child: ListTile(
                                  leading: const Icon(Icons.person, color: Colors.white,),
                                  title: Text(gruppen[index].name + '$index', style: new TextStyle(color: Colors.white),),
                                  subtitle: Text(gruppen[index].member,style: new TextStyle(color: Colors.white)),
                                  onTap: () {
                                   Navigator.push(context, new MaterialPageRoute(builder: (context) => GroupScreen(gruppe: gruppen[index],gruppen: gruppen,)),
                                  );
                                  },
                                )
                            ),
                          );
                        }
                    ),



              ),
            ),
    ),
    ),
    );
  }


}



