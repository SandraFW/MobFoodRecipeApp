
import 'package:flutter/material.dart';
import 'trend_page.dart';
import 'profile_main.dart';
import 'package:screentwo/widgets/view_recipes.dart';

class SavedWidget extends StatefulWidget{
_SavedWidgetState createState() => _SavedWidgetState();
}

class _SavedWidgetState extends State<SavedWidget> {
bool _isSaved = false;


Widget build(BuildContext context) {
return Row(
  
  children: [
   Container(
  child: IconButton(
  

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
                child: ListView(
             children: [

                RecipesColumn('images/classicburger.jpeg', 'Classic Burger', 'Homemade Classic Burger',  100),
                RecipesColumn('images/fluffypancakes.jpeg', 'Fluffy Pancakes', 'Homemade Fluffy Pancakes', 50),
                RecipesColumn('images/salmonwithnaan.jpg', 'Salmon with Grilled Naan', 'Homemade Salmon with Grilled Naan',  70),
                RecipesColumn('images/sushi.jpeg', 'Vegan Sushi', 'Homemade Sushi Vegan', 100),

               ],

           ),
         ),
    );
  }
}



