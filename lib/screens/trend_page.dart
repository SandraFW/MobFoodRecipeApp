import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';

class Food {
  final String title;
  final String image;
  final int likes;
  bool fav = false;
  Food({this.title, this.image, this.likes, this.fav});

  static List<Food> allFood() {
    var lstOfFoods = new List<Food>();
    lstOfFoods.add(new Food(
        title: "Egyptian Wark Ainab", likes: 500, image: "5.jpg", fav: false));
    lstOfFoods.add(new Food(
        title: "Turkey Tetrazzini", likes: 300, image: "1.jpeg", fav: false));
    lstOfFoods.add(
        new Food(title: "Lasagna", likes: 280, image: "2.jpg", fav: false));
    lstOfFoods.add(new Food(
        title: "Honey Garlic Chicken", likes: 280, image: "3.jpg", fav: false));
    lstOfFoods.add(new Food(
        title: "Overnight Oats", likes: 279, image: "4.jpg", fav: false));
    lstOfFoods.add(new Food(
        title: "Grilled Salmon", likes: 278, image: "6.jpg", fav: false));
    return lstOfFoods;
  }
}

class TrendPage extends StatefulWidget {
  static String tag = 'trend-page';
  @override
  _TrendPagetState createState() => _TrendPagetState();
}

class _TrendPagetState extends State<TrendPage> {
  final List<Food> _allFood = Food.allFood();
  final _saved = Set<Food>();

  //bool _isFavorited = false;
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text(
            "Our Popular recipes",
            style: new TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: Colors.black87),
          ),
        ),
        body: new Padding(
            padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
            child: getHomePageBody(context)));
  }

  getHomePageBody(BuildContext context) {
    return ListView.builder(
      itemCount: _allFood.length,
      itemBuilder: _getItemUI,
      padding: EdgeInsets.all(10.0),
    );
  }

  Widget _getItemUI(BuildContext context, int index) {
    final label = _allFood[index].likes;
    return new Card(
        child: new Column(
      children: <Widget>[
        Image.asset(
          "images/" + _allFood[index].image,
          fit: BoxFit.fill,
          width: 300.0,
          height: 200.0,
        ),
        new Text(
          _allFood[index].title,
          style: new TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            LikeButton(
              likeCount: label,
              likeBuilder: (bool isLiked) {
                return Icon(
                  Icons.favorite,
                  size: 25,
                  color: isLiked ? Colors.redAccent : Colors.blueGrey[200],
                );
              },
              countBuilder: (int count, bool isLiked, String text) {
                var color = isLiked ? Colors.redAccent : Colors.blueGrey;
                Widget result;
                if (count == 0) {
                  result = Text(
                    "love",
                    style: TextStyle(color: color),
                  );
                } else {
                  result = Text(
                    text,
                    style: TextStyle(color: color),
                  );
                }
                return result;
              },
            ),
          ],
        ),
      ],
    ));
  }
}
