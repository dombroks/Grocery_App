import 'package:flutter/material.dart';
import 'package:grocery_app/Screens/SplashScreen.dart';
import 'package:grocery_app/Viewmodel/SharedViewModel.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [ChangeNotifierProvider(create: (context) => SharedViewModel())],
        child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'My Grocery',
            home: SplashScreen()));
  }
}
