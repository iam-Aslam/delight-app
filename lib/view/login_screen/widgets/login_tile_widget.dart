// ignore_for_file: camel_case_types
import 'package:flutter/material.dart';

class LoginScreen_Tile extends StatelessWidget {
  const LoginScreen_Tile({
    super.key,
    required this.height,
    required this.width,
    required this.phoneNumberController,
  });

  final double height;
  final double width;
  final TextEditingController phoneNumberController;

  @override
  Widget build(BuildContext context) {
    return Container(
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
                  hintStyle: TextStyle(color: Colors.grey, fontSize: 18),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
