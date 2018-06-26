import 'package:flutter/material.dart';
//import 'package:flutter/services.dart';
import 'inputTextField.dart';
import 'roundedButton.dart';
import 'home.dart';
import 'registerPage.dart';



//final googleSignIn = new GoogleSignIn();
String loggedinUser;
var loggedInUsername;
final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

TextStyle textStyle = new TextStyle(
    color: const Color.fromRGBO(255, 255, 255, 0.4),
    fontSize: 16.0,
    fontWeight: FontWeight.normal);



Color textFieldColor = const Color.fromRGBO(50, 50, 50, 0.5);
ScrollController scrollController = new ScrollController();


class Login extends StatefulWidget {

  @override
  LoginForm createState() => new LoginForm();
}



class LoginForm extends State<Login> with SingleTickerProviderStateMixin{
 
  bool _first=true;


  final IconData mail = const IconData(0xe158, fontFamily: 'MaterialIcons');
  final IconData lock_outline = const IconData(0xe899, fontFamily: 'MaterialIcons');
  final IconData signinicon=const IconData(0xe315, fontFamily: 'MaterialIcons');
  final IconData signupicon=const IconData(0xe316, fontFamily: 'MaterialIcons');
  bool _autovalidate = false;
  bool _formWasEdited = false;
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  final GlobalKey<FormFieldState<String>> _passwordFieldKey = new GlobalKey<FormFieldState<String>>();
  Animation<Color> animation;
  AnimationController controller;







   void showInSnackBar(String value) {
    _scaffoldKey.currentState.showSnackBar(new SnackBar(
        content: new Text(value)
    ));
  } 


/*   _ensureLoggedIn() async {
    GoogleSignInAccount user = googleSignIn.currentUser;
      user ??= await googleSignIn.signInSilently();
    if (user == null) {
      await googleSignIn.signIn();
    }
  } */
  _handleSubmitted1() async {
    setState(() {
        /* _isgooglesigincomplete = false; */

    });
/*     await _ensureLoggedIn();
    GoogleSignInAccount user = googleSignIn.currentUser;
    UserData guser=new UserData();
    guser.EmailId=user.email;
    guser.name=user.displayName;
    guser.locationShare=false;
    final String guserjson=jsonCodec.encode(guser);
    final Map usrmap=await getUsers();
    usrmap.forEach((k,v){
      if(v.EmailId==user.email){
        userexists=true;
        loggedinUser=user.email;
        loggedInUsername=user.displayName;
        Navigator.of(context).pushReplacementNamed('/b');
      }
    });
    if(userexists==false){
      await httpClient.post('https://fir-trovami.firebaseio.com/users.json',body: guserjson);
      loggedinUser=user.email;
      loggedInUsername=user.displayName;
      await Navigator.of(context).pushReplacementNamed('/b');
    } */
  }

   _handleSubmitted() async {


    final FormState form = _formKey.currentState;
    if (!form.validate()) {
      _autovalidate = true;
       showInSnackBar('Bitte die nötigen Angaben machen.'); 
    } else {

 /*      form.save();
      final Map usrmap=await getUsers();
      usrmap.forEach(
        (k,v) async {
          if(logindet.EmailId==v.EmailId){
            loggedinUser=logindet.EmailId;
            loggedInUsername=v.name;
            await Navigator.of(context).pushReplacementNamed('/b');
          }
        }); */
      showInSnackBar(
          'Email oder Password sind inkorrekt. Bitte erneut versuchen.'
      );
    }
  }

  String _validateName(String value) {
    _formWasEdited = true;
    if (value.isEmpty)
      return 'Pflichtfeld.';
    final  nameExp = new RegExp(r'^\w+@[a-zA-Z_]+?\.[a-zA-Z]{2,3}$');
    if (!nameExp.hasMatch(value))
      return 'Bitte korrekte Email angeben.';
    return null;
  }

  String _validatePassword(String value) {
    _formWasEdited = true;
    final FormFieldState<String> passwordField = _passwordFieldKey.currentState;
    if (passwordField.value == null || passwordField.value.isEmpty)
      return 'Pflichtfeld.';
    if (passwordField.value != value)
      return 'Passwort nicht korrekt.';
    return null;
  }


