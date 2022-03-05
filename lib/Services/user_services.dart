import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_auth/firebase_auth.dart';

import '../Models/user_model.dart';

class UserServices {
  ///Create User
  Future createUser(UserModel userModel) async {
    DocumentReference docRef = FirebaseFirestore.instance
        .collection("RentalShopUsersCollection")
        .doc(userModel.userID);
    return await docRef.set(userModel.toJson(docRef.id));
  }

  ///Fetch User Record
  Stream<UserModel> fetchUserRecord(String userID) {
    return FirebaseFirestore.instance
        .collection("RentalShopUsersCollection")
        .doc(userID)
        .snapshots()
        .map((userData) => UserModel.fromJson(userData.data()!));
  }

  ///Update user record with Image

  Future updateUserDetailswithImage(UserModel userModel) async {
    return await FirebaseFirestore.instance
        .collection("RentalShopUsersCollection")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .set({
      //"firstName": userModel.firstName,
     // "userNumber": userModel.userNumber,
      "userImage": userModel.userImage,
    }, SetOptions(merge: true));
  }

  ///Update user record with Image

  Future updateUserDetailsWithoutImage(UserModel userModel) async {
    return await FirebaseFirestore.instance
        .collection("RentalShopUsersCollection")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .set({
    //  "firstName": userModel.firstName,
    //  "userNumber": userModel.userNumber,
     // "userImage": userModel.userImage,
    }, SetOptions(merge: true));
  }
}
