import 'dart:ui';

import 'package:applinutrition/screens/accueil_page.dart';
import 'package:applinutrition/screens/inscription_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  FocusNode _emailFocus = FocusNode();
  FocusNode _passwordFocus = FocusNode();

  String _email;
  String _password;
  bool _obscureText = true;
  IconData _icon = Icons.visibility;

  gotoInscription(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => InscriptionPage()));
  }

  gotoAccueil(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => AccueilPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  Color.fromRGBO(28, 159, 200, 76),
                  Color.fromRGBO(49, 207, 170, 100)
                ],
                begin: FractionalOffset.topCenter,
                end: FractionalOffset.bottomCenter,
                stops: [0.0, 1.0],
                tileMode: TileMode.clamp)),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.symmetric(vertical: 60.0),
                    child: Text(
                      'NutriFit',
                      style: TextStyle(fontSize: 50, color: Colors.white),
                    ),
                  ),
                  TextFormField(
                    focusNode: _emailFocus,
                    autofocus: true,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: 'Email',
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Email requis';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _email = value;
                    },
                    onFieldSubmitted: (_) {
                      fieldFocusChange(context, _emailFocus, _passwordFocus);
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    focusNode: _passwordFocus,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: 'Mot de passe',
                      suffixIcon: IconButton(
                          icon: Icon(_icon, color: Colors.white),
                          onPressed: () {
                            getObscureText();
                          }),
                    ),
                    obscureText: _obscureText,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Mot de passe requis';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _password = value;
                    },
                  ),
                  Container(
                    alignment: Alignment.centerRight,
                    child: FlatButton(
                      child: Text('mot de passe oublié ?',
                          style: TextStyle(color: Colors.white)),
                      onPressed: () {},
                    ),
                  ),
                  SizedBox(height: 10.0),
                  RaisedButton(
                    padding: EdgeInsets.only(
                        left: 100.0, top: 13.0, right: 100.0, bottom: 13.0),
                    textColor: Colors.white,
                    color: Color(0xFFFF7E7E),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    child: Text('Connexion'),
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        _formKey.currentState.save();
                        gotoAccueil(context);
                      }
                    },
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  RaisedButton(
                    padding: EdgeInsets.only(
                        left: 82.0, top: 13.0, right: 82.0, bottom: 13.0),
                    textColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        side: BorderSide(color: Colors.white)),
                    color: Colors.transparent,
                    elevation: 0.0,
                    child: Text('Créer un compte'),
                    onPressed: () {
                      gotoInscription(context);
                    },
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  SignInButton(Buttons.Google, onPressed: () {}),
                  SizedBox(height: 5.0),
                  SignInButton(Buttons.Facebook, onPressed: () {}),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  getObscureText() {
    setState(() {
      if (_obscureText == true) {
        _obscureText = false;
        _icon = Icons.visibility_off;
      } else {
        _obscureText = true;
        _icon = Icons.visibility;
      }
    });
  }

  void fieldFocusChange(
      BuildContext context, FocusNode currrentFocus, FocusNode nextFocus) {
    currrentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }
}
