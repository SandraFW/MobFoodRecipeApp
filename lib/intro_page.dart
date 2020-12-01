import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/animation.dart';
import 'create_account.dart';

class IntroPage extends StatefulWidget{
  _IntroPage createState() => _IntroPage();
}

class _IntroPage extends State<IntroPage> with SingleTickerProviderStateMixin{
  Animation animation;
  Animation animationController;

  @override
  void initState(){
    super.initState();
    animationController = AnimationController(duration: Duration(seconds: 2), vsync: this)..repeat(reverse: false);
    animation = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
      parent: animationController,
      curve: Curves.elasticOut,

    ));

  }

  @override
  void dispose() {
    super.dispose();
    //animationController.dispose();
  }

  Widget build (BuildContext context){
    return MaterialApp(
      title: "Introduction Page" ,
      home: Scaffold(
        body: Stack(
            children: [
            Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/summerfruit.jpg'),
                fit: BoxFit.cover,
              ),
            ),
           
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
            Container(padding: EdgeInsets.only(right:500.0,top: 20.0)),
           
           ClipRRect(
           child: RotationTransition( 
            turns: animation,   
            child: Image.asset(
           'images/foodstudiolast.png',
            width: 150,
            height: 150,
           ),
         ),
            ),
                  Container(
                  padding: EdgeInsets.all(220.0),
                   ),
                
              RaisedButton(
                onPressed: (){
                   Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return Create();
                    }));

                },
                  color: Colors.transparent,
                  textColor: Colors.white,
                  child: Container(
                
                    child: Text('Sign up with email', style: TextStyle(fontSize: 20)),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(8.0)),
                       
                      

                      ),
                    ),
                  
                  ),
                   
                

               

              ],
            )
            ], 
        ),
      ),
    );

  }




}
