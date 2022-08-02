import 'package:brewcrew/models/user_class.dart';
import 'package:brewcrew/pages/authenticate/auth_page.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService{
  final FirebaseAuth _auth = FirebaseAuth.instance;
  
  MyUser? _userFromFirebaseuser(User? user){
    return user!=null? MyUser(uid: user.uid):null;
  }
  Stream<MyUser?> get user{
    // return _auth.authStateChanges();
    return _auth.authStateChanges().map(_userFromFirebaseuser);
  }


  //sign in Anon 
  Future signInAnon() async{
    try{
      UserCredential result = await _auth.signInAnonymously();
      User? user = result.user;
      return _userFromFirebaseuser(user);
    } catch(e){
      print(e.toString());
      return null;
    }
  }

  //register email password

  //sign in google 

  //sign out

}