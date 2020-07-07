import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Save extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SaveState();
  }
}

class _SaveState extends State<Save> {
  static const TextStyle _textStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          const SizedBox(
            height: 30,
          ),
          Text(
            "Saved News",
            style: _textStyle,
          )
        ],
      ),
    );
  }
}
