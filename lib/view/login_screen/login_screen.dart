// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:greatindian/controller/user_provider.dart';
import 'package:greatindian/view/otp_screen/otp_screen.dart';
import 'package:provider/provider.dart';
import 'widgets/logo_widget.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final TextEditingController phoneNumberController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context, listen: false);

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
              const LogoWidget(),
              SizedBox(height: height * 0.04),
              Container(
                height: height * 0.05,
                width: width * 0.75,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: const BorderRadius.all(Radius.circular(25)),
                ),
                child: Row(
                  children: [
                    SizedBox(width: width * 0.04),
                    const Text(
                      '+91 ',
                      style: TextStyle(fontSize: 18, color: Colors.black),
                    ),
                    SizedBox(
                      width: width * 0.03,
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: height * 0.01),
                      child: const Text(
                        '|',
                        style: TextStyle(fontSize: 33, color: Colors.grey),
                      ),
                    ),
                    SizedBox(
                      width: width * 0.02,
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(top: height * 0.02),
                        child: TextField(
                          controller: phoneNumberController,
                          keyboardType: TextInputType.number,
                          onChanged: (value) {},
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Phone Number',
                            hintStyle:
                                TextStyle(color: Colors.grey, fontSize: 18),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: height * 0.02),
              TextButton(
                onPressed: () async {
                  String phoneNumber = phoneNumberController.text;
                  await userProvider.getOTP(phoneNumber);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const OtpScreen(),
                      ));
                },
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
            ],
          ),
        ),
      ),
    );
  }
}
