import 'package:flutter/material.dart';

class EditPhoneNumber extends StatelessWidget {
  const EditPhoneNumber({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    var width = size.width;
    return GestureDetector(
      onTap: () => Navigator.pop(context),
      child: Padding(
        padding: EdgeInsets.only(left: width * 0.04),
        child: const Row(
          children: [
            Text(
              'Edit Phone Number ?',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.w400),
            ),
          ],
        ),
      ),
    );
  }
}
