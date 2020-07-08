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
  Color _favIconColor = Colors.white;
  @override
  Widget build(BuildContext context) {
    final Articles args = ModalRoute.of(context).settings.arguments;
    return Scaffold(
        body: CustomScrollView(
      slivers: <Widget>[
        SliverFixedExtentList(
          itemExtent: MediaQuery.of(context).size.height + 30,
          delegate: SliverChildListDelegate(
            [
              Container(
                margin: MediaQuery.of(context).padding,
                padding: EdgeInsets.only(left: 10, right: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                        width: MediaQuery.of(context).size.width - 20,
                        height: 300,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(args.urlToImage == null
                                    ? "https://www.salonlfc.com/wp-content/uploads/2018/01/image-not-found-scaled-1150x647.png"
                                    : args.urlToImage),
                                fit: BoxFit.fill,
                                alignment: Alignment.topCenter)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                            IconButton(
                                onPressed: () {
                                  setState(() {
                                    if (_favIconColor == Colors.white) {
                                      _favIconColor = Colors.red;
                                    } else {
                                      _favIconColor = Colors.white;
                                    }
                                  });
                                },
                                icon: Icon(
                                  Icons.favorite,
                                  size: 30,
                                  color: _favIconColor,
                                )),
                          ],
                        )),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      args.title,
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.justify,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Expanded(
                        child: Text(
                      args.content,
                      textAlign: TextAlign.justify,
                    ))
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    ));
  }
}
