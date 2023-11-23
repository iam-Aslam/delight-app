import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:greatindian/model/user_model.dart';

class UserProvider extends ChangeNotifier {
  addUser(UserModel model) async {
    final user = FirebaseFirestore.instance.collection('user');
    final reference = user.doc();
    try {
      await reference.set({
        'id': reference.id,
        'name': model.name,
        'email': model.email,
        'company': model.company,
        'place': model.place,
      }).then((value) {
        log('User Added Successfully');
        notifyListeners();
      });
    } catch (e) {
      log("Failed to add product: $e");
    }
  }
}
