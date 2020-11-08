import 'package:flutter/material.dart';
import 'complete_profile.dart';
import 'trend_page.dart';
import 'create_account.dart';
import 'main_page.dart';
import 'recipes.dart';
import 'forgetPass.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
   final routes = <String, WidgetBuilder>{
    CompleteProfile.tag: (context) => CompleteProfile(),
    TrendPage.tag: (context) => TrendPage(), 
  };
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Food recommendation",
      home: Create(),
      routes: routes,
    );

  }
}

