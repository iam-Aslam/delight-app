import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;
    return Center(
      child: Lottie.asset(
        'assets/lottie/animation_lmuir2kx.json',
        height: height * 0.4,
        width: width * 0.62,
        repeat: true,
        reverse: true,
        animate: true,
      ),
    );
  }
}
