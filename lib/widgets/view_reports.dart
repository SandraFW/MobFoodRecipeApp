
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:screentwo/screens/one_recipe.dart';
import 'package:like_button/like_button.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:screentwo/models/user.dart';
import 'package:provider/provider.dart';


class ReportWidget extends StatefulWidget{
_ReportedWidgetState createState() => _ReportedWidgetState();
}
class _ReportedWidgetState extends State<ReportWidget> {
  

Widget build(BuildContext context) {
  final user = Provider.of<Users>(context);
  return StreamBuilder(
    stream: FirebaseFirestore.instance.collection('Posts').where('reports.reasons', arrayContainsAny: ["Spam", "Inappropriate"]).snapshots(), 
    builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
     
       
      if(!snapshot.hasData){
        return Center(child: CircularProgressIndicator(),);
      }

       return Column(
        children: [
           Container(
               margin: EdgeInsets.only(left: 0.0, top:15.0),
               child:Text(
              'Reports',
               style: TextStyle(
                  fontFamily: 'SourceSansPro',
                  fontSize: 28.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.red[900],
                ),
            ),
               ),

        Expanded(
        child:ListView(  
        padding: const EdgeInsets.only(top: 20.0),
        children: snapshot.data.docs.map((document){
          List reasons = document["reports.reasons"];
          List reportedBy = document["reports.reportedBy"];

          
            showAlertDialog(BuildContext context) {
               Widget cancelButton = FlatButton(
              child: Text("Cancel", style: TextStyle(color: Colors.grey[700]),),
              onPressed: () {
                Navigator.pop(context);
               
               },
             );
              Widget okayButton = FlatButton(
              child: Text("Yes", style: TextStyle(color: Colors.redAccent),),
              onPressed: () {
               FirebaseFirestore.instance.collection('Posts').doc(document.id).delete();
               Navigator.pop(context);

                }
             );
            AlertDialog alert = AlertDialog(
            title: Text("Delete Post", style:
             TextStyle(
               color: Colors.redAccent,

            ),
            ),
            content: Text("are you sure you want to delete this post?"),
            actions: [
             cancelButton,
             okayButton,
            ],
         );

           showDialog(
          context: context,
         builder: (BuildContext context) {
      return alert;
    },
  );
}
         
         return Stack( 
           children:[
            
            
           Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
              Padding(padding: const EdgeInsets.only(top: 15.0, left:0.0)),
              InkWell(
              onTap: (){
              Get.to(OneRecipe());
              },
              child: Container(
              child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.asset(
              document["image"],
              width: 200,
              height: 100,
              fit: BoxFit.fitWidth,
      ),
      ),
      ),
     ),
      Container(
        margin: const EdgeInsets.only(left:10.0, top: 30.0),
      
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          
          children: [
              Container(
              padding: const EdgeInsets.only(bottom: 2.0),
              child: Text(
                document["title"],
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 12, 
                ),
              ),
              ),
              Container(
               padding: const EdgeInsets.only(bottom: 5.0),
             child:Text(
                document["subtitle"],
                style: TextStyle(
                  color: Colors.grey[500],
                  fontSize: 10,
                   ),
              ),
              ),
             Text("reason:" + " "+ reasons.toString().replaceAll("[", "").replaceAll("]", ""),
                style: TextStyle(
                fontSize: 10.0,
                fontFamily: 'OpenSans',
                fontWeight: FontWeight.bold,
                color: Colors.redAccent[700],
                ),),

             Text("report no. :" + " "+ reportedBy.length.toString(),
                style: TextStyle(
                fontSize: 10.0,
                fontFamily: 'OpenSans',
                fontWeight: FontWeight.bold,
                color: Colors.redAccent[700],
                ),),
               
              Row(
                children: [
                 Container(
                   margin: const EdgeInsets.only(left:130.0),
                 ),
                  IconButton(
                   icon: Icon(Icons.delete_outline),
                   color: Colors.redAccent,
                   onPressed:(){
                      showAlertDialog(context);
                   } 
                 ),
                 
            
              ],
              ), 
          ],
        ),
      ),
    ],
           ),
         ],
         
            );

         
       }).toList(),
         ),
        ),
        ],
       );
    }
   );    
}
}


