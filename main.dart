
import 'package:flutter/material.dart';
import 'main_page.dart';
import 'create_account.dart'

void main() {
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Food recommendation",
      home: Create(),
    );
  }
}


