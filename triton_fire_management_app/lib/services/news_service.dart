import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:triton_fire_management_app/models/news.dart';

class NewsService {
  Future<List<News>> loadJsonData() async {
    final jsonText = await rootBundle.loadString('assets/news.json');
    final jsonData = json.decode(jsonText) as List<dynamic>;
    final returnData = jsonData.map((json) => News.fromApi(json)).toList();
    return returnData;
  }
}
