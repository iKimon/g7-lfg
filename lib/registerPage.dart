
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

import 'roundedButton.dart';
import 'login.dart';
//import 'functionsForFirebaseApiCalls.dart';


/* 
var httpClient = createHttpClient();
bool userexists=false;
UserData user1=new UserData();
const jsonCodec=const JsonCodec(reviver: _reviver); */



/* 
_reviver( key, value) {
  if(key!=null&& value is Map && key.contains('-')){
    return new UserData.fromJson(value);
  }
  return value;
} */

TextStyle textStyle = new TextStyle(
    color: const Color.fromRGBO(255, 255, 255, 0.4),
    fontSize: 16.0,
    fontWeight: FontWeight.bold
);


class RegisterPage extends StatefulWidget {
  @override
  RegisterState createState() => new RegisterState();
}


class RegisterState extends State<RegisterPage>{
  @override
  Widget build(BuildContext context)=>
      defaultTargetPlatform == TargetPlatform.iOS
          ? new CupertinoPageScaffold(child: new Signup()
        ,navigationBar: new CupertinoNavigationBar(middle: new Text("Sign-up"),backgroundColor:const Color.fromRGBO(0, 0, 0, 0.7),),
      )
          : new Scaffold(
        body: new Container(
          child:new Signup(),
        ),
      );
}


class Signup extends StatefulWidget {
  @override
  signupstate createState() => new signupstate();
}

class signupstate extends State<Signup>{

  final GlobalKey<ScaffoldState> _scaffoldKeySecondary = new GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> _formKeySeondary = new GlobalKey<FormState>();
  final GlobalKey<FormFieldState<String>> _passwordFieldKeySecondary = new GlobalKey<FormFieldState<String>>();

  bool _autovalidate1 = false;
  bool _formWasEdited = false;

  final IconData mail = const IconData(0xe158, fontFamily: 'MaterialIcons');
  final IconData lock_outline = const IconData(
      0xe899, fontFamily: 'MaterialIcons');
  final IconData signupicon=const IconData(0xe316, fontFamily: 'MaterialIcons');


  void showInSnackBar(String value) {
    _scaffoldKeySecondary.currentState.showSnackBar(
      new SnackBar(
        content: new Text(value)
      )
    );
  }

  _handleSubmitted1() async{
    final FormState form = _formKeySeondary.currentState;
    if (!form.validate()) {
      _autovalidate1 = true;
      showInSnackBar('Bitte die nötigen Felder bearbeiten.');
    } /* else {
      form.save();
      user1.location=null;
      user1.groupsIamin=[];
      users.add(user1);
      var userjson= jsonCodec.encode(user1);
      print("userjson:${userjson}");
      final Map usrmap=await getUsers();
      usrmap.forEach((k,v){
        if(v.EmailId==user1.EmailId){
          userexists=true;
        }
      });
      if(userexists==false){
        await httpClient.post('https://fir-trovami.firebaseio.com/users.json',body: userjson);
      } else {
        showInSnackBar('User already exits');
      }
      Navigator.of(context).pop();
    } */
  }

  String _validateName(String value) {
    _formWasEdited = true;
    if (value.isEmpty)
      return 'Pflichtfeld.';
    final RegExp nameExp = new RegExp(r'^\w+@[a-zA-Z_]+?\.[a-zA-Z]{2,3}$');
    if (!nameExp.hasMatch(value))
      return 'Bitte eine korrekte Email-Adresse angeben.';
    return null;
  }


  String _validatePassword(String value) {
    _formWasEdited = true;
    final FormFieldState<String> passwordField1 = _passwordFieldKeySecondary.currentState;
    if (passwordField1.value == null || passwordField1.value.isEmpty)
      return 'Pflichtfeld.';
    if (passwordField1.value != value)
      return 'Passwörter stimmen nicht überein.';
    return null;
  }


  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return new Scaffold(
      key: _scaffoldKeySecondary,
      body: new Container(
        child:new Form(
          key: _formKeySeondary,
          autovalidate: _autovalidate1,
          child: new ListView(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            children: <Widget>[
              new Container(
                child: new TextFormField(
                  decoration: new InputDecoration(
                    hintText: 'Name',
                    labelText: 'Name',
                    icon: new Icon(Icons.person),
                    labelStyle: textStyle
                  ),
   //               onSaved: (String value) { user1.name = value; },
                ) ,
                padding: const EdgeInsets.only( bottom:15.0, top:0.0,right: 20.0 ),
              ),
              new Container(
                child: new Container(
                  child: new TextFormField(
                    decoration: new InputDecoration(
                      icon: new Icon(mail),
                      hintText: 'E-Mail',
                      labelText: 'E-Mail',
                    ),
        //            onSaved: (String value) { user1.EmailId = value; },
                    validator: _validateName,
                  ),
                  padding: const EdgeInsets.only( bottom:15.0, top:0.0,right: 20.0 ),
                ),
                padding: const EdgeInsets.only(top:10.0),
              ),
              new Container(
                child: new Container(
                  child: new TextFormField(
                    key: _passwordFieldKeySecondary,
                    decoration: new InputDecoration(
                      hintText: 'Passwort angeben',
                      labelText: 'Passwort *',
                      icon: new Icon(lock_outline),
                    ),
                     obscureText: true,
//                    onSaved: (String value) { user1.password=value;
//                    }, 
                  ),
                  padding: const EdgeInsets.only( bottom:15.0, top:0.0,right: 20.0 ),
                ),
                padding: const EdgeInsets.only(top:10.0),
              ),
              new Container(
                child: new Container(
                  child:new TextFormField(
                    decoration: new InputDecoration(
                      hintText: 'Passwort wiederholen',
                      labelText: 'Passwort wiederholen *',
                      icon: new Icon(lock_outline),
                    ),
                    obscureText: true,
                    validator: _validatePassword,
                  ),
                  padding: const EdgeInsets.only( bottom:15.0, top:0.0,right: 20.0 ),
                ),
                padding: const EdgeInsets.only(top:10.0),
              ),
              new RoundedButton(
                buttonName: 'Registrieren',
                onTap: _handleSubmitted1,
                width: screenSize.width,
                height: 50.0,
                bottomMargin: 10.0,
                borderWidth: 0.0,
                buttonColor: Colors.transparent,
              ),
              new Container(
                padding: const EdgeInsets.only(top: 20.0),
                child: new Text('* Pflichtfelder', style: Theme.of(context).textTheme.caption),
              ),
            ],
          ),
        ),
        padding: const EdgeInsets.only(top:50.0),
      ),
      backgroundColor: const Color.fromRGBO(0, 0, 0, 0.2),
    );
  }
}
