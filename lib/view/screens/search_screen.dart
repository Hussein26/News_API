import 'package:api_news/provider/search_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/list_view_widget.dart';

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
          body: ListViewWidget(newsList: provider.searchList));
    });
  }
}
