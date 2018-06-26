import 'dart:async';
import 'package:flutter/material.dart';
import 'home.dart';
import 'package:flutter/services.dart';
import 'package:location/location.dart';
//import 'package:map_view/map_view.dart';

//var API_KEY = "AIzaSyC5d5Mc6xkc-uBGHPWKUxCJ4EmgHgi6fL0";    // Kimons API Key
/*
      Für das Icon: https://github.com/franzsilva/flutter_launcher_icons

*/
void main() {
//  MapView.setApiKey(API_KEY);
  runApp(new MaterialApp(
    home: new SplashScreen(),
    routes: <String, WidgetBuilder>{
      '/HomeScreen': (BuildContext context) => new LocationMap()
    }, 
  ));
}

class SplashScreen extends StatefulWidget {
    @override
    _SplashScreenState createState() => new _SplashScreenState();
  }

  class _SplashScreenState extends State<SplashScreen> {
    startTime() async {
      var _duration = new Duration(seconds: 2);
      return new Timer(_duration, navigationPage);
    }

    void navigationPage() {
      Navigator.of(context).pushReplacementNamed('/HomeScreen');
    }

    @override
    void initState() {
      super.initState();
      startTime();
    }

    @override
    Widget build(BuildContext context) {
      return new Scaffold(
        body: new Center(
          child: new Image.asset('icon/icon.png'),
        ),
      );
  }
}
class LocationMap extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<LocationMap> {
/*   MapView mapView = new MapView();
  CameraPosition cameraPosition;
  var compositeSubscription = new CompositeSubscription();
  var staticMapProvider = new StaticMapProvider(API_KEY);
  Uri staticMapUri; */


  Map<String, double> _startLocation;
  Map<String, double> _currentLocation;

  StreamSubscription<Map<String, double>> _locationSubscription;

  Location _location = new Location();
  String error;

  bool currentWidget = true;

  Image image1;

  @override
  void initState() {
    super.initState();
    initPlatformState();

    _locationSubscription =
        _location.onLocationChanged.listen((Map<String,double> result) {
          setState(() {
            _currentLocation = result;
          });
        });
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  initPlatformState() async {
    Map<String, double> location;
    // Platform messages may fail, so we use a try/catch PlatformException.

    try {
      location = await _location.getLocation;

      error = null;
    } on PlatformException catch (e) {
      if (e.code == 'PERMISSION_DENIED') {
        error = 'Permission denied';
      } else if (e.code == 'PERMISSION_DENIED_NEVER_ASK') {
        error = 'Permission denied - please ask the user to enable it from the app settings';
      }

      location = null;
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    //if (!mounted) return;

    setState(() {
        _startLocation = location;
    });

  }

  @override
  Widget build(BuildContext context) {
    List<Widget> widgets;


    if (_currentLocation == null) {
      widgets = new List();
    } else {
      widgets = [
        new Image.network(
            "https://maps.googleapis.com/maps/api/staticmap?center=${_currentLocation["latitude"]},${_currentLocation["longitude"]}&zoom=18&size=640x400&key=AIzaSyC5d5Mc6xkc-uBGHPWKUxCJ4EmgHgi6fL0")
      ];
    }

    widgets.add(new Center(
        child: new Text(_startLocation != null
            ? 'Start location: $_startLocation\n'
            : 'Error: $error\n')));

    widgets.add(new Center(
        child: new Text(_currentLocation != null
            ? 'Continuous location: $_currentLocation\n'
            : 'Error: $error\n')));

    return new MaterialApp(
        home: new Scaffold(
            appBar: new AppBar(
              title: new Text('Aktuelle Position'),
            ),
            body: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: widgets,
            )));
  }
}