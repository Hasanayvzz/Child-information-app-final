import 'dart:convert';
import 'dart:async';
import 'package:childinformationn/models/articles.dart';
import 'package:childinformationn/models/news.dart';
import 'package:http/http.dart' as http;

class NewsService {
  static NewsService _singleton = NewsService._internal();
  NewsService._internal();
  factory NewsService() {
    return _singleton;
  }
  static Future<List<Articles>> getNews() async {
    String url =
        'https://newsapi.org/v2/top-headlines?country=tr&category=business&apiKey=ca080714863a4967a790df63e85d94ab';
    final response = await http.get(Uri.parse(url));
    if (response.body.isNotEmpty) {
      final responseJson = json.decode(response.body);
      News news = News.fromJson(responseJson);
      return news.articles;
    }
    return null;
  }
}
