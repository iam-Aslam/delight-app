class UserModel {
  String name;
  String email;
  String company;
  String place;
  String latitude;
  String longitude;
  UserModel(
      {required this.name,
      required this.email,
      required this.company,
      required this.place,
      this.latitude = '',
      this.longitude = ''});
}
