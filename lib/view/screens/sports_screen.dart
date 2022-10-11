import 'package:api_news/view/screens/webView_screen.dart';
import 'package:api_news/view/widgets/list_view_widget.dart';
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
          : ListViewWidget(newsList: provider.sportList);
    });
  }
}
