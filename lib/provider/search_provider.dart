import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../models/article_model.dart';

class SearchProvider extends ChangeNotifier {


  List<ArticleModel> searchList = [];


  Future getAllSearchArticle(String value) async {
    try{
      var response =await Dio().get("https://newsapi.org/v2/top-headlines?country=us&apiKey=be93dcbc240c47888c261d608a3368bc&q=$value");
      searchList =List<ArticleModel>.from(response.data["articles"].map((x) => ArticleModel.fromJson(x)));
      notifyListeners();
    }
    catch(e){
      print(e);
    }
  }

}