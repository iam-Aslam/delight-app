import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:greatindian/utilities/popup.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:url_launcher/url_launcher.dart';

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
      log(latitude.toString());
      log(longitude.toString());
      notifyListeners();
    } catch (e) {
      ToastClass.showToast(e.toString());
    }
  }

  Future<void> openGoogleMap(double latitude, double longitude) async {
    final Uri url = Uri.parse(
        'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude');

    if (await launchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
