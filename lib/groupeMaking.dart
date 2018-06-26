import 'package:flutter/material.dart';
import 'einladungen.dart';

class GroupMaking extends StatefulWidget{
  @override
  _GroupMaking createState() => new _GroupMaking();
}
class _GroupMaking extends State<GroupMaking>{
  bool anzahl = true;
  bool passwort = true;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Neue Gruppe Erstellen'),
        backgroundColor: Colors.red[800],
      ),
      body: new Center(
        child: new Container(
          padding: const EdgeInsets.all(20.0),
          child: new ListView(
          children: <Widget>[
            new Column(
              children: <Widget>[
                new Column(
                  children: <Widget>[
                    new TextFormField(
                      decoration: new InputDecoration(
                          labelText: 'Name der Gruppe:',
                          labelStyle: new TextStyle(color: Colors.black),
                          contentPadding: const EdgeInsets.symmetric(vertical: 30.0,horizontal: 2.0)),
                    ),
                    new Divider(
                      color: Colors.transparent,
                      height: 40.0,
                    ),
                    new TextFormField(
                      decoration: new InputDecoration(
                          labelText: 'Anzahl der Mitglieder:',
                          labelStyle: new TextStyle(color: Colors.black),
                          contentPadding: const EdgeInsets.symmetric(vertical: 30.0,horizontal: 2.0)),
                    ),
                    new Row(
                      children: <Widget>[
                        new Text('Begrenzte Mitglieder Anzahl?', style: new TextStyle(color: Colors.black),),
                        new Switch(
                          value: anzahl, activeColor: Colors.red ,onChanged: (bool newValue2){
                          anzahl = newValue2;
                        },),
                      ],
                    ),
                  ],
                ),
                new Divider(
                  color: Colors.transparent,
                  height: 40.0,
                ),
                new Column(
                  children: <Widget>[
                    new TextFormField(
                      obscureText: true,
                      decoration: new InputDecoration(
                        labelText: 'Passwort',
                        labelStyle: new TextStyle(color: Colors.black),

                      ),
                    ),
                    new Row(
                      children: <Widget>[
                        new Checkbox(
                          value: passwort,
                          onChanged: (bool newValue){
                            setState(() {
                              passwort = newValue;
                            });
                          },
                          activeColor: Colors.red,
                        ),
                        new Text('Passwortgeschützt'),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            new Divider(
              color: Colors.transparent,
              height: 60.0,
            ),

            new RaisedButton(
              onPressed: (){
                Navigator.push(
                  context,
                  new MaterialPageRoute(builder: (context) => new Einladung()),
                );
              },
              textColor: Colors.white,
              color: Colors.red[800],
              child: new ListTile(
                leading: new Icon(Icons.mail_outline,color: Colors.white,),
                title: new Text('Einladung verschicken', style: new TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
          )
        ),
      ),
    );
  }

}