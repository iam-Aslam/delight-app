// ignore_for_file: must_be_immutable, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:greatindian/constants/app_colors.dart';
import 'package:greatindian/controller/user_provider.dart';
import 'package:greatindian/model/user_model.dart';
import 'package:greatindian/view/products_screen/products_screen.dart';
import 'package:provider/provider.dart';
import 'widgets/formfield_widget.dart';
import 'widgets/header_widget.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  TextEditingController nameController = TextEditingController();
  TextEditingController companyController = TextEditingController();
  TextEditingController placeController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final userProvider = Provider.of<UserProvider>(context, listen: false);

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
                  controller: nameController,
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
                  controller: companyController,
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
                      if (formKey.currentState!.validate()) {
                        UserModel user = UserModel(
                          name: nameController.text.trim(),
                          email: emailController.text.trim(),
                          place: placeController.text.trim(),
                          company: companyController.text.trim(),
                        );
                        if (await userProvider.addUser(user)) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const AllProductsScreen(),
                              ));
                        }
                      }
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
