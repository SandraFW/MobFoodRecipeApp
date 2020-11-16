import 'package:flutter/material.dart';
import 'complete_profile.dart';
import 'package:email_validator/email_validator.dart';

class Create extends StatefulWidget{
 _Create createState() => _Create();
}


class _Create extends State<Create> {
  // This widget is the root of your application.
  final _formKey1 = GlobalKey<FormState>();
  final _formKey2 = GlobalKey<FormState>();
  final _formKey3 = GlobalKey<FormState>();
  String _email;
  final TextEditingController _password = TextEditingController();
  final TextEditingController _confirmpassword = TextEditingController();

  
  @override
  Widget build(BuildContext context) {
    

    return MaterialApp(
      title: "screen two",
      home: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: ListView( 
            children: [
              Column(
                 crossAxisAlignment: CrossAxisAlignment.center,
                 mainAxisAlignment: MainAxisAlignment.start,
                 children: [
              
              Container(
                margin: const EdgeInsets.only(right: 330.0, top: 20.0),
                child: Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 10.0, top: 45.0),
              ),
              Text(
                'Create your account',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 23,
                ),
              ),
              Padding(padding: const EdgeInsets.only(top: 20.0)),

           
                   CreateAccount(_formKey1),
                  
              Container(
                margin: const EdgeInsets.only(top: 20.0),
                width: 200.0,
                height: 50.0,
                child: RaisedButton(
                  onPressed: () {
                    if(_formKey1.currentState.validate()){
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return CompleteProfile();
                    }));
                    }
                    else {
                      return "unsuccessful";
                    }
                  },
                  color: Colors.redAccent,
                  textColor: Colors.white,
                  child: Container(
                    child: Text('Next', style: TextStyle(fontSize: 20)),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 20.0),
                child: Text(
                  'By signing up you agree to our Terms of Use \nand Privacy Policy',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                  ),
                ),
              ),
            ],
          ),
          ],
          ),
      ),
    ),
    );
  }
  Column CreateAccount(key) {
  return Column(
    children: [
      Container(
        margin: const EdgeInsets.only(left: 50.0, right: 50.0, top: 15.0),
        padding: const EdgeInsets.only(top: 10.0),
        child: Form(  
        key: key,
        child: Column(
        children: [
        TextFormField(
        autofocus: true,
        validator: (value) {
          if(value.isEmpty){
            return "This Field is Empty";
          }
          else if(!EmailValidator.validate(value)){
            return "The email you inserted is not valid";
          }
          return null;
        },
        onSaved: (String email){
          _email = email;
        },
        decoration: InputDecoration(
          hintText: "Email",
          fillColor: Colors.grey[50],
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
        ),
        ),
        Container(
           padding: const EdgeInsets.only(top: 15.0),
        ),

        TextFormField(
        autofocus: true,
        controller: _password,
        validator: (value) {
          if(value.isEmpty){
            return "This Field is Empty";
          }
          return null;
        },
        onSaved: (String password){
          _password.text = password;
        },
        decoration: InputDecoration(
          hintText: "Password",
          fillColor: Colors.grey[50],
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
        ),
        ),
         Container(
           padding: const EdgeInsets.only(top: 15.0),
        ),

         TextFormField(
        autofocus: true,
        controller: _confirmpassword,
        validator: (value) {
          if(value.isEmpty){
            return "This Field is Empty";
          }
          else if(value != _password.text){
             return "password does not match";
          }
          return null;
        },
        onSaved: (String confirmpassword){
          _confirmpassword.text = confirmpassword;
        },
        decoration: InputDecoration(
          hintText: "Confirm Password",
          fillColor: Colors.grey[50],
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
        ),
        ),
        ],
        ),
        ),
      ),
    ],
  );
}

}
