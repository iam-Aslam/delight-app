// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class FormFeild extends StatelessWidget {
  const FormFeild({
    Key? key,
    required this.hint,
    required this.controller,
    this.validator,
  }) : super(key: key);
  final String hint;
  final TextEditingController controller;
  final String Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.only(bottom: size.height / 20),
      child: TextField(
        controller: controller,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
            border: const OutlineInputBorder(),
            labelText: hint,
            floatingLabelBehavior: FloatingLabelBehavior.always),
      ),
    );
  }
}
