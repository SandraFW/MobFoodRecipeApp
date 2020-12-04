import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/animation.dart';
import 'create_account.dart';
import 'login.dart';

class IntroPage extends StatefulWidget{
  _IntroPage createState() => _IntroPage();
}

class _IntroPage extends State<IntroPage> with SingleTickerProviderStateMixin{
  Animation animation;
  Animation animationController;
  


  @override
  void initState(){
    super.initState();
    animationController = AnimationController(duration: Duration(seconds: 5), vsync: this)..repeat(reverse: false);
    animation = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
      parent: animationController,
      curve: Curves.elasticOut,

    ));
  }

  @override
  void dispose() {
    super.dispose();
    
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
           Container(
             margin: EdgeInsets.only(top: 30.0),
           child:ClipRRect(
           child: RotationTransition( 
            turns: animation,   
            child: Image.asset(
           'images/foodstudiolast.png',
            width: 150,
            height: 150,
           ),
         ),
            ),
           ),
           Container(
          margin: EdgeInsets.only(left:330.0, top: 20.0),
           child: TextButton(
             onPressed: (){
               Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return Login();
                    }));
             }, 
             child: Text('Login',
             style: TextStyle(
               color: Colors.red[900],
               fontWeight: FontWeight.bold,
               fontSize: 20.5,
             ),
             ),
             ),
           ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children:[
                Container(
                  padding: EdgeInsets.only(left:100.0, top:490.0),
                ),
                FlatButton(
                onPressed: (){
                   Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return Create();
                    }));
                },
              
                  color: Colors.white.withOpacity(0.7),
                  textColor: Colors.red[900],
                   child: Container(
                     child: Text(
                     'Sign up with email', 
                     style: TextStyle(
                       fontSize: 20,
                      fontWeight: FontWeight.bold)
                     ),
                     margin: EdgeInsets.all(18.0),
                     padding: EdgeInsets.only(left: 30.0, right: 30.0),
                     ),
                    shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(18.0),
                    side: BorderSide(color: Colors.red[900], width: 3.5 ),
                    ),
                ),
              
              ],
            ),
            ], 
        ),
      ),
    );

  }
}
