
import 'package:api_news/provider/breakingnews_provider.dart';
import 'package:api_news/provider/control_provider.dart';


import 'package:api_news/provider/search_provider.dart';import 'package:api_news/provider/sports_provider.dart';
import 'package:api_news/view/widgets/control_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context)=> ControlProvider()),
    ChangeNotifierProvider(create: (context)=> BreakingNewsProvider()),
    ChangeNotifierProvider(create: (context)=> SearchProvider()),
    ChangeNotifierProvider(create: (context)=> SportsProvider()),

  ],child: MyApp(),));
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ControlView(),
    );
  }
}
