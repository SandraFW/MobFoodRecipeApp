import 'package:firebase_auth/firebase_auth.dart';
import 'package:screentwo/models/user.dart';

class AuthService{
  
  //function to create a user object based on FirebaseUser
  Users _userFromFirebaseUser(User user){
    return user != null ? Users(uid: user.uid) : null;
  }

  //auth change user stream
  Stream<Users> get user {
    return _auth.authStateChanges()
    .map((User user) => _userFromFirebaseUser(user));
  }


  // creating an instance from firebase authentication 
  final FirebaseAuth _auth = FirebaseAuth.instance;

 
  Future register(String email, String password) async{
    try{
      UserCredential result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      User user = result.user;
      return _userFromFirebaseUser(user);

    }catch(e){
       print(e.toString());
       return null;

    }

  }

 
  Future signout() async{
   try{
     return await _auth.signOut();

   } catch(e){
     print(e.toString());
     return null;

   }
  }
}
