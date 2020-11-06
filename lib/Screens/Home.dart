import 'package:flutter/material.dart';

import 'package:grocery_app/Screens/Profile.dart';
import 'package:grocery_app/Screens/TermsAndConditions.dart';

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
        drawer: Drawer(
          child: ListView(
            children: [
              ListTile(
                title: Text("Order history"),
                leading: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: kCategoryColor,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.history,
                    color: kPrimaryColor,
                  ),
                ),
              ),
            ],
          ),
        ),
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
          leading: GestureDetector(
            child: Icon(Icons.menu),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => TermsConditions()));
            },
          ),
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
