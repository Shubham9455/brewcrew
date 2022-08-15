import 'package:brewcrew/models/brew.dart';
import 'package:brewcrew/models/user_class.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DataBaseService{
  final String? uid;
  
  final CollectionReference brewCollection = FirebaseFirestore.instance.collection("brews");

  DataBaseService({this.uid});

  Future updateUserData(String sugar,String name, int strength)async{
    return await brewCollection.doc(uid).set({
      "sugars":sugar,
      "name":name,
      "strength":strength,
    });
  }
  // get brew List from snapshot
  List<Brew> _brewListFromSnapshot(QuerySnapshot snapshot){
    return snapshot.docs.map((e) {
      Map<String, dynamic> data = e.data() as Map<String, dynamic>;
      print("E.data():" + data.toString());
      return Brew(sugar: data['sugars']??'', name: data['name']??'', strength: data['strength']??0);
    }).toList();
  }

  // get brew Stram
  Stream <List<Brew>> get brews {
    return brewCollection.snapshots()
    .map(_brewListFromSnapshot);
  }
  // get user data
  Stream <UserData> get userData {
    return brewCollection.doc(uid).snapshots()
    .map(_userdataFromSnapshot);
  }

  UserData _userdataFromSnapshot(DocumentSnapshot snapshot){
    Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
    return UserData(uid!,data['name'],data['sugars'],data['strength']);
  }
}