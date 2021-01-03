
import 'package:flutter/material.dart';
import 'package:screentwo/screens/main_page.dart';
import 'profile_main.dart';
import 'main_page.dart';
import 'package:screentwo/widgets/view_recipes.dart';

class SaveWidget extends StatefulWidget{
_SaveWidgetState createState() => _SaveWidgetState();
}

class _SaveWidgetState extends State<SaveWidget> {
bool _isSaved = true;

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

class SavedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
      //navigatorKey: navigatorKey,
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
            child: Container(
             
            child: ListView(
             children: [
               Container(
                 margin: EdgeInsets.only(left: 30.0, top:15.0),
               child:Text(
              'Saved Posts',
               style: TextStyle(
                  fontFamily: 'SourceSansPro',
                  fontSize: 28.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.red[900],
                ),
            ),
               ),

                RecipesColumn('images/crispykorean.jpg', 'Crispy Korean Fried Chicken', 'Homemade Fried Chicken',  100),
                RecipesColumn('images/summerfruit.jpg', 'Raspberry and Peach Tart', 'Homemade Raspberry and Peach Tart', 95),
                RecipesColumn('images/salmonwithnaan.jpg', 'Salmon with Grilled Naan', 'Homemade Salmon with Grilled Naan',  70),
                RecipesColumn('images/pizza.jpg', 'Shrimp Pizza', 'Homemade Shrimp Pizza', 90),

               ],
                  ),
            
           ),
         ), 
    );
  }
}


