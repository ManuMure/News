import 'dart:convert';

import 'package:flutter_application_registration/models/article_model.dart';
import 'package:http/http.dart' as http;

class News {
  List<ArticleModel> news = [];

  Future<void> getNews() async {
    String url =
        "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=a6f5c4c5206249ebb5ea97c7b388072d";
    try {
      var response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        var jsonData = jsonDecode(response.body);

        if (jsonData['status'] == 'ok') {
          jsonData["articles"].forEach((element) {
            if (element["urlToImage"] != null &&
                element['description'] != null) {
              ArticleModel articleModel = ArticleModel.fromJson(element);
              news.add(articleModel);
            }
          });
        }
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      print('Error: $e');
    }
  }
}
