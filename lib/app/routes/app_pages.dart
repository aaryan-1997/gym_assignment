// ignore_for_file: constant_identifier_names

import 'home_routes.dart';
import 'splash_routes.dart';
import 'search_routes.dart';

class AppPages {
  AppPages._();

  static const HOME = '/home';

  static final routes = [
    ...HomeRoutes.routes,
		...SplashRoutes.routes,
		...SearchRoutes.routes,
  ];
}
