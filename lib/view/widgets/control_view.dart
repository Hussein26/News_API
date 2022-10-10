import 'package:api_news/provider/control_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
import 'package:provider/provider.dart';

import '../screens/berkingnews_screen.dart';
import '../screens/search_screen.dart';
import '../screens/sports_screen.dart';

class ControlView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Consumer<ControlProvider>(builder: (context,provider,child){
      return Scaffold(
        backgroundColor: Colors.black,
        body: provider.currentScreen,
        bottomNavigationBar: Container(

          decoration: BoxDecoration(
            color: Colors.black,
            boxShadow: [
              BoxShadow(
                blurRadius: 20,
                color: Colors.black.withOpacity(.1),
              )
            ],
          ),
          child: SafeArea(

            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
              child: GNav(
                rippleColor: Colors.white,
                hoverColor: Colors.white,
                gap: 8,
                activeColor: Colors.black,
                iconSize: 24,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                duration: Duration(milliseconds: 400),
                tabBackgroundColor: Colors.pink[300]!,

                color: Colors.black,
                tabs: [
                  GButton(
                    icon: LineIcons.newspaper,
                    iconColor: Colors.white,
                    text: 'Breaking news',
                  ),
                  GButton(
                    icon: Icons.sports,
                    iconColor: Colors.white,
                    text: 'Sport news',
                  ),
                  GButton(
                    icon: LineIcons.search,
                    iconColor: Colors.white,
                    text: 'Search',
                  ),

                ],
                selectedIndex: provider.currentIndex,
                onTabChange: (index) {
                  provider.changeScreen(index);
                },
              ),
            ),
          ),
        ),
      );
    });
  }
}
