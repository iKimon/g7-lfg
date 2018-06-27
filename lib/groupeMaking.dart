import 'package:flutter/material.dart';
import 'einladungen.dart';
import 'gruppen.dart';


class GroupMaking extends StatefulWidget{
  final List<Gruppen> gruppen;
  GroupMaking({Key key, @required this.gruppen}):super(key:key);
  @override
  _GroupMaking createState() => new _GroupMaking(gruppen: gruppen);
}

class _GroupMaking extends State<GroupMaking>
{


  final List<Gruppen> gruppen;
  final formKey = GlobalKey<FormState>(debugLabel: 'inputText');
  String gruppenName = '2';
  String anzahl = '9';
  String password;
  _GroupMaking({Key key, @required this.gruppen});


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('Neue Gruppe Erstellen'),
          backgroundColor: Colors.red[800],
        ),
        body: ListView(
            children: <Widget>[
              Container(
                padding: const EdgeInsets.all(20.0),
                child: Form(
                  key: formKey,
                  child: Column(
                    children: <Widget>[
                      Divider(height: 10.0,),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Gruppen Name',
                        ),
                        validator: (val) => val.length <1 ? 'Zu kurz' :null,
                        onSaved: (val) => gruppenName = val,
                      ),
                      Divider(height: 20.0,),
                      TextFormField(
                        decoration: InputDecoration(labelText: 'Anzahl Mitglieder'),
                        validator: (val) => val.contains('@') ? 'nicht erlaubt': null,
                        onSaved: (val) => anzahl = val,
                      ),
                      Divider(height: 50.0,),
                      RaisedButton(
                        color: Colors.red[800],
                        splashColor: Colors.amber,
                        shape: RoundedRectangleBorder(side: BorderSide.none, borderRadius:  BorderRadius.circular(10.0)),
                        padding: const EdgeInsets.all(10.0),
                        child: new ListTile(
                          leading: new Icon(Icons.email, color: Colors.white,),
                          title: new Text('Einladung verschicken', style: new TextStyle(
                              color: Colors.white
                          ),
                          ),
                        ),
                        onPressed: (){
                          _submit();
                          gruppen.add(new Gruppen(gruppenName, anzahl));
                          Navigator.push(context, MaterialPageRoute(builder: (context) => Einladung(gruppen: gruppen,)));
                        },
                      ),

                    ],
                  ),
                ),
              )
            ]
        )
    );
  }


  void _submit(){
    final form = formKey.currentState;
    form.save();
    if(form.validate()) {
      form.save();
    }
  }
}