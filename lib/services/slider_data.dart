import 'dart:convert';
import 'package:flutter_application_registration/models/slider_model.dart';
import 'package:http/http.dart' as http;

class Slider {
  List<SliderModel> sliders = [];

  Future<void> getSlider() async {
    String url =
        "https://newsapi.org/v2/everything?domains=wsj.com&apiKey=a6f5c4c5206249ebb5ea97c7b388072d";
    try {
      var response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        var jsonData = jsonDecode(response.body);

        if (jsonData['status'] == 'ok') {
          List<dynamic> articles = jsonData["articles"];
          sliders = articles
              .where((element) =>
                  element["urlToImage"] != null &&
                  element['description'] != null)
              .map((element) => SliderModel.fromJson(element))
              .toList();
        }
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      print('Error: $e');
    }
  }
}
