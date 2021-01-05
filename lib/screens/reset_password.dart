import 'package:flutter/material.dart';
import 'forget_password.dart';
import 'main_page.dart';

class Reset extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ResetPass(),
    );
  }
}


class ResetPass extends StatefulWidget {
  @override
  _ResetPassState createState() => _ResetPassState();
}


class _ResetPassState extends State<ResetPass> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  void validate() {
    if (formkey.currentState.validate()) {
      print('Validated');
    }
    print('Not validated');
  }

  String emailValidation(value) {
    if (value.isEmpty) {
      return 'Please enter the code';
    } 
      return null;
  }

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
                  onPressed: () {
                    if (formkey.currentState.validate()) {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return ForgetPass();
                      }));
                    }
                  },
                ),
              ],
            ),
          ),
          SizedBox(height: 25.0),
          Padding(
            padding: EdgeInsets.only(left: 10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Reset Your Password',
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
                  child: Text('please enter the code to retrieve your account.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          color: Colors.grey,
                          fontSize: 13.0)),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Center(
                    child: Form(
                      // ignore: deprecated_member_use
                      autovalidate: true,
                      key: formkey,
                      child: Column(
                        children: <Widget>[
                          TextFormField(
                              validator: emailValidation,
                              autofocus: true,
                              decoration: InputDecoration(
                                fillColor: Colors.white,
                                filled: true,
                                border: InputBorder.none,
                                hintText: 'Enter the 6 digits..',
                                contentPadding:
                                    EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                              ))
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: 290,
                    height: 50,
                    child: RaisedButton(
                        onPressed: () {
                          if (formkey.currentState.validate()) {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return MainPage();
                            }));
                          }
                        },
                        color: Colors.red[400],
                        child: Text("Submit",
                            style: TextStyle(color: Colors.white))),
                  ),
                )
              ],
            ),
          ),
        ]));
  }
}
