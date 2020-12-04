import 'package:flutter/material.dart';
import 'package:applinutrition/screens/login_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Appli nutrition',
      theme: ThemeData(
        inputDecorationTheme: InputDecorationTheme(
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white, width: 0.5)),
          border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white, width: 0.5)),
          hintStyle: TextStyle(color: Colors.white),
        ),
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
    );
  }
}
