import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

import '../../core/helpers/app_utils.dart';

class SplashController extends GetxController {
  Future<bool> handleLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      AppUtils.showErrorSnackBar(
          'Location services are disabled. Please enable the services');
      return false;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        AppUtils.showErrorSnackBar('Location permissions are denied');
        return Geolocator.openAppSettings();
      }
    }
    if (permission == LocationPermission.deniedForever) {
      AppUtils.showErrorSnackBar(
          'Location permissions are permanently denied, we cannot request permissions.');
      return Geolocator.openAppSettings();
    }
    return true;
  }
}
