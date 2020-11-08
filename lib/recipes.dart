import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListView(children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("5 Results",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
              ),
              Column(
                children: [
                  IconButton(icon: Icon(Icons.filter_list), onPressed: () {}),
                ],
              )
            ],
          ),
          Container(
              height: 500,
              child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: 5,
                  itemBuilder: (_, index) {
                    return Padding(
                        padding: EdgeInsets.all(4),
                        child: Container(
                          height: 242,
                          decoration:
                              BoxDecoration(color: Colors.white, boxShadow: [
                            BoxShadow(
                              color: Colors.grey,
                            )
                          ]),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Image.asset(
                                "images/food1.jpeg",
                                height: 170,
                                width: 310,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Row(children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.all(1.0),
                                      child: Text(
                                        "Roasted Vegetables",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18),
                                      ),
                                    )
                                  ]),
                                  Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Padding(
                                            padding: const EdgeInsets.all(1.0),
                                            child: Text(
                                              "this is hands down the best way to cook vegetables.",
                                              style: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 12),
                                            )),
                                        Padding(
                                            padding: const EdgeInsets.all(1.0),
                                            child: Icon(
                                              Icons.favorite_border,
                                              size: 25,
                                              color: Colors.redAccent,
                                            )),
                                      ]),
                                  Row(
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.all(1.0),
                                        child: Text('4.7',
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.grey)),
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.redAccent,
                                        size: 18,
                                      )
                                    ],
                                  )
                                ],
                              )
                            ],
                          ),
                        ));
                  }))
        ]),
      ),
    );
  }
}
