import 'package:flutter/material.dart';
import 'package:grocery_app/Provider/Mediator.dart';
import 'package:grocery_app/Screens/SplashScreen.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          // StreamProvider<QuerySnapshot>.value(value: _firestore.getData("fruit")),
          ChangeNotifierProvider(create: (context) => Mediator())
        ],
        child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'My Grocery',
            home: SplashScreen()));
  }
}
