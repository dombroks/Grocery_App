import 'package:flutter/material.dart';

import 'package:grocery_app/Screens/Profile.dart';
import 'package:grocery_app/Screens/TermsAndConditions.dart';
import 'package:grocery_app/components/DrawerListTile.dart';

import '../constants.dart';
import 'CartScreen.dart';
import 'MainScreen.dart';

// ignore: must_be_immutable
class Home extends StatelessWidget {
  int selectedPage;
  Home(this.selectedPage);

  var _drawerKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: selectedPage,
      length: 3,
      child: Scaffold(
        key: _drawerKey,
        drawer: Drawer(
          child: ListView(
            children: [
              DrawerListTile(
                title: "Order history",
                iconData: Icons.history,
                onClick: () {},
              ),
              DrawerListTile(
                title: "Track orders",
                iconData: Icons.place,
                onClick: () {},
              ),
              DrawerListTile(
                title: "Saved carts",
                iconData: Icons.shopping_cart,
                onClick: () {},
              ),
              DrawerListTile(
                title: "Store locator",
                iconData: Icons.store,
                onClick: () {},
              ),
              DrawerListTile(
                title: "Terms & conditions",
                iconData: Icons.info,
                onClick: () {},
              ),
              DrawerListTile(
                title: "Help",
                iconData: Icons.help,
                onClick: () {},
              ),
              DrawerListTile(
                title: "Got a question?",
                iconData: Icons.live_help,
                onClick: () {},
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
              _drawerKey.currentState.openDrawer();
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
