import 'package:cloud_firestore/cloud_firestore.dart';

class Repository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> addFriend(String name, String email, String mobileNo) {
    print("friend add.");
    return _firestore.collection('friends').add({
      'name': name,
      'email': email,
      'mobileNo': mobileNo,
    });
  }

  Future<void> editFriend(
      String friendId, String name, String email, String mobileNo) {
    return _firestore.collection('friends').doc(friendId).update({
      'name': name,
      'email': email,
      'mobileNo': mobileNo,
    });
  }
}
