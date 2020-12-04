import 'package:flutter/material.dart';

class NutritionPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => new _NutritionPageState();
}

class _NutritionPageState  extends State<NutritionPage>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Page nutrition'),
      ),
    );
  }
}