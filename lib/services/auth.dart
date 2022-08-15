import 'package:brewcrew/models/user_class.dart';
import 'package:brewcrew/pages/authenticate/auth_page.dart';
import 'package:brewcrew/services/database.dart';
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
  // sign in with email and password
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      User? user = result.user;
      return user;
    } catch (error) {
      print(error.toString());
      return null;
    } 
  }

  // register with email and password
  Future registerWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      User? user = result.user;
      await DataBaseService(uid:_userFromFirebaseuser(user)!.uid).updateUserData('0', 'new member', 100);
      return _userFromFirebaseuser(user);
    } catch (error) {
      print(error.toString());
      return null;
    } 
  }

  //sign in google 

  //sign out
  Future signout() async{
    try{
      print("Signing Out!!");
      return await _auth.signOut();
    }catch(e){
      print(e.toString());
      return null;
    }
  }

}