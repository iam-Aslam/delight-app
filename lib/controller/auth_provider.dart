// ignore_for_file: use_build_context_synchronously
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:greatindian/utilities/popup.dart';
import 'package:greatindian/view/home_screen/home_screen.dart';
import 'package:greatindian/view/otp_screen/otp_screen.dart';

import '../utilities/validate_function.dart';

class AuthProvider with ChangeNotifier {
  FirebaseAuth auth = FirebaseAuth.instance;
  bool isSendingOTP = false;
  String otp = "";
  String verifiyer = "";
  Future<void> sendOTP(String phoneNumber, BuildContext context) async {
    try {
      isSendingOTP = true;
      notifyListeners();
      await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: '+91$phoneNumber',
        verificationCompleted: (PhoneAuthCredential credential) {},
        verificationFailed: (FirebaseAuthException e) {},
        codeSent: (String verificationId, int? resendToken) {
          verifiyer = verificationId;
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const OtpScreen(),
              ));
        },
        codeAutoRetrievalTimeout: (String verificationId) {},
      );
      isSendingOTP = false;
      notifyListeners();
    } catch (error) {
      ToastClass.showToast(error.toString());
    }
  }

  verifyOTP(String smsCode, BuildContext context) async {
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: verifiyer, smsCode: smsCode);
      await auth.signInWithCredential(credential);
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => HomeScreen(),
          ));
    } catch (e) {
      ToastClass.showToast('Invalid verification code');
    }
  }

  getOTP(String phoneNumber, BuildContext context) async {
    if (Validaters.isPhoneNumberValid(phoneNumber)) {
      await sendOTP(phoneNumber, context);
    } else {
      ToastClass.showToast('Invalid Phone Number');
    }
  }

  updateOTP(String value) {
    otp = value;
    notifyListeners();
  }
}
