import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertest/model/app_user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseAppAuthService {
  FirebaseAppAuthService._privateConstructor();

  static final FirebaseAppAuthService _instance =
      FirebaseAppAuthService._privateConstructor();

  factory FirebaseAppAuthService() {
    return _instance;
  }

  //signin first time call
  Future<String> signIn(String email, String password) async {
    UserCredential user = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
    return user.user!.uid;
  }

  //sign out call
  Future<void> signOut() async {
    //sign out from auth
    FirebaseAuth.instance.signOut();
  }

//get curernt user
  Future<User> getCurrentFirebaseUser() async {
    User currentUser = FirebaseAuth.instance.currentUser!;
    return currentUser;
  }

  //get user from firebase
  Future<AppUser?> getUserFirestore(String userId) async {
    // ignore: unnecessary_null_comparison
    if (userId != null) {
      return FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .get()
          .then((documentSnapshot) =>
              AppUser.fromDocument(documentSnapshot.data()));
    } else {
      return null;
    }
  }

  //update user details
  Future updateUserDetails(AppUser user) async {
    await checkUserExist(user.userId).then((value) async {
      if (value) {       
        await FirebaseFirestore.instance
            .collection("users")
            .doc("${user.userId}")
            .update({"profile_pic_url": user.photoUrl});
      }
    });
  }

  //check user in database
  Future<bool> checkUserExist(String userId) async {
    bool exists = false;
    try {
      await FirebaseFirestore.instance
          .collection("users")
          .doc("$userId")
          .get()
          .then((doc) {
        if (doc.exists) {
          exists = true;
        } else {
          exists = false;
        }
      });
      return exists;
    } catch (e) {
      return false;
    }
  }
}
