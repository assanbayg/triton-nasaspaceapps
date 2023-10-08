class News {
  final String newsTitle;
  final String newsUrl;
  final String imageUrl;

  @override
  String toString() {
    return 'News{'
        'newsTitle: $newsTitle, '
        'newsUrl: $newsUrl, '
        'imageUrl: $imageUrl'
        '}';
  }

  News.fromApi(Map<String, dynamic> map)
      : newsTitle = map['title'],
        newsUrl = map['article_url'],
        imageUrl = map['image_url'];
}
