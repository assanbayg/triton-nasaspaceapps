import 'package:flutter/material.dart';
import 'package:triton_fire_management_app/models/news.dart';
import 'package:triton_fire_management_app/services/news_service.dart';
import 'package:url_launcher/url_launcher.dart';

class FireNews extends StatefulWidget {
  const FireNews({super.key});

  @override
  State<FireNews> createState() => _FireNewsState();
}

class _FireNewsState extends State<FireNews> {
  late List<News> newsList;
  Future<List<News>> loadNews() async {
    final newsService = NewsService();
    final newNewsList = await newsService.loadJsonData();
    setState(() {
      newsList = newNewsList;
    });
    return newsList;
  }

  @override
  void initState() {
    loadNews();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return SizedBox(
      height: size.height / 3,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          final news = newsList[index];
          return GestureDetector(
            onTap: () async {
              final uri = Uri.parse(news.newsUrl);
              if (await canLaunchUrl(uri)) {
                await launchUrl(uri);
              } else {}
            },
            child: Padding(
              padding: const EdgeInsets.all(5),
              child: Column(
                children: [
                  SizedBox(
                    height: 150,
                    width: 200,
                    child: Image.network(news.imageUrl, fit: BoxFit.fill),
                  ),
                  const SizedBox(width: 5.0),
                  SizedBox(
                    width: 200,
                    height: 100,
                    child: Text(news.newsTitle),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
