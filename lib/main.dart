import 'package:flutter/material.dart';
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
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("")),
          BottomNavigationBarItem(icon: Icon(Icons.work), title: Text("")),
        ],
        selectedItemColor: Colors.blue,
        onTap: tapped,
      ),
    );
  }
}
