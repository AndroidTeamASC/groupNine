import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import "package:news_api_flutter_project/model/News.dart";

class Home extends StatefulWidget {
  static const routeName = '/extractArguments';
  @override
  State<StatefulWidget> createState() {
    return _HomeSate();
  }
}

class _HomeSate extends State<Home> {
  static const TextStyle _textStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  @override
  Widget build(BuildContext context) {
    final News args = ModalRoute.of(context).settings.arguments;
    return Scaffold(
        body: Column(
      children: <Widget>[
        const SizedBox(
          height: 30,
        ),
        Text(
          "News",
          style: _textStyle,
        ),
      ],
    ));
  }
}
