import 'dart:ui';
import 'package:applinutrition/screens/login_page.dart';
import 'package:flutter/material.dart';
import 'package:applinutrition/screens/accueil_page.dart';
import 'package:fluttertoast/fluttertoast.dart';

class InscriptionPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _InscriptionPageState();
}

class _InscriptionPageState extends State<InscriptionPage> {
  final _formKey = GlobalKey<FormState>();

  FocusNode _prenomFocus = FocusNode();
  FocusNode _nomFocus = FocusNode();
  FocusNode _emailFocus = FocusNode();
  FocusNode _passwordFocus = FocusNode();
  FocusNode _confirmPasswdFocus = FocusNode();


  String _prenom;
  String _nom;
  String _email;
  String _password;
  String _confirmPasswd;
  IconData _icon = Icons.visibility;
  bool _obscureText = true;

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
                      style: TextStyle(color: Colors.white, fontSize: 50.0),
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: TextFormField(
                          focusNode: _prenomFocus,
                          autofocus: true,
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            hintText: 'Prénom',
                          ),
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Prénom requis';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            _prenom = value;
                          },
                          onFieldSubmitted: (_) {
                            fieldFocusChange(context, _prenomFocus, _nomFocus);
                          },
                        ),
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      Expanded(
                        child: TextFormField(
                          focusNode: _nomFocus,
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            hintText: 'Nom',
                          ),
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Nom requis';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            _nom = value;
                          },
                          onFieldSubmitted: (_){
                            fieldFocusChange(context, _nomFocus, _emailFocus);
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
                    focusNode: _emailFocus,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                        hintText: 'Email',
                    ),
                    validator: (value) {
                      RegExp regexp = new RegExp(r'[\w-]+@([\w-]+\.)+[\w-]+');
                      if (value.isEmpty) {
                        return 'Email requis';
                      }
                      if (!regexp.hasMatch(value)) {
                        return 'email non valide';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _email = value;
                    },
                    onFieldSubmitted: (_){
                      fieldFocusChange(context, _emailFocus, _passwordFocus);
                    },
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
                    focusNode: _passwordFocus,
                    obscureText: _obscureText,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                        hintText: 'Mot de passe',
                        suffixIcon: IconButton(
                            icon: Icon(_icon, color: Colors.white,),
                            onPressed: (){
                              getObscureText();
                        }),
                    ),
                    validator: (value) {
                      RegExp regex =
                          new RegExp(r'^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}$');
                      if (value.isEmpty) {
                        return 'Mot de passe requis';
                      }
                      if (!regex.hasMatch(value)) {
                        return 'Le mot de passe doit contenir au moins 8 caractères, \nune majuscule, une minuscule et un chiffre';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _password = value;
                    },
                    onFieldSubmitted: (_){
                      fieldFocusChange(context, _passwordFocus, _confirmPasswdFocus);
                    },
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
                    focusNode: _confirmPasswdFocus,
                    obscureText: _obscureText,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                        hintText: 'Confirmation mot de passe',
                        suffixIcon: IconButton(
                            icon: Icon(_icon, color: Colors.white,),
                            onPressed: (){
                              getObscureText();
                        }),
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Mot de passe requis';
                      }
                      if (_password != _confirmPasswd) {
                        return 'mot de passe différent';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _confirmPasswd = value;
                    },
                  ),
                  SizedBox(
                    height: 40.0,
                  ),
                  RaisedButton(
                    padding: EdgeInsets.symmetric(horizontal: 100.0, vertical: 13.0),
                    color: Color(0xFFFF7E7E),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    textColor: Colors.white,
                    child: Text('Continuer'),
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        _formKey.currentState.save();
                        toastMessage("Bienvenue : $_prenom");
                        gotoAccueil(context);
                      }
                    },
                  ),
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

  void fieldFocusChange (BuildContext context, FocusNode currrentFocus, FocusNode nextFocus){
    currrentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  void toastMessage(String message){
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIos: 1,
        fontSize: 16.0,
    );
  }
}
