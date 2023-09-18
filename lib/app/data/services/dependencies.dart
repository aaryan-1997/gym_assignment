import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'api.dart';
import 'api_client_dart.dart';

init() async {
  var prefs = await SharedPreferences.getInstance();
  Get.lazyPut(() => prefs);

  Get.lazyPut(() => ApiClient(appBaseUrl: Api.baseUrl));
}
