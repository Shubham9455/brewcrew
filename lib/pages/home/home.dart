import 'package:brewcrew/models/brew.dart';
import 'package:brewcrew/pages/home/brew_list.dart';
import 'package:brewcrew/pages/home/settings_form.dart';
import 'package:brewcrew/services/auth.dart';
import 'package:brewcrew/services/database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    void _showSettingsPanel() {
      showModalBottomSheet(context: context, builder: (context) {
        return Container(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
          child: SettingsForm(),
        );
      });
    }
    return StreamProvider<List<Brew>>.value(
      initialData: [],
      value: DataBaseService().brews,
      child: Container(
        child: Scaffold(
          backgroundColor: Colors.brown[50],
          appBar: AppBar(
            title: Text('Brew Crew'),
            backgroundColor: Colors.brown[400],
            elevation: 0.0,
            actions: <Widget>[
              FlatButton.icon(
                icon: Icon(Icons.logout),
                label: Text(''),
                onPressed: () async {
                  await _auth.signout();
                },
              ),
              FlatButton.icon(
              icon: Icon(Icons.settings),
              label: Text(''),
              onPressed: () => _showSettingsPanel(),
            )
            ],
          ),
          body: Container(
            
            decoration: BoxDecoration(image: DecorationImage(
              image: AssetImage("assets/coffee_bg.png"),
              fit: BoxFit.cover
              )),
            child: BrewList()
            ),
        ),
      ),
    );
  }
}