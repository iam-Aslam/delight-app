import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:greatindian/model/user_model.dart';
import 'package:greatindian/utilities/popup.dart';

class UserProvider extends ChangeNotifier {
  String? userReferance;
  String? userName;
  String? userEmail;
  String? userCompany;
  String? userPlace;
  addUser(UserModel model) async {
    final user = FirebaseFirestore.instance.collection('user');
    final reference = user.doc();
    userReferance = reference.id;
    try {
      await reference.set({
        'id': reference.id,
        'name': model.name,
        'email': model.email,
        'company': model.company,
        'place': model.place,
      }).then((value) {
        ToastClass.showToast('User Details Added Successfully');
        notifyListeners();
      });
    } catch (e) {
      log("Failed to add product: $e");
    }
  }

  getUser() async {
    if (userReferance != null) {
      try {
        final user = FirebaseFirestore.instance.collection('user');
        final documentSnapshot = await user.doc(userReferance).get();
        if (documentSnapshot.exists) {
          userName = documentSnapshot['name'];
          userEmail = documentSnapshot['email'];
          userCompany = documentSnapshot['company'];
          userPlace = documentSnapshot['place'];
          notifyListeners();
        }
      } catch (e) {
        log("Failed to fetch user details: $e");
      }
    }
  }
}
