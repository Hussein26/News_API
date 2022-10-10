import 'package:api_news/view/screens/berkingnews_screen.dart';
import 'package:api_news/view/screens/search_screen.dart';
import 'package:api_news/view/screens/sports_screen.dart';
import 'package:flutter/material.dart';


class ControlProvider extends ChangeNotifier {

  int currentIndex = 0;
  Widget currentScreen = BreakingNewsScreen();
  void changeScreen(int index){
    currentIndex = index;
    switch (index){
      case 0 :
        currentScreen = BreakingNewsScreen();
        break;
      case 1 :
        currentScreen = SportsScreen();
        break;
      case 2 :
        currentScreen = SearchScreen();
        break;
    }
    notifyListeners();
  }
}
