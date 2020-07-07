import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../model/News.dart';

class Detail extends StatefulWidget {
  static const detailRoute = '/detailArguments';
  @override
  State<StatefulWidget> createState() {
    return _DetailSate();
  }
}

class _DetailSate extends State<Detail> {
  @override
  Widget build(BuildContext context) {
    final Articles args = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            height: 300,
            child: (args.urlToImage == null)
                ? Image.network(
                    "https://www.salonlfc.com/wp-content/uploads/2018/01/image-not-found-scaled-1150x647.png",
                    fit: BoxFit.fill,
                  )
                : Image.network(args.urlToImage),
          ),
          Text(
            args.title,
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          Expanded(child: Text(args.description))
        ],
      ),
    );
  }
}
