import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../utilities/validate_function.dart';

class UserProvider with ChangeNotifier {
  bool _isSendingOTP = false;
  bool get isSendingOTP => _isSendingOTP;

  // Future<void> sendOTP(String phoneNumber) async {
  //   try {
  //     // Set isSendingOTP to true while sending OTP
  //     _isSendingOTP = true;
  //     notifyListeners();

  //     // Call the Firebase Cloud Function to send OTP
  //     // Replace 'YOUR_CLOUD_FUNCTION_URL' with the actual URL of your Firebase Cloud Function
  //     await YOUR_CLOUD_FUNCTION_URL.call({'phoneNumber': phoneNumber});

  //     // Reset isSendingOTP to false after sending OTP
  //     _isSendingOTP = false;
  //     notifyListeners();
  //   } catch (error) {
  //     // Handle any errors here
  //   }
  // }
  getOTP(String phoneNumber) {
    if (Validaters.isPhoneNumberValid(phoneNumber)) {
    } else {
      // Phone number is invalid, show a toast message
      Fluttertoast.showToast(
        msg: "Invalid phone number",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    }
  }
}
