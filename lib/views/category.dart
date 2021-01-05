import 'package:flutter/material.dart';
import 'package:newsapp/data/articlemodel.dart';
import 'package:newsapp/helper/news.dart';
import 'package:newsapp/views/home.dart';

class Category extends StatefulWidget {
  final String category;
  Category({this.category});

  @override
  _CategoryState createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  List<ArticleModel> articles = [];
  bool _loading = true;
  @override
  void initState() {
    super.initState();
    getnews();
  }

  getnews() async {
    Categorynews newsClass = Categorynews();
    await newsClass.getcategorynews(widget.category);
    setState(() {
      articles = newsClass.categorynews;
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('News '),
              Text(
                'App',
                style: TextStyle(color: Colors.white),
              )
            ],
          ),
          centerTitle: true,
          elevation: 0.0,
        ),
        body: _loading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 15.0),
                  child: Column(
                    children: <Widget>[
                      ListView.builder(
                          itemCount: articles.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return ArticleTile(
                              imageurl: articles[index].urlimage,
                              title: articles[index].title,
                              desc: articles[index].description,
                              url: articles[index].url,
                            );
                          })
                    ],
                  ),
                ),
              ));
  }
}
