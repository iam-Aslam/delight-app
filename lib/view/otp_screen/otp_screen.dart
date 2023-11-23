import 'package:flutter/material.dart';
import 'package:greatindian/controller/auth_provider.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';
import '../../constants/app_themes.dart';
import '../login_screen/widgets/logo_widget.dart';
import 'widgets/edit_phone_widget.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<AuthProvider>(context, listen: false);
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
                    fontStyle: FontStyle.italic,
                    fontSize: 27),
              ),
              SizedBox(height: height * 0.04),
              const LogoWidget(),
              SizedBox(height: height * 0.04),
              Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8),
                child: Pinput(
                  defaultPinTheme: AppConstantThemes.defaultPinTheme,
                  focusedPinTheme: AppConstantThemes.focusedPinTheme,
                  submittedPinTheme: AppConstantThemes.submittedPinTheme,
                  length: 6,
                  pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                  showCursor: true,
                  onCompleted: (pin) => userProvider.updateOTP(pin),
                ),
              ),
              SizedBox(height: height * 0.02),
              TextButton(
                onPressed: () async {
                  await userProvider.verifyOTP(userProvider.otp, context);
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.orange),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  fixedSize: MaterialStateProperty.all(
                      Size(width * 0.95, height * 0.05)),
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
