import 'package:flutter/material.dart';
import 'home2.dart';

class Login extends StatelessWidget{
  
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(

      appBar: new AppBar(
        title: new Text('Login'),
        backgroundColor: Colors.red[800],

      ),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
          new Container(
          // margin: const EdgeInsets.all(10.0),
         // padding: const EdgeInsets.all(20.0),
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
                new MaterialPageRoute(builder: (context) => new Home()),
              );
            },
          ),
          new Container(
          //  margin: const EdgeInsets.all(10.0),
            padding: new EdgeInsets.symmetric(vertical: 10.0, horizontal: 60.0 ),
            child: new Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,

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
            //dazu muss noch in der pubspec.yaml bei assets der pfad eingefügt werden und natürlich ein Ordner mit dem Bild erstellt werden 
          new Image.asset("assets/images/G7-Weltkugel.png", fit: BoxFit.scaleDown,scale:  40.0, )
        ]

      ),
    ),
    );
  }
}
  

