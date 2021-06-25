import 'package:childinformationn/services/news_service.dart';
import 'package:childinformationn/models/articles.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsPage extends StatefulWidget {
  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  List<Articles> articles = [];
  @override
  void initState() {
    NewsService.getNews().then((value) {
      setState(() {
        articles = value;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Haberler'),
      ),
      body: Center(
        child: ListView.builder(
            itemCount: articles.length,
            itemBuilder: (context, index) {
              return Card(
                shadowColor: Colors.white,
                child: Column(
                  children: [
                    Image.network(articles[index].urlToImage ?? ""),
                    ListTile(
                      leading: Icon(Icons.arrow_drop_down_circle),
                      title: Text(articles[index].title),
                      subtitle: Text(articles[index].author  ??""),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(articles[index].description ?? ""),
                    ),
                    ButtonBar(
                      alignment: MainAxisAlignment.start,
                      children: [
                        TextButton(
                            onPressed: () async {
                              await launch(articles[index].url);
                            },
                            child: Text('Habere Git',style: TextStyle(color: Colors.blueAccent,fontWeight: FontWeight.bold),),)
                      ],
                    ),
                  ],
                ),
              );
            }),
      ),
    );
  }
}
