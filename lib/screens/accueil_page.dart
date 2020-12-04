import 'package:applinutrition/screens/entrainement_page.dart';
import 'package:applinutrition/screens/nutrition_page.dart';
import 'package:applinutrition/screens/profil_page.dart';
import 'package:flutter/material.dart';

class AccueilPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _AccueilPageState();
}

class _AccueilPageState extends State<AccueilPage> {

  int _currentIndex = 0;

  var _leading;
  var _title;
  var _actions;

  List<Widget> _widgetOptions = <Widget>[
    Text('Page accueil'),
    EntrainementPage(),
    NutritionPage(),
    ProfilPage(),
  ];

  _onTap(int index) {
    setState(() {
      _currentIndex = index;
    });
    if(index == 0){
      accueilAppBar();
    }
    if(index == 1){
      entrainementAppBar();
    }
    if(index == 2 ){
      nutritionAppBar();
    }
    if (index == 3){
      profilAppBar();
    }
  }

  @override
  Widget build(BuildContext context) {
    _onTap(_currentIndex);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: _leading,
        backgroundColor: Color(0xff31CFAA),
        title: _title,

        actions: <Widget>[
          _actions,
        ],

      ),
      body: Center(
        child: _widgetOptions.elementAt(_currentIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Color(0xff31CFAA),
        selectedItemColor: Colors.white,
        unselectedItemColor: Color(0xaaFFFFFF),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Accueil'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.phone_paused),
            title: Text('Entraînement'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.ac_unit),
            title: Text('Nutrition'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: Text('Profil'),
          ),
        ],
        onTap: (index) {
          _onTap(index);
        },
      ),
    );
  }


  entrainementAppBar(){
    _leading = Icon(null);
    _title = Container(
      height: 35,
      width: 200,
      child: TextField(
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
          contentPadding:
          EdgeInsets.symmetric(vertical: 0.1, horizontal: 10),
          filled: true,
          fillColor: Color(0xffffffff).withOpacity(0.45),
          hintText: "Rechercher",
          suffixIcon: Icon(
            Icons.search,
            color: Colors.white,
          ),
        ),
      ),
    );
    _actions = IconButton(icon: Icon(Icons.filter), onPressed: () {});
  }

  accueilAppBar(){
    _leading = Icon(null);
    _title = Text('Accueil');
    _actions = IconButton(icon: Icon(Icons.settings), onPressed: (){});
  }

  nutritionAppBar(){
    _leading = Icon(Icons.queue);
    _title = Container(
      height: 35,
      width: 200,
      child: TextField(
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
          contentPadding:
          EdgeInsets.symmetric(vertical: 0.1, horizontal: 10),
          filled: true,
          fillColor: Color(0xffffffff).withOpacity(0.45),
          hintText: "Rechercher",
          suffixIcon: Icon(
            Icons.search,
            color: Colors.white,
          ),
        ),
      ),
    );
    _actions = IconButton(icon: Icon(Icons.format_list_numbered), onPressed: (){});
  }

  profilAppBar(){
    _leading = Icon(null);
    _title = Text('Profil');
    _actions = IconButton(icon: Icon(Icons.settings), onPressed: (){});
  }
}
