import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ToastClass {
  static void showToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.orange,
      textColor: Colors.white,
    );
  }
}
