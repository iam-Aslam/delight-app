import 'package:flutter/material.dart';

class PhoneFeild extends StatelessWidget {
  const PhoneFeild({
    super.key,
    required this.controller,
    required this.hint,
  });

  final TextEditingController controller;
  final String hint;

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: TextInputType.number,
      controller: controller,
      decoration: InputDecoration(
          border: const OutlineInputBorder(),
          labelText: hint,
          hintText: '+91  |  Phone Number',
          floatingLabelBehavior: FloatingLabelBehavior.always),
    );
  }
}
