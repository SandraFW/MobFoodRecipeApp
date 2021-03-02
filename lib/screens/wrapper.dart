import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:screentwo/models/user.dart';
import 'package:screentwo/screens/detail_page.dart';
import 'package:screentwo/screens/intro_page.dart';
import 'package:screentwo/screens/logout_page.dart';
import 'package:screentwo/screens/main_page.dart';


class Wrapper extends StatelessWidget{

@override 
Widget build(BuildContext context){

  final user = Provider.of<Users>(context);
  if(user == null){
    return Detail();
  } else{
    return MainPage();
  }

}
}
