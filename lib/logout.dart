import 'package:flutter/material.dart';
import 'detail_page.dart';

class Logout extends StatelessWidget{
 @override
 Widget build (BuildContext context){
   return MaterialApp(
     
     home: Scaffold(
       backgroundColor: Colors.white,
       body: SafeArea(
         child: Column(
           children:[
          Container(
            padding: EdgeInsets.only(left:90.0, top: 90.0),
           child:Icon(
             Icons.logout,
             size: 120.0,
             color: Colors.red[900],
             ),
          
          ),
          Container(
            padding: EdgeInsets.only(left:60.0, top: 20.0),
           child:Text(
              'You are about to sign out. \n are you sure?',
               style: TextStyle(
                  fontFamily: 'SourceSansPro',
                  fontSize: 28.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.red[900],
                  
                ),
                textAlign: TextAlign.center,
            ),
          ),
          Container(
            padding: EdgeInsets.only(top:40.0, left: 55.0),
          child:
          FlatButton(
                onPressed: (){
                   Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return Detail();
                    }));
                },
              
                  color: Colors.red[900].withOpacity(1),
                  textColor: Colors.white,
                   child: Container(
                     child: Text(
                     'Logout', 
                     style: TextStyle(
                       fontFamily: 'SourceSansPro',
                       fontSize: 20,
                      fontWeight: FontWeight.bold)
                     ),
                     margin: EdgeInsets.all(12.0),
                     padding: EdgeInsets.only(left: 30.0, right: 30.0),
                     ),
                    shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(18.0),
                    side: BorderSide(color: Colors.red[900], width: 2.5 ),
                    ),
                ),
          ),



          Container(
             padding: EdgeInsets.only(top:15.0, left: 55.0),
          child:
           FlatButton(
                onPressed: (){
                   Navigator.pop(context, false);
                },
              
                  color: Colors.white.withOpacity(1),
                  textColor: Colors.red[900],
                   child: Container(
                     child: Text(
                     'Cancel', 
                     style: TextStyle(
                       fontFamily: 'SourceSansPro',
                       fontSize: 20,
                      fontWeight: FontWeight.bold)
                     ),
                     margin: EdgeInsets.all(12.0),
                     padding: EdgeInsets.only(left: 30.0, right: 30.0),
                     ),
                    shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(18.0),
                    side: BorderSide(color: Colors.red[900], width: 2.5 ),
                    ),
                ),
          ),

           ],
       ),
         ),
       ),
     





   );

 }
}
