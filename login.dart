import 'package:flutter/material.dart';
import 'home2.dart'; //durch 'home.dart' ersetzten wenn man den anderen Homescreen sehen will

class Login extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(

      appBar: new AppBar(
        title: new Text('Group7 login'),
        backgroundColor: Colors.red[800],

      ),
      body: new Center(
        child: new Column(
          children: <Widget>[
          new Container(
          // margin: const EdgeInsets.all(10.0),
          padding: const EdgeInsets.all(20.0),
          alignment: Alignment.center,
          child: new Column(
           mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              new TextFormField(
                decoration: new InputDecoration(labelText: 'E-Mail eingeben'),
                
              ),
             new TextFormField(
               obscureText: true,
               decoration: new InputDecoration(labelText: 'Passwort eingeben'),
              ),
            
             ],
            ),
          ),
          new RaisedButton(
            child: new Text('Login'),
            onPressed: (){
              Navigator.push(
                context,
                new MaterialPageRoute(builder: (context) => new Home()),
              );
            },
          ),
          new Container(
            margin: const EdgeInsets.all(10.0),
            padding: new EdgeInsets.symmetric(vertical: 10.0, horizontal: 60.0 ),
            child: new Row(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: <Widget>[
                new FlatButton(
                  child: new Text('Weiter ohne Login'),
                  textColor: Colors.black,
                  onPressed: (){
                    Navigator.push(
                      context,
                      new MaterialPageRoute(builder: (context) => new Home()),
                    );
                  },
                ),
                new FlatButton(
                  child: new Text('Registrieren'),
                  textColor: Colors.black,
                  onPressed: (){
                    Navigator.push(context,
                        new MaterialPageRoute(builder: (context) => new Home()));
                  },
                ),
              ],
            ),
          ),   
        ]

      ),
    ),
    );
  }
}
