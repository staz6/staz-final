import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class Repository {

  Future<void> addFriend(String name, String email, String mobileNo) {
    print("friend add.");
    return FirebaseFirestore.instance.collection('friends').add({
      'name': name,
      'email': email,
      'mobileNo': mobileNo,
    }).then((value) => print(value)).catchError((error)=>print(error));
  }

  Future<void> editFriend(
      String friendId, String name, String email, String mobileNo) {
    return FirebaseFirestore.instance.collection('friends').doc(friendId).update({
      'name': name,
      'email': email,
      'mobileNo': mobileNo,
    });
  }
}
