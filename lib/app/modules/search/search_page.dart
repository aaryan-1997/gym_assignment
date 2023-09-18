import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/config/dimensions.dart';
import '../../core/theme/app_color.dart';
import '../../core/widgets/small_text.dart';
import '../home/home_controller.dart';

class SearchPage extends GetView<HomeController> {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [SliverAppBar(title: SearchHeader()), SliverToBoxAdapter()],
      ),
    );
  }
}

class SearchHeader extends GetView<HomeController> {
  const SearchHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SmallText(
            text: "Pick Location",
            color: AppColor.blackTextColor,
            size: Dimensions.font18,
          ),
          Row(
            children: [
              Text(
                controller.currentLocality.value,
                style:
                    const TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
              ),
              SizedBox(width: Dimensions.width5 / 2),
              Icon(Icons.arrow_drop_down, size: Dimensions.iconSize20),
            ],
          ),
        ],
      );
    });
  }
}
