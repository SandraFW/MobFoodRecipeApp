import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
import 'lib/models/Posts.dart';

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
