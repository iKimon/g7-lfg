import 'dart:async';

import 'package:flutter/material.dart';
import 'package:map_view/map_view.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;

///This API Key will be used for both the interactive maps as well as the static maps.
///Make sure that you have enabled the following APIs in the Google API Console (https://console.developers.google.com/apis)
/// - Static Maps API
/// - Android Maps API
/// - iOS Maps API
var API_KEY = "AIzaSyC5d5Mc6xkc-uBGHPWKUxCJ4EmgHgi6fL0";

void main() {
  MapView.setApiKey(API_KEY);
  runApp(new Map());
}

class Map extends StatefulWidget {
  @override
  _MapState createState() => new _MapState();
}

class _MapState extends State<Map> {
  MapView mapView = new MapView();
  CameraPosition cameraPosition;
  var compositeSubscription = new CompositeSubscription();
  var staticMapProvider = new StaticMapProvider(API_KEY);




  Uri staticMapUri;

  List<Marker> _markers = <Marker>[
/*     new Marker("1", "Work", 45.523970, -122.663081, color: Colors.blue),
    new Marker("2", "Nossa Familia Coffee", 45.528788, -122.684633), */
    new Marker("1", "HS Bochum", 51.447709, 7.270900, color: Colors.green),
    
  ];

  


  @override
  initState() {
    super.initState();
    cameraPosition = new CameraPosition(Locations.schule, 2.0);
    staticMapUri = staticMapProvider.getStaticUri(Locations.schule, 12,
        width: 600, height: 500, mapType: StaticMapViewType.roadmap);
  }

  @override
  Widget build(BuildContext context) {
 //   final Size screenSize = MediaQuery.of(context).size;
    return new MaterialApp(
      home: new Scaffold(
          appBar: new AppBar(
            title: new Text('Map'),
            backgroundColor: Colors.red[800],
          ),
          body: new Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              new Container(
                height: 350.0,
                child: new Stack(
                  children: <Widget>[
                    new Center(
                        child: new Container(
                      child: new Text(
                        "\n\n\nMap wird geladen..\n\n\n",
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
                  "Zum interagieren die Map berühren",
                  style: new TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
   //           new Container(
   //             padding: new EdgeInsets.only(top: 25.0),
   //             child: new Text(
   //                 "Kamera Position: \n\nLat: ${cameraPosition.center.latitude}\n\nLng:${cameraPosition.center.longitude}\n\nZoom: ${cameraPosition.zoom} \n\n"),
   //           ),
            ],
          )),
    );
  }

  showMap() {
    mapView.show(
        new MapOptions(
            mapViewType: MapViewType.normal,
            showUserLocation: true,
            initialCameraPosition: new CameraPosition(
               // new Location(45.5235258, -122.6732493), 14.0),
               new Location (51.447709, 7.270900), 14.0),
            title: "Aktuelle Positionen"),
       // toolbarActions: [new ToolbarAction("Close", 1)]
        );

    
    
    
    var sub = mapView.onMapReady.listen((_) {
      mapView.setMarkers(_markers);
     /*  mapView.addMarker(new Marker("3", "10 Barrel", 45.5259467, -122.687747,
          color: Colors.purple)); */
 //     mapView.zoomToFit(padding: 100); 
    });
    compositeSubscription.add(sub);

 /*    sub = mapView.onLocationUpdated
        .listen((location) => print("Location updated $location"));
    compositeSubscription.add(sub);

    sub = mapView.onTouchAnnotation
        .listen((annotation) => print("annotation tapped"));
    compositeSubscription.add(sub);

    

    sub = mapView.onCameraChanged.listen((cameraPosition) =>
        this.setState(() => this.cameraPosition = cameraPosition));
    compositeSubscription.add(sub); 

    sub = mapView.onInfoWindowTapped.listen((marker) {
      print("Info Window Tapped for ${marker.title}");
    });
    compositeSubscription.add(sub);
    
    
    sub = mapView.onMapTapped
      .listen((location) =>
        //print("Touched location $location")
       _tappedLocation(location.latitude,location.longitude)
      );
    compositeSubscription.add(sub); 

    sub = mapView.onToolbarAction.listen((id) {
      if (id == 1) {
        print("Schliessen");
        _handleDismiss();
      }
    });
    compositeSubscription.add(sub);*/
  sub = mapView.onLocationUpdated
        .listen((location) => 
          // print("Location updated $location") 
          _locationUpdate(location.latitude,location.longitude)
        );
    compositeSubscription.add(sub);



  }                                                                          // <---------- !!!!

_locationUpdate(latitude,longitude) async {
    
    print("Aktuelle Position: >$latitude, $longitude<");
     mapView.addMarker(new Marker("2", "Eigene Position", latitude, longitude, color: Colors.red));


     /* for(int i=5;i<8;i++){     // Funktioniert
      print("Testpins gesetzt $i");
      mapView.addMarker(new Marker(i.toString(), "Testpin $i", 51.447709+(i/1000), 7.270900, color: Colors.blue));
    }  */
                                         // #Datenbank
                                         // 
                                         // Hier brauchen wir eine for Schleife (ähnlich wie das auskommentierte), die von (am besten)
                                         // 5 losgeht und bis zum Ende der Mitgliederliste geht und dann pro User nach Namen, lat und lng fragt 
                                         //  also Pseudocodemäßig:
                                         // for(int i=5;i<MITGLIEDERLISTE.LÄNGE ;i++ ){
                                         //   mapView.addMarker(new Marker(i.toString(), "MITGLIEDSNAME", MITGLIED.LAT, MITGLIED.LNG, color.blue ))
                                         // }
                                         //
                                         // Zusätzlich sollten wir hier die lat und lng des aktuellen Users übergeben, dafür kannst du einfach
                                         // die übergebenen Variablen "latitude" und "longitude" benutzen und die in die Datenbank schieben
                                         //
                                         // Beim ausprobieren nicht wundern, die Marker werden erst gesetzt, sobald sich die eigene Position einmal geändert hat

  }

  _tappedLocation(latitude, longitude) async {
    print("Inhalt: >$latitude, $longitude<");
    mapView.addMarker(new Marker("3", "HS Bochum", latitude, longitude, color: Colors.blue));
  }

  /* _handleDismiss() async {
     double zoomLevel = await mapView.zoomLevel;      //Funktioniert halt absolut nicht
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
  } */
}                                                                           // <---------- !!!!

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