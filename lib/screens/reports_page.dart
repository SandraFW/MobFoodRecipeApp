
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:screentwo/screens/main_page.dart';
import 'profile_main.dart';
import 'main_page.dart';
import 'package:screentwo/widgets/view_reports.dart';

class ReportPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
  
      return Scaffold(
        appBar: AppBar(
         
          toolbarHeight: 40,
          backgroundColor: Colors.white,
          actions: <Widget> [

             IconButton(
              icon: Icon(
                Icons.home,
                color: Colors.red[900],
                size: 25.0,
              ),
              onPressed: (){
                  Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return MainPage();
                    }));
               },
             
            ),

            IconButton(
              icon: Icon(
                Icons.person,
                color: Colors.redAccent,
              ),
              onPressed: (){
                 Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return Profile();
                    }));
                
               },
            ),
          ],
          title: Container(
            margin: const EdgeInsets.only(left:15.0, right: 15.0),
            padding: const EdgeInsets.only(top:5.0),
            
            child: TextField(
             decoration: InputDecoration(
                hintText: "Search..",
                fillColor: Colors.grey[100],
                filled: true,
                suffixIcon:  Icon(
                Icons.search,
                color: Colors.redAccent,
                size: 20,    
              ),

             ),
             
            )

          )
        ),

         backgroundColor: Colors.white,
         body: SafeArea(
            
            child: 
                ReportWidget(),
         ),
    );
  }
}


