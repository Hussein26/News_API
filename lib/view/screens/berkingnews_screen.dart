// image =  "https://www.salonlfc.com/wp-content/uploads/2018/01/image-not-found-scaled-1150x647.png"
// const Color(0xff151f2c),
import 'package:api_news/provider/breakingnews_provider.dart';
import 'package:api_news/view/screens/webView_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BreakingNewsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Breaking news'),
      ),
      body: Consumer<BreakingNewsProvider>(builder: (context, provider, child) {
        return provider.breakingNewsList.length == 0 ? Center(child: CircularProgressIndicator(),):  ListView.builder(
            itemCount: provider.breakingNewsList.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=> WebViewScreen(url: provider.breakingNewsList[index].url)));
                  provider.breakingNewsList[index];
                },
                child: Card(
                  elevation: 5,
                  color: Color(0xff151f2c),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height * .25,
                        width: MediaQuery.of(context).size.width * .4,
                        child: Image.network(
                          provider.breakingNewsList[index].urtToImage ??  "https://www.salonlfc.com/wp-content/uploads/2018/01/image-not-found-scaled-1150x647.png" ,
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
                              child: Text(
                               provider.breakingNewsList[index].title ,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                              textDirection: TextDirection.rtl,
                            ),
                            Directionality(
                              child: Text(
                               provider.breakingNewsList[index].description ?? "",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                              textDirection: TextDirection.rtl,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              );
            });
      }),
    );
  }
}
