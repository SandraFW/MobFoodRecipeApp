import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.yellow[50],
        body: ListView(children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 15.0, left: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.arrow_back_ios),
                  color: Colors.black,
                  onPressed: () {},
                ),
                Container(
                    width: 125.0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    ))
              ],
            ),
          ),
          SizedBox(height: 25.0),
          Padding(
            padding: EdgeInsets.only(left: 40.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Forget Password ?',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 25.0)),
                ),
                SizedBox(width: 10.0),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Text(
                      'please enter your email to receive the instruction to reset your password',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          color: Colors.grey,
                          fontSize: 13.0)),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    keyboardType: TextInputType.name,
                    autofocus: true,
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      border: InputBorder.none,
                      hintText: 'First Name',
                      contentPadding:
                          EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ]));
  }
}
