import 'package:flutter/material.dart';
import 'complete_profile.dart';


class Create extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "screen two",
      home: Scaffold(
        backgroundColor: Colors.white,
       body: SafeArea(
       
         child: Column(
           crossAxisAlignment: CrossAxisAlignment.center,
           mainAxisAlignment: MainAxisAlignment.start,

           children: [
             
              Container(
                margin: const EdgeInsets.only(right: 330.0, top: 20.0 ) ,
               child:  Icon(
               Icons.arrow_back,
               color: Colors.black,
             ),
         ),
          
             Container(
               margin: const EdgeInsets.only(left: 10.0, top: 45.0),
             ),
             Text(
               'Create your account',
               style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 23,

               ),
             ),
             Padding(padding: const EdgeInsets.only(top:20.0)),
             CreateAccount('Email'),
             CreateAccount('Password'),
             CreateAccount('Phone'),
             Container(
               margin: const EdgeInsets.only(top: 20.0),
               width: 200.0,
               height: 50.0,
               child: RaisedButton(
               onPressed: () {
                 Navigator.push(context, MaterialPageRoute(builder: (context){
                   return CompleteProfile();
                 }));
               },
               color: Colors.redAccent,
               textColor: Colors.white,
               child: Container(
                 child: Text('Next', style: TextStyle(fontSize: 20)),
                 decoration: BoxDecoration(
             
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
            ),
               ),
               
               ),
             ),
             Container(
               margin: const EdgeInsets.only(top: 20.0),
             child:Text(
               'By signing up you agree to our Terms of Use \nand Privacy Policy',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
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

Column CreateAccount(String label){
  return Column(
    children: [
      Container(
        margin: const EdgeInsets.only(left:50.0, right:50.0, top: 15.0),
        padding: const EdgeInsets.only(top: 25.0),
        decoration: BoxDecoration(
              color: Colors.grey[50],
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
              border: Border.all(
                color: Colors.grey,
                width: 1,
              ),
         ),
         child: Row(
           
           children: [ 
             Container(
               margin: const EdgeInsets.only(left: 15.0),
             ) ,
           Text(
               label,
               style: TextStyle(
                color: Colors.grey,
                  fontSize: 16,
                  //fontWeight: FontWeight.bold,
               ),
             
             ),
                 
           ],
         ),


      ),
      
    ],
  );
}

