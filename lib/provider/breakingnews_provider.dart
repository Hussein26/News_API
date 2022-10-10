import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../models/article_model.dart';


class BreakingNewsProvider extends ChangeNotifier {

  List<ArticleModel> breakingNewsList = [];

 BreakingNewsProvider(){
getAllBreakingNews();
 }


  Future getAllBreakingNews() async {
try{
  var response =await Dio().get("https://newsapi.org/v2/top-headlines?country=eg&apiKey=be93dcbc240c47888c261d608a3368bc");
  breakingNewsList =List<ArticleModel>.from(response.data["articles"].map((x) => ArticleModel.fromJson(x)));
  notifyListeners();
}
catch(e){
  print(e);
}


  }


}