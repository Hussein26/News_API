import 'package:api_news/models/article_model.dart';
import 'package:flutter/material.dart';

import '../screens/webView_screen.dart';
import 'package:provider/provider.dart';
class ListViewWidget extends StatelessWidget {
  List<ArticleModel> newsList;
  ListViewWidget ({required this.newsList});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: newsList.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) =>
                      WebViewScreen(url: newsList[index].url)));

            },
            child: Card(
              color: Color(0xff151f2c),
              elevation: 8,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: MediaQuery
                        .of(context)
                        .size
                        .height * .25,
                    width: MediaQuery
                        .of(context)
                        .size
                        .width * .4,
                    child: Image.network(
                      newsList[index].urtToImage ??
                          "https://www.salonlfc.com/wp-content/uploads/2018/01/image-not-found-scaled-1150x647.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                      child: Column(
                        children: [
                          Directionality(
                              textDirection: TextDirection.ltr,
                              child: Text(
                                newsList[index].title,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              )),
                          Directionality(
                              textDirection: TextDirection.ltr,
                              child: Text(
                                newsList[index].description??"",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),))
                        ],
                      )),
                ],
              ),
            ),
          );
        });;
  }
}
