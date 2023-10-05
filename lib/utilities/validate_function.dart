class Validaters {
  static bool isPhoneNumberValid(String phoneNumber) {
    RegExp regex = RegExp(r'^\d{10}$');
    return regex.hasMatch(phoneNumber);
  }
}
