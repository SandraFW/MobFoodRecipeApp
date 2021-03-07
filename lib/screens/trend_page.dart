import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'models/post.dart';

class TrendPage extends StatefulWidget {
  static String tag = 'trend-page';
  @override
  _TrendPagetState createState() => _TrendPagetState();
}

class _TrendPagetState extends State<TrendPage> {
  //final List<Posts> _allPosts = Posts.allPosts();
  final _saved = Set<Posts>();

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
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance
          .collection('Posts')
          .orderBy('like', descending: true)
          .limit(30)
          .snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return LinearProgressIndicator();

        return _buildList(context, snapshot.data.documents);
      },
    );
  }

  Widget _buildList(BuildContext context, List<DocumentSnapshot> snapshot) {
    return ListView(
      padding: const EdgeInsets.only(top: 20.0),
      children: snapshot.map((data) => _buildListItem(context, data)).toList(),
    );
  }

  Widget _buildListItem(BuildContext context, DocumentSnapshot data) {
    final document = Posts.fromSnapshot(data);
    Future<bool> onLikeButtonTapped(bool isLiked) async {
      /// send your request here
      //final bool success= await sendRequest();

      Firestore.instance.runTransaction((transaction) async {
        final freshSnapshot = await transaction.get(document.reference);
        final fresh = Posts.fromSnapshot(freshSnapshot);

        await transaction
            .update(document.reference, {'like': fresh.like + 1});
      });

      /// if failed, you can do nothing
      //return success? !isLiked:isLiked;
    }

    return new Card(
      child: new Column(
        children: <Widget>[
          Image.asset(
            "images/" + document.image,
            fit: BoxFit.fill,
            width: 300.0,
            height: 200.0,
          ),
          new Text(
            document.title,
            style: new TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              LikeButton(
                onTap: onLikeButtonTapped,
                size: 20,
                circleColor: CircleColor(
                    start: Color(0xff00ddff), end: Color(0xff0099cc)),
                bubblesColor: BubblesColor(
                  dotPrimaryColor: Color(0xff33b5e5),
                  dotSecondaryColor: Color(0xff0099cc),
                ),
                likeBuilder: (bool isLiked) {
                  return Icon(
                    Icons.favorite,
                    color: isLiked ? Colors.red : Colors.grey,
                    size: 20,
                  );
                },
                likeCount: document.like,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
