import 'package:flutter/material.dart';
import 'package:greatindian/constants/app_colors.dart';
import 'package:greatindian/controller/location_provider.dart';
import 'package:provider/provider.dart';

class LocationWidget extends StatelessWidget {
  const LocationWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final locationProvider =
        Provider.of<LocationProvider>(context, listen: false);
    return SizedBox(
      width: size.width / 1,
      height: size.height / 16,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
        ),
        onPressed: () async {
          await locationProvider.getLocation();
        },
        child: Consumer<LocationProvider>(
          builder: (context, locationProvider, child) {
            if (locationProvider.latitude == null) {
              return Row(
                children: [
                  SizedBox(
                    width: size.width / 5,
                  ),
                  const Text(
                    'Add Location  ',
                    style: TextStyle(color: AppColors.kWhite),
                  ),
                  const Icon(Icons.navigation)
                ],
              );
            } else {
              return Row(
                children: [
                  SizedBox(
                    width: size.width / 5,
                  ),
                  const Text(
                    'Location Added  ',
                    style: TextStyle(color: AppColors.kWhite),
                  ),
                  const Icon(
                    Icons.check_box_rounded,
                    color: Colors.white,
                  )
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
