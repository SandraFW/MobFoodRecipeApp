import 'package:flutter/material.dart';
import 'trend_page.dart';

class CompleteProfile extends StatefulWidget {
  static String tag = 'complete-page';
  @override
  _CompleteProfileState createState() => new _CompleteProfileState();
}

class _CompleteProfileState extends State<CompleteProfile> {
  @override
  Widget build(BuildContext context) {
    final welcome = Padding(
      padding: EdgeInsets.all(10.0),
      child: Text(
        'Create your Profile',
        textAlign: TextAlign.center,
        style: TextStyle(
            fontWeight: FontWeight.bold, fontSize: 25.0, color: Colors.black),
      ),
    );

    final logo = Center(
      child: CircleAvatar(
        //backgroundColor: Colors.transparent,
        radius: 60.0,
        child: Image.asset('images/logo.png'),
      ),
    );

    final firstname = TextFormField(
      keyboardType: TextInputType.name,
      autofocus: true,
      decoration: InputDecoration(
        hintText: 'First Name',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0)),
      ),
    );

    final lastname = TextFormField(
      keyboardType: TextInputType.name,
      autofocus: true,
      decoration: InputDecoration(
        hintText: 'Last Name',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0)),
      ),
    );

    final loginButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 10.0),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        onPressed: () {
          Navigator.of(context).pushNamed(TrendPage.tag);
        },
        padding: EdgeInsets.all(15.0),
        color: Colors.deepOrangeAccent,
        child: Text('Done', style: TextStyle(color: Colors.white)),
      ),
    );

    final forgotLabel = Text(
      " By signing up you agree to our Terms of Use and Privacy Policy ",
      style: TextStyle(fontSize: 12.0, color: Colors.grey),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.only(left: 24.0, right: 24.0),
          children: <Widget>[
            new IconButton(
              icon: new Icon(Icons.arrow_back),
              alignment: Alignment.topLeft,
              onPressed: () => Navigator.of(context).pop(null),
            ),
            welcome,
            SizedBox(height: 8.0),
            logo,
            SizedBox(height: 8.0),
            firstname,
            SizedBox(height: 8.0),
            lastname,
            SizedBox(height: 24.0),
            loginButton,
            forgotLabel
          ],
        ),
      ),
    );
  }
}
