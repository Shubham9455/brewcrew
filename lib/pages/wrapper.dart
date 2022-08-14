import 'package:brewcrew/models/user_class.dart';
import 'package:brewcrew/pages/authenticate/auth_page.dart';
import 'package:brewcrew/pages/home/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<MyUser?>(context);
    print("user is printed:");
    print(user?.uid);
    // return AuthPage();
    if(user == null){
      return AuthPage();
    }else{
      return HomePage();
    }

  }
}