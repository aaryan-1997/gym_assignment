import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gym_assignment/app/routes/app_pages.dart';

import '../../core/config/dimensions.dart';
import '../../core/theme/app_color.dart';
import 'splash_controller.dart';

class SplashPage extends GetView<SplashController> {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(Dimensions.width10),
        width: Get.width,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [AppColor.redColor, AppColor.redColor],
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  FlutterLogo(
                    size: Dimensions.width100
                  ),
                ],
              ),
            ),
            SizedBox(
              height: Dimensions.height30,
              width: Dimensions.width30,
              child: TweenAnimationBuilder<double>(
                tween: Tween(begin: 0, end: 1),
                duration: const Duration(seconds: 3),
                builder: (context, value, _) => Container(),
                onEnd: () {
                  Get.offNamedUntil(AppPages.HOME, (route) => false);
                },
              ),
            ),
            SizedBox(height: Dimensions.height10),
          ],
        ),
      ),
    );
  }
}
