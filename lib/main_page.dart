
import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
import 'trend_page.dart';
import 'package:get/get.dart';
import 'one_recipe.dart';

class SavedWidget extends StatefulWidget{
_SavedWidgetState createState() => _SavedWidgetState();
}

class _SavedWidgetState extends State<SavedWidget> {
bool _isSaved = false;


Widget build(BuildContext context) {
return Row(
  //mainAxisSize: MainAxisSize.min,
  children: [
   Container(
  child: IconButton(
  
//padding: EdgeInsets.all(0),
//alignment: Alignment.centerRight,
icon: (_isSaved ? Icon(Icons.turned_in) : Icon(Icons.turned_in_not_outlined)),
color: Colors.redAccent,
onPressed: _toggleSaved,
),
   ),
  ],
);

} 
              
void _toggleSaved() {
setState(() {
if (_isSaved) {
_isSaved = false;
} else {
_isSaved = true;
}
});
}
}

class MainPage extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Screen One",
      home: Scaffold(
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
                
               },
            ),
          ],
          title: Container(
            margin: const EdgeInsets.only(left:15.0, right: 15.0),
            padding: const EdgeInsets.only(top:5.0),
            
            child: TextField(
             decoration: InputDecoration(
                hintText: "Search..",
                fillColor: Colors.white,
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
                child: ListView(
             children: [

                RecipesColumn('images/classicburger.jpeg', 'Classic Burger', 'Homemade Classic Burger',  100),
                RecipesColumn('images/fluffypancakes.jpeg', 'Fluffy Pancakes', 'Homemade Fluffy Pancakes', 50),
                RecipesColumn('images/salmonwithnaan.jpg', 'Salmon with Grilled Naan', 'Homemade Salmon with Grilled Naan',  70),
                RecipesColumn('images/sushi.jpeg', 'Vegan Sushi', 'Homemade Sushi Vegan', 100),

               ],

           ),
         ),
         
      ), 
    );
  }
}


Widget RecipesColumn(String images, String txt1, String txt2,  int label){
  return  Container(
    child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
    
      Padding(padding: const EdgeInsets.only(top: 15.0)),
     InkWell(
       onTap: (){
         Get.to(OneRecipe());
       },
      child: Container(
     child:ClipRRect(
       borderRadius: BorderRadius.circular(8.0),
       child: Image.asset(
        images,
        width: 350,
        height: 200,
        fit: BoxFit.fitWidth,
      ),
      ),
      ),
     ),
      Container(
        margin: const EdgeInsets.only(left:30.0),
        padding: const EdgeInsets.only(top: 10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          
          children: [
              Container(
              padding: const EdgeInsets.only(bottom: 5.0),
              child: Text(
                txt1,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18, 
                ),
              ),
              ),
             Text(
                txt2,
                style: TextStyle(
                  color: Colors.grey[500],
                  fontSize: 15,
                   ),

              ),
             
             
              Row(
                
                crossAxisAlignment: CrossAxisAlignment.center,
              children: [ 
                 Container(
                padding: const EdgeInsets.all(0.0),
                 margin: const EdgeInsets.all(0.0),
              ),
               LikeButton(
                  likeCount: label,
                  likeBuilder: (bool isLiked){
                    return Icon(
                      Icons.favorite,
                      size: 25,
                      color: isLiked ? Colors.redAccent : Colors.blueGrey[200],
                    );
                  },
                  countBuilder: (int count, bool isLiked, String text){
                    var color = isLiked ? Colors.redAccent : Colors.blueGrey;
                    Widget result;
                    if(count == 0){
                      result = Text(
                        "love",
                         style: TextStyle(color: color),
                      );
                    }
                    else{
                     result = Text(
                     text,
                     style: TextStyle(color: color),
                     );
                    }
                    return result;
                  },
                ),
               Container(
                   margin: const EdgeInsets.only(right:250.0),
                ),
                 SavedWidget(),
             
              
              ],
              ), 
        
          ],
        ),
        

      ),
  
    ],
    ),
   
  );
}

