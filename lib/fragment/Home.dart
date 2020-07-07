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
  var everythingUrl =
      'http://newsapi.org/v2/everything?q=bitcoin&from=2020-06-07&sortBy=publishedAt&apiKey=6949b1ad894d427cb7407699f7848b15&pageSize=5';

  News _everythingNews;

  @override
  void initState() {
    super.initState();
    everythingfetchData();
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
        body: SingleChildScrollView(
      physics: ScrollPhysics(),
      child: Container(
        padding: EdgeInsets.only(left: 10, right: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(
              height: 30,
            ),
            Text(
              "News",
              style: _textStyle,
            ),
            Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("Popular",
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold)),
                    RaisedButton(
                      onPressed: () {
                        everythingUrl =
                            'http://newsapi.org/v2/everything?q=bitcoin&from=2020-06-07&sortBy=publishedAt&apiKey=6949b1ad894d427cb7407699f7848b15&pageSize=20';
                        everythingfetchData();
                      },
                      child: Text(
                        "see all",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      color: Colors.red,
                    )
                  ],
                ),
                Container(
                  child: _everythingNews == null
                      ? Center(
                          child: CircularProgressIndicator(),
                        )
                      : ListView.builder(
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
                                        child: (_everythingNews.articles[index]
                                                    .urlToImage ==
                                                null)
                                            ? Image.network(
                                                "https://www.salonlfc.com/wp-content/uploads/2018/01/image-not-found-scaled-1150x647.png")
                                            : Image.network(
                                                _everythingNews
                                                    .articles[index].urlToImage,
                                                fit: BoxFit.fill,
                                              ),
                                      ),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text(
                                              _everythingNews
                                                  .articles[index].title,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight:
                                                      FontWeight.normal),
                                            ),
                                            Text(
                                              _everythingNews
                                                  .articles[index].description,
                                              overflow: TextOverflow.ellipsis,
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
