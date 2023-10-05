import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'widgets/login_tile_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController phoneNumberController = TextEditingController();
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
                'Log in',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 27),
              ),
              SizedBox(height: height * 0.04),
              Center(
                child: Lottie.asset(
                  'assets/lottie/animation_lmuir2kx.json',
                  height: height * 0.3,
                  width: width * 0.62,
                  repeat: true,
                  reverse: true,
                  animate: true,
                ),
              ),
              SizedBox(height: height * 0.04),
              LoginScreen_Tile(
                height: height,
                width: width,
                phoneNumberController: phoneNumberController,
              ),
              SizedBox(height: height * 0.02),
              TextButton(
                onPressed: () {},
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.orange),
                  fixedSize: MaterialStateProperty.all(
                      Size(width * 0.75, height * 0.05)),
                ),
                child: const Text(
                  'Get OTP',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ),
              SizedBox(height: height * 0.03),
              const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'By Signing up, you agree with Terms',
                    style: TextStyle(color: Colors.grey),
                  ),
                  Text(
                    'and Conditions.',
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
