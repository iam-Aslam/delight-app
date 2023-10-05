import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:greatindian/view/home_screen/home_screen.dart';
import 'package:pinput/pinput.dart';

import '../../constants/app_themes.dart';
import '../login_screen/widgets/logo_widget.dart';
import 'widgets/edit_phone_widget.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //  final userProvider = Provider.of<UserProvider>(context, listen: false);

    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: height * 0.1),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Enter OTP',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 27),
              ),
              SizedBox(height: height * 0.04),
              const LogoWidget(),
              SizedBox(height: height * 0.04),
              Pinput(
                defaultPinTheme: AppConstantThemes.defaultPinTheme,
                focusedPinTheme: AppConstantThemes.focusedPinTheme,
                submittedPinTheme: AppConstantThemes.submittedPinTheme,
                validator: (s) {
                  return s == '222222' ? null : 'Pin is incorrect';
                },
                length: 6,
                pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                showCursor: true,
                onCompleted: (pin) => log(pin.toString()),
              ),
              SizedBox(height: height * 0.02),
              TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomeScreen(),
                      ));
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.orange),
                  fixedSize: MaterialStateProperty.all(
                      Size(width * 0.75, height * 0.05)),
                ),
                child: const Text(
                  'Verify',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ),
              const EditPhoneNumber()
            ],
          ),
        ),
      ),
    );
  }
}
