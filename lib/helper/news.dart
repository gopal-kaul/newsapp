import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:newsapp/data/articlemodel.dart';

class News {
  List<ArticleModel> news = [];
  Future<void> getNews() async {
    try {
      String url =
          'https://cors-anywhere.herokuapp.com/https://newsapi.org/v2/top-headlines?country=in&apiKey=f5730244c3e54cab99790606c54aa08a';
      var result = await http.get(url);
      var jsondata = json.decode(result.body);
      if (jsondata['status'] == 'ok') {
        jsondata['articles'].forEach((e) {
          if (e['urlToImage'] != null && e['description'] != null) {
            ArticleModel articleModel = ArticleModel(
              author: e['author'],
              content: e['content'],
              title: e['title'],
              description: e['description'],
              url: e['url'],
              urlimage: e['urlToImage'],
            );
            news.add(articleModel);
          }
        });
      }
    } catch (e) {
      print(e);
    }
  }
}

class Categorynews {
  List<ArticleModel> categorynews = [];
  Future<void> getcategorynews(String category) async {
    try {
      String url =
          'https://cors-anywhere.herokuapp.com/https://newsapi.org/v2/top-headlines?category=$category&country=in&apiKey=f5730244c3e54cab99790606c54aa08a';
      var result = await http.get(url);
      var jsondata = json.decode(result.body);
      if (jsondata['status'] == 'ok') {
        jsondata['articles'].forEach((e) {
          if (e['urlToImage'] != null && e['description'] != null) {
            ArticleModel articleModel = ArticleModel(
              author: e['author'],
              content: e['content'],
              title: e['title'],
              description: e['description'],
              url: e['url'],
              urlimage: e['urlToImage'],
            );
            categorynews.add(articleModel);
          }
        });
      }
    } catch (e) {
      print(e);
    }
  }
}
