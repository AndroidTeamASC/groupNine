import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:news_api_flutter_project/fragment/Detail.dart';
import "package:news_api_flutter_project/model/News.dart";

import '../model/News.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeSate();
  }
}

class _HomeSate extends State<Home> {
  Color _favIconColor = Colors.white;
  var topratedUrl =
      "http://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=6949b1ad894d427cb7407699f7848b15";
  var everythingUrl =
      'http://newsapi.org/v2/everything?q=bitcoin&from=2020-06-08&sortBy=publishedAt&apiKey=6949b1ad894d427cb7407699f7848b15&pageSize=5';

  News _everythingNews;
  News _topratedNews;

  @override
  void initState() {
    super.initState();
    topfetchData();
    everythingfetchData();
  }

  topfetchData() async {
    var data2 = await http.get(topratedUrl);
    var jsonData2 = jsonDecode(data2.body);
    _topratedNews = News.fromJson(jsonData2);
    setState(() {});
  }

  everythingfetchData() async {
    // print(everythingUrl);
    var data = await http.get(everythingUrl);
    var jsonData = jsonDecode(data.body);
    _everythingNews = News.fromJson(jsonData);
    setState(() {});
  }

  static const TextStyle _textStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: (_everythingNews == null || _topratedNews == null)
            ? Center(
                child: CircularProgressIndicator(),
              )
            : SingleChildScrollView(
                physics: ScrollPhysics(),
                child: Container(
                  margin: MediaQuery.of(context).padding,
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "News",
                        style: _textStyle,
                      ),
                      Column(
                        children: <Widget>[
                          SizedBox(
                              height: 200,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: _topratedNews.articles.length,
                                itemBuilder: (context, index) {
                                  return InkWell(
                                    onTap: () {
                                      Navigator.pushNamed(
                                          context, Detail.detailRoute,
                                          arguments:
                                              _topratedNews.articles[index]);
                                    },
                                    borderRadius: BorderRadius.circular(10),
                                    child: Container(
                                      margin: EdgeInsets.all(2),
                                      width: MediaQuery.of(context).size.width -
                                          22,
                                      height: 200,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        image: DecorationImage(
                                            image: NetworkImage(_topratedNews
                                                        .articles[index]
                                                        .urlToImage ==
                                                    null
                                                ? "https://www.salonlfc.com/wp-content/uploads/2018/01/image-not-found-scaled-1150x647.png"
                                                : _topratedNews.articles[index]
                                                    .urlToImage),
                                            fit: BoxFit.fill,
                                            alignment: Alignment.topCenter),
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          IconButton(
                                              onPressed: () {
                                                setState(() {
                                                  if (_favIconColor ==
                                                      Colors.white) {
                                                    _favIconColor = Colors.red;
                                                  } else {
                                                    _favIconColor =
                                                        Colors.white;
                                                  }
                                                });
                                              },
                                              icon: Icon(
                                                Icons.favorite,
                                                size: 30,
                                                color: _favIconColor,
                                              )),
                                          Container(
                                              padding: EdgeInsets.all(4),
                                              color: Colors.white60,
                                              child: Text(
                                                _topratedNews
                                                    .articles[index].title,
                                                textAlign: TextAlign.justify,
                                              ))
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              )),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text("Popular",
                                  style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold)),
                              RaisedButton(
                                onPressed: () {
                                  everythingUrl =
                                      'http://newsapi.org/v2/everything?q=bitcoin&from=2020-06-08&sortBy=publishedAt&apiKey=6949b1ad894d427cb7407699f7848b15&pageSize=20';
                                  everythingfetchData();
                                },
                                child: Text(
                                  "see all",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                                color: Colors.red,
                              )
                            ],
                          ),
                          Container(
                            child: ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: _everythingNews.articles.length,
                              itemBuilder: (context, index) {
                                return Container(
                                  width: 300,
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.pushNamed(
                                          context, Detail.detailRoute,
                                          arguments:
                                              _everythingNews.articles[index]);
                                    },
                                    child: Card(
                                      child: Row(
                                        children: <Widget>[
                                          Container(
                                            width: 100,
                                            height: 100,
                                            child: (_everythingNews
                                                        .articles[index]
                                                        .urlToImage ==
                                                    null)
                                                ? Image.network(
                                                    "https://www.salonlfc.com/wp-content/uploads/2018/01/image-not-found-scaled-1150x647.png",
                                                    fit: BoxFit.fill,
                                                  )
                                                : Image.network(
                                                    _everythingNews
                                                        .articles[index]
                                                        .urlToImage,
                                                    fit: BoxFit.fill,
                                                  ),
                                          ),
                                          Container(
                                            padding: EdgeInsets.all(4),
                                            height: 100,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width -
                                                130,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: <Widget>[
                                                Text(
                                                  _everythingNews
                                                      .articles[index].title,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.normal),
                                                ),
                                                Text(
                                                  _everythingNews
                                                      .articles[index]
                                                      .description,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                )
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ));
  }
}
