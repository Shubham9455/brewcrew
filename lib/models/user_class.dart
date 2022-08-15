class MyUser{
  final String uid;

  MyUser({required this.uid});
}

class UserData{
  final String uid;
  final String name;
  final String sugars;
  final int strength;

  UserData(this.uid, this.name, this.sugars, this.strength);
}