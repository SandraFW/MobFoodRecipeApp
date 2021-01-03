import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
import 'drawer.dart';

class Posts {
  final String title;
  final String image;
  final String time;
  final String likes;

  Posts({this.title, this.image, this.time, this.likes});

  static List<Posts> allPosts() {
    var lstOfPostss = new List<Posts>();
    lstOfPostss.add(new Posts(
        title: "Chicken Burger",
        time: "1/12/2020 12:00",
        likes: "20",
        image: "burger.jpg"));
    lstOfPostss.add(new Posts(
        title: "Tacos ",
        time: "11/11/2020 14:00",
        likes: "35",
        image: "taco.jpg"));
    lstOfPostss.add(new Posts(
        title: "oasta with meatballs ",
        time: "10/11/2020 17:00",
        likes: "500",
        image: "meat.jpg"));
    lstOfPostss.add(new Posts(
        title: "French Toasts",
        time: "5/10/2020 11:00",
        likes: "20",
        image: "french.jpg"));

    return lstOfPostss;
  }
}

class MyPostsPage extends StatefulWidget {
  static String tag = 'posts-page';
  @override
  _MyPostsPagetState createState() => _MyPostsPagetState();
}

class _MyPostsPagetState extends State<MyPostsPage> {
  final List<Posts> _allPosts = Posts.allPosts();
  final _saved = Set<Posts>();

  //bool _isFavorited = false;
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          title: Text('My Posts'),
          backgroundColor: Colors.redAccent,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context, false),
          ),
        ),
        endDrawer: Drawer(child: new InkWellDrawer()),
        body: new Padding(
            padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
            child: getHomePageBody(context)));
  }

  getHomePageBody(BuildContext context) {
    return ListView.builder(
      itemCount: _allPosts.length,
      itemBuilder: _getItemUI,
      padding: EdgeInsets.all(10.0),
    );
  }

  Widget _getItemUI(BuildContext context, int index) {
    final label = _allPosts[index].likes;
    return new Card(
        child: new Column(
      children: <Widget>[
        Image.asset(
          "images/" + _allPosts[index].image,
          fit: BoxFit.fill,
          width: 300.0,
          height: 200.0,
        ),
        new Text(
          _allPosts[index].title,
          style: new TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
        ),
        new Text(
          _allPosts[index].time,
          style: new TextStyle(fontSize: 10.0),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Icon(
              Icons.favorite,
              color: Colors.red,
            ),
            Text(label),
          ],
        ),
      ],
    ));
  }
}
