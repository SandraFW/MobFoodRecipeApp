import 'package:flutter/material.dart';
import 'screens/complete_profile.dart';
import 'package:get/get.dart';
import 'screens/trend_page.dart';
import 'screens/detail_page.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

   final routes = <String, WidgetBuilder>{
    CompleteProfile.tag: (context) => CompleteProfile(),
    TrendPage.tag: (context) => TrendPage(), 
  };
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Food Studio",
      home: Detail(),
      routes: routes,
    );
  }
}

