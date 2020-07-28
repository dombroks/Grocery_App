import 'package:flutter/material.dart';
import 'package:grocery_app/Screens/MainScreen.dart';
import 'package:grocery_app/Services/firebaseFirestore.dart';
import 'package:grocery_app/constants.dart';
import 'package:provider/provider.dart';

import 'Screens/CartScreen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized(); 

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  final firebaseFirestore _firestore = firebaseFirestore();
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        StreamProvider(
          create: (context) => _firestore.getProducts(),
        )
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'My Grocery',
          home: DefaultTabController(
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
                homeScreen(),
              ]),
            ),
          )),
    );
  }
}
