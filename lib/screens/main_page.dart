
import 'package:flutter/material.dart';
import 'trend_page.dart';
import 'package:screentwo/widgets/view_recipes.dart';
import 'package:screentwo/widgets/profile_view.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:screentwo/models/recipe.dart';

/*
addData(){
  Map<String,dynamic> demoData = {"image":"images/pizza.jpg", "title": "Shrimp Pizza",
  "subtitle": "Homemade Shrimp Pizza", "likes": 90, "saved": true};
  CollectionReference collectionReference = FirebaseFirestore.instance.collection('Posts');
  collectionReference.add(demoData);
}
*/

class MainPage extends StatefulWidget{
_MainPage createState() => _MainPage();
}

class _MainPage extends State<MainPage> {
 
 /*
  fetchData(){
  CollectionReference collectionReference = FirebaseFirestore.instance.collection('Posts');
  collectionReference.snapshots().listen((snapshot) { 
    List documents;
    setState(() {

      documents = snapshot.docs;

    });


  });
}
  */
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 40,
          backgroundColor: Colors.white,
          actions: <Widget> [

             IconButton(
              icon: Icon(
                Icons.local_fire_department,
                color: Colors.deepOrangeAccent[400],
              ),
              onPressed: (){
                Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return TrendPage();
                    }));
                
               },
            ),
            IconButton(
              icon: Icon(
                Icons.person,
                color: Colors.redAccent,
              ),
              onPressed: (){
                //addData();
                
                
                 Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return ProfileFirst();
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
                  SaveWidget(),
           ),
    );
  }
}



