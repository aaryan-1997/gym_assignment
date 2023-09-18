// ignore_for_file: constant_identifier_names

import 'package:get/get.dart';

import '../modules/splash/splash_binding.dart';
import '../modules/splash/splash_page.dart';

class SplashRoutes {
  SplashRoutes._();

  static const INITIAL = '/splash';

  static final routes = [
    GetPage(
      name: INITIAL,
      page: () => const SplashPage(),
      binding: SplashBinding(),
    ),
  ];
}
