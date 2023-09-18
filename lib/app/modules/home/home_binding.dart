import 'package:get/get.dart';

import '../../data/services/api.dart';
import '../../data/services/api_client_dart.dart';
import 'home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ApiClient(appBaseUrl: Api.baseUrl));
    Get.lazyPut<HomeController>(() => HomeController(apiClient: Get.find()));
  }
}
