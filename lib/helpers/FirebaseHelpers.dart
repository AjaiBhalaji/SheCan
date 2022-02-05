import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shecan/models/user_profile.dart';

class FirebaseHelpers {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  static Future<bool> checkUserExists(String? userId) async {
    CollectionReference usersRef =
        FirebaseFirestore.instance.collection('users');
    final doc = await usersRef.doc(userId).get();
    if (doc.exists) {
      print('exists');
      return true;
    } else {
      return false;
    }
  }

  static addUser(UserProfile user) async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(user.uid)
        .set({
          'name': user.name,
          'age': user.age,
          'phone': user.phone,
        })
        .then((value) => true)
        .catchError((onError) {
          print("insert error " + onError);
          return false;
        });
  }

  static Future<UserProfile> getUser(String? uid) async {
    final value =
        await FirebaseFirestore.instance.collection('users').doc(uid).get();
    final name = (value.data()?['name']);
    final age = (value.data()?['age']);
    final phone = (value.data()?['phone']);
    return UserProfile(name: name, age: age, phone: phone, uid: uid);
  }
}
