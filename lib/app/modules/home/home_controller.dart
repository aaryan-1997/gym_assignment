import 'dart:developer';

import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:gym_assignment/app/data/models/gym_response.dart';
import 'package:gym_assignment/app/data/services/api.dart';

import 'package:gym_assignment/app/data/services/api_client_dart.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:geocoding/geocoding.dart';

import '../../core/config/sp_key.dart';
import '../../data/models/filter_model.dart';
import '../../data/services/handling_exception.dart';
import '../splash/splash_controller.dart';
import '../../data/extensions/extensions.dart';

class HomeController extends GetxController {
  ApiClient apiClient;
  HomeController({required this.apiClient});

  Position? currentPosition;
  RxString currentLocality = "".obs;
  RxString currentAddress = "".obs;

  RxList<Gym> mainGymList = <Gym>[].obs;
  RxList<Gym> gymList = <Gym>[].obs;

  RxBool isLoading = false.obs;

  RxInt selectedFilter = 0.obs;

  RxList<FilterModel> filterList = FilterModel.filterList.obs;

  @override
  void onInit() {
    getCurrentPosition();
    super.onInit();
  }

  Future getNearByGym(
      {String page = "1",
      count = "10",
      String lat = "",
      String lng = ""}) async {
    try {
      var latitude = "", longitude = "";
      if (lat.validate().isEmpty || lng.validate().isEmpty) {
        latitude = "${currentPosition!.latitude}";
        longitude = "${currentPosition!.longitude}";
      }
      isLoading.value = true;
      Response response = await apiClient.get(
          "${Api.nearestgym}?page=$page&limit=$count&lat=$latitude&long=$longitude");
      if (HandlingException.checkStatusCode(response)) {
        var result = gymResponseFromJson(response.bodyString ?? "");
        if (result.status == true) {
          gymList.value = result.gym ?? [];
          mainGymList.value = result.gym ?? [];
        }
      }
      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
    }
  }

  Future<void> getCurrentPosition() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      bool hasPermission =
          await Get.find<SplashController>().handleLocationPermission();
      if (!hasPermission) return;
      currentPosition = await Geolocator.getCurrentPosition();
      prefs.setDouble(SpKey.userLat, currentPosition!.latitude);
      prefs.setDouble(SpKey.userLng, currentPosition!.longitude);
      List<Placemark> placemarks = await placemarkFromCoordinates(
          currentPosition!.latitude, currentPosition!.longitude);
      getNearByGym();
      if (placemarks.isNotEmpty) {
        currentLocality.value = placemarks[0].locality ?? "";
        currentAddress.value = placemarks[0].name ?? "";
      }
    } catch (e) {
      log("$e");
    }
  }

  updateSelectedFilter(index) {
    selectedFilter.value = index;
  }

  filterGym(String code) {
    if (code.isEmpty) {
      gymList.value = mainGymList;
    } else {
      gymList.value = mainGymList.where((p0) => p0.categoryName == code).toList();
    }
  }
}
