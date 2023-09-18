import 'dart:async';
import 'dart:developer';

import 'package:get/get_connect.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:gym_assignment/app/core/config/app_constant.dart';

class ApiClient extends GetConnect implements GetxService {
  final String appBaseUrl;
  late Map<String, String> mainHeaders;

  ApiClient({required this.appBaseUrl}) {
    baseUrl = appBaseUrl;
    timeout = const Duration(seconds: 30);
    allowAutoSignedCert = true; // for expired Certificate
    mainHeaders = {
      'Contect-type': 'application/json;charset-UTF-8',
    };
  }

  FutureOr<Response> getRequest(String uri) async {
    try {
      Response response = await get(uri,
          headers: {'Authorization': 'Bearer ${AppConstant.token}'});
      log(response.statusText.toString());
      return response;
    } catch (e) {
      return Response(statusCode: 1, statusText: e.toString());
    }
  }

  FutureOr<Response> postRequest(String uri, body) async {
    try {
      Response response = await post(
        uri,
        body,
        headers: {'Authorization': 'Bearer ${AppConstant.token}'},
      );
      log(response.statusText.toString());
      return response;
    } catch (e) {
      return Response(statusCode: 1, statusText: e.toString());
    }
  }
}
