 import 'package:flutter/material.dart';
import 'home.dart';
import 'login.dart';

class RegisterPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text('Registrieren'),
        backgroundColor: Colors.red[800],
      ),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            new Container(
              padding: new EdgeInsets.symmetric(horizontal: 22.0 ,vertical: 10.0),
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
                  new MaterialPageRoute(builder: (context) => new Login()),
                );
                },
            ),
            new Container(
              padding: new EdgeInsets.symmetric(vertical: 10.0, horizontal: 60.0 ),
              child: new Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new FlatButton(
                    child: new Text('Registrieren'),
                    textColor: Colors.black,
                    onPressed: (){
                      Navigator.push(context,
                          new MaterialPageRoute(builder: (context) => new Login()));
                      },
                  ),
                ],
              ),
            ),
            new Image.asset("assets/images/G7-Weltkugel.png", fit: BoxFit.scaleDown,scale:  40.0, )
          ]
        ),
      ),
    );
  }
} 