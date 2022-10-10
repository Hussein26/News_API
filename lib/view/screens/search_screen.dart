import 'package:api_news/provider/search_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatelessWidget {

  var _controller = TextEditingController();
  cleanText(){
    _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<SearchProvider>(builder: (context,provider,child){
      return Scaffold(
          backgroundColor: Colors.black,
          appBar: AppBar(
            backgroundColor: Colors.black,
            title: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10)
              ),

              width: double.infinity,
              child:   TextFormField(
                onChanged: (value){

                  provider.getAllSearchArticle(value);
                },
                controller: _controller,
                decoration: InputDecoration(
                  prefixIcon: IconTheme(
                    data: IconThemeData(color: Colors.black38),
                    child: Icon(Icons.search),
                  ),
                  hintText: 'Search...',
                  hintStyle: TextStyle(fontSize: 20),
                  suffixIcon: IconButton(
                    onPressed: (){
                      cleanText();

                    },
                    icon: Icon(Icons.clear_rounded,color: Colors.black,),
                  ),

                ),

              ),
            ),
          ),
          body: ListView.builder(
              itemCount: provider.searchList.length,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 5,
                  color: Color(0xff151f2c),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height * .25,
                        width: MediaQuery.of(context).size.width * .4,
                        child: Image.network(
                          provider.searchList[index].urtToImage ??  "https://www.salonlfc.com/wp-content/uploads/2018/01/image-not-found-scaled-1150x647.png" ,
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
                                provider.searchList[index].title ,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                              textDirection: TextDirection.rtl,
                            ),
                            Directionality(
                              child: Text(
                                provider.searchList[index].description ?? "",
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
                );
              }));
    });
  }
}
