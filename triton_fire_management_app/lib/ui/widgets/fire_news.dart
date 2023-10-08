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
  late final newsList;
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
      height: size.height / 4,
      child: ListView.builder(
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
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  // it will hold image later
                  SizedBox(
                    height: 100,
                    width: 100,
                    child: Image.network(news.imageUrl),
                  ),
                  // it will hold news title
                  SizedBox(
                    width: size.width - 125,
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
