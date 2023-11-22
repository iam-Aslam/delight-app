// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:greatindian/constants/app_colors.dart';
import 'widgets/formfield_widget.dart';
import 'widgets/header_widget.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  TextEditingController userNameController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController placeController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    // final userProvider = Provider.of<UserProvider>(context, listen: false);

    return SafeArea(
      child: Scaffold(
          body: Padding(
        padding: EdgeInsets.only(
          left: size.width / 12,
          right: size.width / 10,
          top: size.height / 20,
        ),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                const HeaderWidget(),
                SizedBox(
                  height: size.height / 20,
                ),
                FormFeild(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Enter Username";
                    }
                    return value;
                  },
                  hint: 'Username',
                  controller: userNameController,
                ),
                FormFeild(
                  validator: (value) {
                    if (value!.isEmpty ||
                        !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            .hasMatch(value)) {
                      return "Enter Valid Email";
                    } else {
                      return value;
                    }
                  },
                  hint: 'Email',
                  controller: emailController,
                ),
                FormFeild(
                  hint: 'Company Name',
                  controller: nameController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Enter Name";
                    } else {
                      return value;
                    }
                  },
                ),
                FormFeild(
                  hint: 'Place',
                  controller: placeController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Enter Place";
                    } else {
                      return value;
                    }
                  },
                ),
                // Padding(
                //   padding: EdgeInsets.only(bottom: size.height / 20),
                //   child: PhoneFeild(
                //     hint: 'Phone',
                //     controller: phoneController,
                //   ),
                // ),
                SizedBox(
                  width: size.width / 1,
                  height: size.height / 16,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0)),
                      backgroundColor: Colors.orange,
                      foregroundColor: Colors.white,
                    ),
                    onPressed: () async {
                      // if (formKey.currentState!.validate()) {
                      //   User user = User(
                      //     name: nameController.text.trim(),
                      //     email: emailController.text.trim(),
                      //     password: passwordController.text.trim(),
                      //     country: "91",
                      //     phoneNumber: phoneController.text.trim(),
                      //     userName: userNameController.text.trim(),
                      //   );
                      //   if (await userProvider.signUp(user)) {
                      //     Navigator.push(
                      //         context,
                      //         MaterialPageRoute(
                      //           builder: (context) => const LoginScreen(),
                      //         ));
                      //   }
                      // }
                    },
                    child: const Text(
                      'Confirm  ',
                      style: TextStyle(color: AppColors.kWhite),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      )),
    );
  }
}
