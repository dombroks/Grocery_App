import 'package:flutter/material.dart';

import 'package:grocery_app/Screens/Profile.dart';

import '../constants.dart';
import 'CartScreen.dart';
import 'MainScreen.dart';

// ignore: must_be_immutable
class Home extends StatelessWidget {
  int selectedPage;
  Home(this.selectedPage);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: selectedPage,
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text("Store"),
          bottom: TabBar(
            indicatorColor: Colors.white,
            unselectedLabelColor: Colors.grey[310],
            tabs: [
              Tab(icon: Icon(Icons.local_grocery_store)),
              Tab(icon: Icon(Icons.shopping_basket)),
              Tab(icon: Icon(Icons.account_circle)),
            ],
          ),
          backgroundColor: kPrimaryColor,
          leading: Icon(Icons.menu),
          actions: <Widget>[
            Icon(Icons.search),
            SizedBox(
              width: 20.0,
            ),
            Icon(Icons.notifications),
            SizedBox(
              width: 10.0,
            ),
          ],
        ),
        body: TabBarView(children: [
          homeScreen(),
          CartScreen(),
          Profile(),
        ]),
      ),
    );
  }
}
