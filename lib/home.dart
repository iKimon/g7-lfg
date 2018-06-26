import 'package:flutter/material.dart';
import 'groupeMaking.dart';
import 'einladungen.dart';
import 'chat.dart';
import 'dart:async';
import 'package:map_view/map_view.dart';
import 'roundedButton.dart';
import 'locationMap.dart';
//import 'package:location/location.dart';

var API_KEY = "AIzaSyC5d5Mc6xkc-uBGHPWKUxCJ4EmgHgi6fL0";

class Home extends StatefulWidget{
  @override
  _HomeBar createState() => new _HomeBar();
}

enum NavItems{
  Einstellungen,
  Logout
}

class _HomeBar extends State<Home>{
  MapView mapView = new MapView();
  CameraPosition cameraPosition;
  var compositeSubscription = new CompositeSubscription();
  var staticMapProvider = new StaticMapProvider(API_KEY);
  Uri staticMapUri;

  List<Marker> _markers = <Marker>[
    new Marker("1", "Schule", 51.447709, 7.270900, color: Colors.blue),     // Funktioniert nicht?
    new Marker("2", "Nossa Familia Coffee", 45.528788, -122.684633),
  ];

  @override
  initState() {
    super.initState();
    cameraPosition = new CameraPosition(Locations.schule, 2.0);       // "schule" hardcoded in Locations.dart
    staticMapUri = staticMapProvider.getStaticUri(Locations.schule, 12,   //   static Location schule = new Location(51.447709, 7.270900);
        width: 900, height: 400, mapType: StaticMapViewType.roadmap);
  }

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
              title: new Text('Home'),
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
            ),
            body: new Center(
              child: new Container(
                padding: new EdgeInsets.all(10.0),
                child: new TabBarView(
                    children: [
                      new ListView(children: <Widget>[
                        new Column(
                            children: <Widget>[
                              new Row(
                                verticalDirection: VerticalDirection.down,
                                children: <Widget>[
                                  new CircleAvatar(
                                    child: const Text('BO'),
                                    backgroundColor: Colors.red,
                                    foregroundColor: Colors.white,
                                  ),
                                  new SizedBox(
                                    height: 70.0,
                                    width: 300.0,
                                    child: new Card(
                                      color: Colors.red[800],
                                      margin: const EdgeInsets.all(10.0),
                                      child: new Center(
                                        child: new ListTile(
                                          title: const Text('BO Informatiker', style: const TextStyle(color: Colors.white)),
                                          subtitle: const Text('Mitglieder: 52',style: const TextStyle(color: Colors.white)),
                                          onTap: (){
                                            Navigator.push(context,new MaterialPageRoute(builder: (context) => new FriendlychatApp()) );
                                          },
                                          //wenn man drauf klickt dann:
                                          // onTap: ,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              new Row(
                                children: <Widget>[
                                  new CircleAvatar(
                                    child: const Text('G7'),
                                    backgroundColor: Colors.red,
                                    foregroundColor: Colors.white,
                                  ),
                                  new SizedBox(
                                    height: 70.0,
                                    width: 300.0,
                                    child: new Card(
                                      color: Colors.red[800],
                                      margin: const EdgeInsets.all(10.0),
                                      child: new Center(
                                        child: new ListTile(
                                          title: const Text('Group7', style: const TextStyle(color: Colors.white)),
                                          subtitle: const Text('Mitglieder: 3',style: const TextStyle(color: Colors.white)),
                                          //wenn man drauf klickt dann:
                                          // onTap: ,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              new Row(
                                children: <Widget>[
                                  new CircleAvatar(
                                    child: const Text('FA'),
                                    backgroundColor: Colors.red,
                                    foregroundColor: Colors.white,
                                  ),
                                  new SizedBox(
                                    height: 70.0,
                                    width: 300.0,
                                    child: new Card(
                                      color: Colors.red[800],
                                      margin: const EdgeInsets.all(10.0),
                                      child: new Center(
                                        child: new ListTile(
                                          title: const Text('Familie', style: const TextStyle(color: Colors.white)),
                                          subtitle: const Text('Mitglieder: 4',style: const TextStyle(color: Colors.white)),
                                          //wenn man drauf klickt dann:
                                          // onTap: ,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              new Row(
                                children: <Widget>[
                                  new CircleAvatar(
                                    child: const Icon(Icons.add, color: Colors.red,),
                                    backgroundColor: Colors.transparent,
                                    radius: 30.0,
                                  ),
                                  new SizedBox(
                                    height: 64.0,
                                    width: 256.0,
                                    child: new Card(
                                      color: Colors.white,
                                      margin: const EdgeInsets.all(10.0),
                                      child: new Center(
                                        child: new ListTile(
                                          title:const Text('Neue Gruppe erstellen',
                                            style: const TextStyle(color: Colors.red),
                                          ),
                                          onTap: (){
                                            Navigator.push(context, new MaterialPageRoute(builder: (context) => new GroupMaking()));
                                          },
                                          // onTap: ,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ]
                        ),
                      ],
                      ),
                      new ListView(
                        children: <Widget>[
                          new Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              new Container(
                                height: 250.0,
                                child: new Stack(
                                  children: <Widget>[
                                    new Center(
                                        child: new Container(
                                          child: new Text(
                                            "You are supposed to see a map here.\n\nAPI Key is not valid.\n\n"
                                                "To view maps in the example application set the "
                                                "API_KEY variable in example/lib/main.dart. "
                                                "\n\nIf you have set an API Key but you still see this text "
                                                "make sure you have enabled all of the correct APIs "
                                                "in the Google API Console. See README for more detail.",
                                            textAlign: TextAlign.center,
                                          ),
                                          padding: const EdgeInsets.all(20.0),
                                        )),
                                    new InkWell(
                                      child: new Center(
                                        child: new Image.network(staticMapUri.toString()),
                                      ),
                                      onTap: showMap,
                                    )
                                  ],
                                ),
                              ),
                              new Container(
                                padding: new EdgeInsets.only(top: 10.0),
                                child: new Text(
                                  "Tap the map to interact",
                                  style: new TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                              
                              new Container(
                                child: new RoundedButton(
                                  buttonName: 'Neue Map',
                                  height: 50.0,
                                  bottomMargin: 10.0,
                                  borderWidth: 2.0,
                                  buttonColor: const Color.fromRGBO(162, 32, 32, 0.8),
                                   onTap: () {
                                    Navigator.push(
                                    context,
                                    new MaterialPageRoute(builder: (context) => new LocationMap()),
                                   );
                                   },
                                ),
                              ),
                            ],
                          )
                        ],
                      )
                    ]
                ),
              ),
            ),
    ),
    ),
    );
  }

  showMap() {
    mapView.show(
        new MapOptions(
            mapViewType: MapViewType.normal,
            showUserLocation: true,
            initialCameraPosition: new CameraPosition(
                new Location(51.447709, 7.270900), 14.0),
            title: "Recently Visited"),
        toolbarActions: [new ToolbarAction("Close", 1)]);

    var sub = mapView.onMapReady.listen((_) {
      mapView.setMarkers(_markers);
      mapView.addMarker(new Marker("3", "10 Barrel", 45.5259467, -122.687747,
          color: Colors.purple));
      mapView.zoomToFit(padding: 100);
    });
    compositeSubscription.add(sub);

    sub = mapView.onLocationUpdated
        .listen((location) => print("Location updated $location"));
    compositeSubscription.add(sub);

    sub = mapView.onTouchAnnotation
        .listen((annotation) => print("annotation tapped"));
    compositeSubscription.add(sub);

    sub = mapView.onMapTapped
        .listen((location) => print("Touched location $location"));
    compositeSubscription.add(sub);

    sub = mapView.onCameraChanged.listen((cameraPosition) =>
        this.setState(() => this.cameraPosition = cameraPosition));
    compositeSubscription.add(sub);

    sub = mapView.onToolbarAction.listen((id) {
      if (id == 1) {
        _handleDismiss();
      }
    });
    compositeSubscription.add(sub);

    sub = mapView.onInfoWindowTapped.listen((marker) {
      print("Info Window Tapped for ${marker.title}");
    });
    compositeSubscription.add(sub);
  }

  _handleDismiss() async {
    double zoomLevel = await mapView.zoomLevel;
    Location centerLocation = await mapView.centerLocation;
    List<Marker> visibleAnnotations = await mapView.visibleAnnotations;
    print("Zoom Level: $zoomLevel");
    print("Center: $centerLocation");
    print("Visible Annotation Count: ${visibleAnnotations.length}");
    var uri = await staticMapProvider.getImageUriFromMap(mapView,
        width: 900, height: 400);
    setState(() => staticMapUri = uri);
    mapView.dismiss();
    compositeSubscription.cancel();
  }
}

class CompositeSubscription {
  Set<StreamSubscription> _subscriptions = new Set();

  void cancel() {
    for (var n in this._subscriptions) {
      n.cancel();
    }
    this._subscriptions = new Set();
  }

  void add(StreamSubscription subscription) {
    this._subscriptions.add(subscription);
  }

  void addAll(Iterable<StreamSubscription> subs) {
    _subscriptions.addAll(subs);
  }

  bool remove(StreamSubscription subscription) {
    return this._subscriptions.remove(subscription);
  }

  bool contains(StreamSubscription subscription) {
    return this._subscriptions.contains(subscription);
  }

  List<StreamSubscription> toList() {
    return this._subscriptions.toList();
  }
}



