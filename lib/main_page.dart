import 'package:flutter/material.dart';

class FavoriteWidget extends StatefulWidget {
  _FavoriteWidgetState createState() => _FavoriteWidgetState();
}

class _FavoriteWidgetState extends State<FavoriteWidget> {
  bool _isFavorited = false;

  Widget build(BuildContext context) {
    return Row(
      //mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          child: IconButton(
//padding: EdgeInsets.all(0),
//alignment: Alignment.centerRight,
            icon: (_isFavorited
                ? Icon(Icons.favorite)
                : Icon(Icons.favorite_outline)),
            color: Colors.redAccent,
            onPressed: _toggleFavorite,
          ),
        ),
      ],
    );
  }

  void _toggleFavorite() {
    setState(() {
      if (_isFavorited) {
        _isFavorited = false;
      } else {
        _isFavorited = true;
      }
    });
  }
}

class Create extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Screen One",
      home: Scaffold(
        appBar: AppBar(
          toolbarHeight: 40,
          backgroundColor: Colors.white,
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.person,
                color: Colors.redAccent,
              ),
            ),
          ],
          title: Container(
            margin: const EdgeInsets.only(left: 15.0, right: 15.0),
            padding: const EdgeInsets.only(top: 10.0),
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
            ),
            child: Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 2.0, right: 15.0),
                  padding: const EdgeInsets.only(bottom: 10.0),
                ),
                Icon(
                  Icons.search,
                  color: Colors.deepOrange[200],
                  size: 20,
                ),
                Container(
                  margin: const EdgeInsets.only(left: 2.0, right: 15.0),
                  padding: const EdgeInsets.all(5.0),
                ),
                Text(
                  'Search for a recipe...',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),
        ),
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(
            children: [
              RecipesColumn('images/classicburger.jpeg', 'Classic Burger',
                  'Homemade Classic Burger', Icons.star, '100'),
              RecipesColumn('images/fluffypancakes.jpeg', 'Fluffy Pancakes',
                  'Homemade Fluffy Pancakes', Icons.star, '50'),
            ],
          ),
        ),
      ),
    );
  }
}

/*
Column CustomNavigationBar(){
  return Column(
    children: [
      Container(
        margin: const EdgeInsets.only(left:2.0, right: 15.0),
        padding: const EdgeInsets.only(bottom: 10.0),
      child: Row(
        children: [
          Icon(
            Icons.home,
            color: Colors.deepOrange[200],
          ),
          Icon(
            Icons.search,
            color: Colors.deepOrange[200],
          ),
          Icon(
            Icons.save,
            color: Colors.deepOrange[200],
          ),
          Icon(
            Icons.person,
            color: Colors.deepOrange[200],
          ),


        ],
      ),
      ),
      
  ],
  );
}
*/

Widget RecipesColumn(
    String images, String txt1, String txt2, IconData icon, String label) {
  return SingleChildScrollView(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(padding: const EdgeInsets.only(top: 7.5)),
        ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: Image.asset(
            images,
            width: 350,
            height: 200,
            fit: BoxFit.fitWidth,
          ),
        ),
        Container(
          margin: const EdgeInsets.only(left: 30.0),
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
                //mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.all(0.0),
                    margin: const EdgeInsets.all(0.0),
                  ),
                  Icon(
                    icon,
                    color: Colors.redAccent,
                  ),
                  Text(label),
                  Container(
                    margin: const EdgeInsets.only(right: 220.0),
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.visibility_outlined,
                      color: Colors.redAccent,
                    ),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return CompleteProfile();
                      }));
                    },
                  ),
                  Container(
                    margin: const EdgeInsets.only(right: 0.0),
                  ),
                  FavoriteWidget(),

                  /*
               Icon(
                Icons.favorite_outline,
                color: Colors.deepOrange[200],
              ),
            */
                ],
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Screen One",
      home: Create(),
    );
  }
}
