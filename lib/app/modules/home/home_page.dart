import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gym_assignment/app/core/config/dimensions.dart';
import 'package:gym_assignment/app/core/theme/app_color.dart';
import 'package:gym_assignment/app/data/models/filter_model.dart';

import 'home_controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(title: HomeHeader()),
          const SliverToBoxAdapter(child: SearchContainer()),
          const SliverToBoxAdapter(child: FilterContainer()),
        ],
      ),
    );
  }
}

class FilterContainer extends GetView<HomeController> {
  const FilterContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return SizedBox(
        height: Dimensions.height30 * 1.2,
        child: ListView.builder(
          itemCount: controller.filterList.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Obx(() {
              return GestureDetector(
                onTap: () {
                  controller.updateSelectedFilter(index);
                },
                child: Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(
                      vertical: Dimensions.height5,
                      horizontal: Dimensions.width15),
                  margin:
                      EdgeInsets.symmetric(horizontal: Dimensions.width5 / 2),
                  decoration: BoxDecoration(
                    color: controller.selectedFilter.value == index
                        ? AppColor.blackColor
                        : AppColor.whiteTextColor,
                    borderRadius: BorderRadius.circular(Dimensions.radius20),
                    border: Border.all(),
                  ),
                  child: Text(
                    FilterModel.filterList[index].name,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: controller.selectedFilter.value == index
                          ? AppColor.whiteTextColor
                          : AppColor.blackColor,
                    ),
                  ),
                ),
              );
            });
          },
        ),
      );
    });
  }
}

class SearchContainer extends StatelessWidget {
  const SearchContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: Dimensions.height5,
        horizontal: Dimensions.width15 / 2,
      ),
      padding: EdgeInsets.symmetric(
          vertical: Dimensions.height5, horizontal: Dimensions.width15 / 2),
      decoration: BoxDecoration(
        color: AppColor.greyColor.withOpacity(0.2),
        borderRadius: BorderRadius.circular(Dimensions.radius25),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            " Search by gym name",
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: AppColor.blackTextColor,
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(
              vertical: Dimensions.height15 / 2,
              horizontal: Dimensions.width10 * 1.2,
            ),
            decoration: BoxDecoration(
              color: AppColor.redButtonColor,
              borderRadius: BorderRadius.circular(Dimensions.radius20),
            ),
            child: Icon(
              Icons.search,
              size: Dimensions.font24,
              color: AppColor.whiteColor,
            ),
          )
        ],
      ),
    );
  }
}

class HomeHeader extends GetView<HomeController> {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(Icons.location_pin, size: Dimensions.font16),
                SizedBox(width: Dimensions.width5 / 2),
                Text(
                  controller.currentLocality.value,
                  style: const TextStyle(
                      fontSize: 15, fontWeight: FontWeight.w600),
                ),
                SizedBox(width: Dimensions.width5 / 2),
                Icon(Icons.arrow_drop_down, size: Dimensions.iconSize20),
              ],
            ),
            Text(
              controller.currentAddress.value,
              style:
                  const TextStyle(fontSize: 13, fontWeight: FontWeight.normal),
            ),
          ],
        ),
      );
    });
  }
}
