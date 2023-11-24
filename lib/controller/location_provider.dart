import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:greatindian/utilities/popup.dart';
import 'package:permission_handler/permission_handler.dart';

class LocationProvider with ChangeNotifier {
  double? latitude;
  double? longitude;

  Future<void> getLocation() async {
    var status = await Permission.location.request();
    if (status != PermissionStatus.granted) {
      ToastClass.showToast('Location permission denied');

      return;
    }

    try {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      latitude = position.latitude;
      longitude = position.longitude;
      print(latitude);
      print(longitude);
      notifyListeners();
    } catch (e) {
      ToastClass.showToast(e.toString());
    }
  }
}
