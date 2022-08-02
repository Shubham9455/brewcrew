import 'package:brewcrew/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        title: Text('Sign in to Brew Crew'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: ElevatedButton(child: "SIGN IN".text.make(),onPressed:() async{
          dynamic results = await _auth.signInAnon();
          if(results == null){
            print("NULL");
          }else{
            print("SIGNEDIN");
            print(results.uid);
          }
        } ,
        style: ButtonStyle(backgroundColor: MaterialStateProperty.all( Colors.brown[600],)),
        ), 
      ),

    );
  }
}