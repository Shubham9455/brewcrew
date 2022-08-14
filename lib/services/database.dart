import 'package:cloud_firestore/cloud_firestore.dart';

class DataBaseService{
  final String uid;
  
  final CollectionReference brewCollection = FirebaseFirestore.instance.collection("brews");

  DataBaseService(this.uid);

  Future updateUserData(String sugar,String name, int strength)async{
    return await brewCollection.doc(uid).set({
      "sugars":sugar,
      "name":name,
      "strength":strength,
    });
  }
}