  @override
  void initState() {
    controller = new AnimationController(
        duration: const Duration(seconds: 10), vsync: this);
    animation = new ColorTween(begin: Colors.red, end: Colors.red).animate(controller)
      ..addListener(() {
        setState(() {
        });
      });
//    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return new Scaffold(
      key: _scaffoldKey,
      body: new SingleChildScrollView(
        controller: scrollController,
        child:new Container(
        decoration: new BoxDecoration(
/*         image: new DecorationImage(
        image: new AssetImage('assets/images/G7-Weltkugel.png'),
          fit: BoxFit.fitHeight,
          alignment: Alignment.center,
        ), */
        ),
          child:new Column(
            children: <Widget>[
              new Container(
                height: screenSize.height /6,
                width: screenSize.width,
                child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new Container(
                      child:
                      new Text(
                        'Looking for Group',
                        textAlign: TextAlign.center,
                        style: new TextStyle(fontSize: 40.0),
                      ),
                    ),
                    
                  ],
                ),
              ),
              new Container(
                height: 100.0,
//                width: screenSize.width/6,
                child: new Image.asset("assets/images/G7-Weltkugel.png", fit: BoxFit.scaleDown,scale:  40.0,  ),
                padding: const EdgeInsets.only(bottom: 0.0),
              ),

              new Container(
              height: 5*screenSize.height /6,
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  
                  new Form(
                    key: _formKey,
                    autovalidate: _autovalidate,
                    child: new Column(
                      children: <Widget>[
                        new Container(
                          child: new InputField(
                            hintText: 'Email',
                            obscureText: false,
                            textInputType: TextInputType.text,
                            textStyle: textStyle,
                            hintStyle: textStyle,
                            textFieldColor: textFieldColor,
                            icon: Icons.mail_outline,
                            iconColor: const Color.fromRGBO(255, 255, 255, 0.4),
                            bottomMargin: 20.0,
                            width: screenSize.width-50,
                            validateFunction: _validateName,
                            onSaved: (String email) {
           //                   logindet.EmailId = email;
                            }
                          ),
                        ),
                        new InputField(
                          hintText: 'Passwort',
                          obscureText: true,
                          textInputType: TextInputType.text,
                          textStyle: textStyle,
                          hintStyle: textStyle,
                          textFieldColor: textFieldColor,
                          icon: Icons.lock_outline,
                          iconColor: Colors.white,
                          bottomMargin: 20.0,
                          width: screenSize.width-50,
                          onSaved: (String pass) {
        //                    logindet.password = pass;
                          }
                        ),
                      ],
                    ),
                  ),
                  new Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      new RoundedButton(
                        buttonName: 'Einloggen',
                        onTap: _handleSubmitted,
                        width: screenSize.width-50,
                        height: 50.0,
                        bottomMargin: 10.0,
                        borderWidth: 2.0,
                        buttonColor: const Color.fromRGBO(162, 32, 32, 0.5),
                      ),
                      new RoundedButton(
                        buttonName: 'Registrieren',
                        onTap: () {
                          Navigator.push(
                            context,
                              new MaterialPageRoute(builder: (context) => new RegisterPage()),
                           );
                          Navigator.of(context).pushNamed('/a');
                        },
                        highlightColor:const Color.fromRGBO(255, 255, 255, 0.1),
                        width: screenSize.width-50,
                        height: 50.0,
                        bottomMargin: 10.0,
                        borderWidth: 2.0,
                        buttonColor: const Color.fromRGBO(162, 32, 32, 0.5),
                      ),
                      new RoundedButton(
                        buttonName: 'Weiter ohne login',
                        onTap: () {
                          Navigator.push(
                            context,
                              new MaterialPageRoute(builder: (context) => new Home()),
                           );
                          Navigator.of(context).pushNamed('/a');
                        },
                        highlightColor:const Color.fromRGBO(255, 255, 255, 0.1),
                        width: screenSize.width-50,
                        height: 50.0,
                        bottomMargin: 10.0,
                        borderWidth: 2.0,
                        buttonColor: const Color.fromRGBO(162, 32, 32, 0.5),
                      ),
//                      new AnimatedCrossFade(
//                        duration: const Duration(seconds: 3),
//                        firstChild:
                      /*   (_isgooglesigincomplete
                            ? new FloatingActionButton(
                          child: new Image.asset('graphics/google-logo.jpg'),
                          onPressed: _handleSubmitted1,
                          backgroundColor: Colors.white,
                        ) : new FloatingActionButton(
                          child: new CircularProgressIndicator(valueColor: animation,),
                          onPressed: _handleSubmitted1,
                          backgroundColor: Colors.white,
                        )), */
//                        secondChild: _scaffoldkeyhomepage,
//                        crossFadeState: _first ? CrossFadeState.showFirst : CrossFadeState.showSecond,
//                      ),
                    ],
                  ),

                ],
              ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }



}