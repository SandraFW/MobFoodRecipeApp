import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/foundation.dart';

void main() {
  runApp(OneRecipe());
}

class OneRecipe extends StatelessWidget {
  /* This widget is the root
      of your application.*/
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recipe',
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text('Recipe'),
        ),
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(
            children: [
              Image.asset(
                'images/classicburger.jpeg',
                width: 430,
                height: 250,
                fit: BoxFit.cover,
              ),
              TitleSection(),
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                BuildButtonColumn(
                    Colors.black, Icons.add_comment, 'Add comment'),
                BuildButtonColumn(Colors.black, Icons.favorite, 'Like'),
                BuildButtonColumn(Colors.black, Icons.share, 'SHARE'),
              ]),
              text(),
            ],
          ),
        ),
      ),
    );
  }
}

class text extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(28),
      child: Text(
        "In a medium bowl, whisk together egg, salt and pepper. Place ground beef and bread crumbs into the mixture. With hands or a fork, mix until well blended. Form into 4 patties approximately 3/4 inch thick.Place patties on the prepared grill. Cover and cook 6 to 8 minutes per side, or to desired doneness. ",
        style: TextStyle(
          height: 1.5,
        ),
      ),
    );
  }
}

class TitleSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(25),
      child: Row(
        children: [
          Expanded(
            /*1*/
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /*2*/
                Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    'Classic Burgers',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  'Homemade classic burger',
                  style: TextStyle(
                    color: Colors.grey[500],
                  ),
                ),
              ],
            ),
          ),
          /*3*/
          FavoriteWidget(),
        ],
      ),
    );
  }
}

Column BuildButtonColumn(Color color, IconData icon, String label) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Icon(icon, color: color),
      Container(
        margin: const EdgeInsets.only(top: 8),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: color,
          ),
        ),
      ),
    ],
  );
}

class FavoriteWidget extends StatefulWidget {
  @override
  _FavoriteWidgetState createState() => _FavoriteWidgetState();
}

class _FavoriteWidgetState extends State<FavoriteWidget> {
  bool _isFavorited = true;
  int _favoriteCount = 99;

  void _toggleFavorite() {
    setState(() {
      if (_isFavorited) {
        _favoriteCount -= 1;
        _isFavorited = false;
      } else {
        _favoriteCount += 1;
        _isFavorited = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: EdgeInsets.all(0),
          child: IconButton(
            padding: EdgeInsets.all(0),
            alignment: Alignment.centerRight,
            icon: (_isFavorited ? Icon(Icons.star) : Icon(Icons.star_border)),
            color: Colors.red[500],
            onPressed: _toggleFavorite,
          ),
        ),
        SizedBox(
          width: 20,
          child: Container(
            child: Text('$_favoriteCount'),
          ),
        ),
      ],
    );
  }
}
