import 'package:api_news/view/screens/webView_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/sports_provider.dart';

class SportsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<SportsProvider>(builder: (context, provider, child) {
      return provider.sportList.length == 0
          ? Center(
        child: CircularProgressIndicator(),
      )
          : ListView.builder(
          itemCount: provider.sportList.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) =>
                        WebViewScreen(url: provider.sportList[index].url)));
                provider.sportList[index];
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
                        provider.sportList[index].urtToImage ??
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
                            textDirection: TextDirection.rtl,
                            child: Text(
                              provider.sportList[index].title,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            )),
                        Directionality(
                          textDirection: TextDirection.rtl,
                          child: Text(
                          provider.sportList[index].description??"",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white),))
                          ],
                        )),
                  ],
                ),
              ),
            );
          });
    });
  }
}
