import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gym_assignment/app/modules/home/home_binding.dart';

import 'app/core/config/app_constant.dart';
import 'app/routes/app_pages.dart';
import 'app/routes/splash_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppConstant.appName,
      theme: ThemeData.light().copyWith(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFFFFFFF),
          primary: const Color(0xFF3E3E40),
          surface: const Color(0xFFFFFFFF),
          surfaceTint: const Color(0xFFFFFFFF),
        ),
        scaffoldBackgroundColor: const Color(0xFFFFFFFF),
      ),
      initialBinding: HomeBinding(),
      initialRoute: SplashRoutes.INITIAL,
      getPages: AppPages.routes,
    );
  }
}
