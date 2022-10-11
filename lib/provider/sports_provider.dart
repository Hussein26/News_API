import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../models/article_model.dart';

class SportsProvider extends ChangeNotifier {
  List<ArticleModel> sportList = [];
  SportsProvider(){
    getAllSportsNews();
  }

  Future getAllSportsNews() async {
    try {
      var response = await Dio().get(
          "https://newsapi.org/v2/top-headlines?country=us&category=sports&apiKey=9049eb51fa5f470baa629aeddc4b5e25");
      sportList = List<ArticleModel>.from(
          response.data["articles"].map((x) => ArticleModel.fromJson(x)));
      notifyListeners();
    } catch (e) {
      print(e.toString());
    }
  }
}
