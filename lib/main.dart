import 'package:flutter/material.dart';
import 'package:news_api_flutter_project/fragment/Detail.dart';
import "fragment/Save.dart";
import "fragment/Home.dart";

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BottomNavigation(),
      routes: {Detail.detailRoute: (context) => Detail()},
    );
  }
}

class BottomNavigation extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _BottonNavState();
  }
}

class _BottonNavState extends State<BottomNavigation> {
  int index = 0;
  List<Widget> _widgets = [Home(), Save()];
  tapped(int tappedIndex) {
    setState(() {
      index = tappedIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgets[index],
      bottomNavigationBar: BottomNavigationBar(
        //key: _bottomkey,
        currentIndex: index,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text(
                "",
                style: TextStyle(fontSize: 0),
              )),
          BottomNavigationBarItem(
              icon: Icon(Icons.work),
              title: Text("", style: TextStyle(fontSize: 0))),
        ],
        selectedItemColor: Colors.blue,
        onTap: tapped,
      ),
    );
  }
}
