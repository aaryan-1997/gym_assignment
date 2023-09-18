// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:gym_assignment/app/core/config/dimensions.dart';
import 'package:gym_assignment/app/core/theme/app_color.dart';
import 'package:gym_assignment/app/core/widgets/small_text.dart';
import 'package:gym_assignment/app/data/models/filter_model.dart';

import 'home_controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(title: HomeHeader()),
          SliverToBoxAdapter(child: SearchContainer()),
          SliverToBoxAdapter(child: FilterContainer()),
          GymList()
        ],
      ),
    );
  }
}

class GymList extends GetView<HomeController> {
  const GymList({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return controller.gymList.isEmpty
          ? SliverFillRemaining(
              hasScrollBody: false,
              child: Center(
                child: SizedBox(
                  height: Dimensions.height30,
                  width: Dimensions.width30,
                  child: const CircularProgressIndicator(
                    color: AppColor.redColor,
                  ),
                ),
              ),
            )
          : SliverList(
              delegate: SliverChildBuilderDelegate(
                childCount: controller.gymList.length,
                (context, index) {
                  return InkWell(
                    onTap: () {},
                    child: Container(
                      width: Get.width,
                      margin: EdgeInsets.symmetric(
                        vertical: Dimensions.height5,
                        horizontal: Dimensions.width10,
                      ),
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(Dimensions.radius15),
                      ),
                      child: Column(
                        children: [
                          Container(
                            height: Get.height * 0.35,
                            width: Get.width,
                            padding: EdgeInsets.zero,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(Dimensions.radius15),
                                topRight: Radius.circular(Dimensions.radius15),
                              ),
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: const FadeInImage(
                                  fit: BoxFit.cover,
                                  placeholder: AssetImage("assets/gym.jpeg"),
                                  image: NetworkImage(
                                    "https://www.shutterstock.com/shutterstock/photos/721723381/display_1500/stock-photo-modern-light-gym-sports-equipment-in-gym-barbells-of-different-weight-on-rack-721723381.jpg",
                                  ),
                                ).image,
                              ),
                            ),
                            child: Container(
                              alignment: Alignment.bottomCenter,
                              child: Container(
                                height: Dimensions.height80,
                                width: Get.width,
                                decoration: const BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                    colors: [
                                      AppColor.redColor,
                                      AppColor.blackColor
                                    ],
                                  ),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: Dimensions.width10,
                                    vertical: Dimensions.height5,
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SmallText(
                                        text:
                                            "${controller.gymList[index].gymName}",
                                        color: AppColor.whiteTextColor,
                                        size: Dimensions.font20,
                                      ),
                                      SizedBox(height: Dimensions.height5),
                                      SmallText(
                                        text:
                                            "${controller.gymList[index].distanceText} • ${controller.gymList[index].address1} ${controller.gymList[index].address2}",
                                        color: AppColor.whiteTextColor,
                                        size: Dimensions.font12,
                                        weight: FontWeight.normal,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: Dimensions.height10),
                          Container(
                            height: Dimensions.height100,
                            width: Get.width,
                            decoration: BoxDecoration(
                              color: AppColor.blackColor,
                              borderRadius: BorderRadius.only(
                                bottomLeft:
                                    Radius.circular(Dimensions.radius15),
                                bottomRight:
                                    Radius.circular(Dimensions.radius15),
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SmallText(
                                  text: controller.gymList[index].planPrice ??
                                      "STARTING AT ₹1833/month",
                                  color: AppColor.whiteTextColor,
                                  size: Dimensions.font18,
                                ),
                                SizedBox(height: Dimensions.height10),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: Dimensions.width10),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      const Expanded(
                                        child: CustomButton(
                                          title: "FREE FIRST DAY",
                                          backColor: AppColor.redButtonColor,
                                        ),
                                      ),
                                      SizedBox(width: Dimensions.width10),
                                      const Expanded(
                                        child: CustomButton(
                                          title: "BUY NOW",
                                          backColor: AppColor.greyColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            );
    });
  }
}

class CustomButton extends StatelessWidget {
  final String title;
  final Color backColor;
  const CustomButton({
    Key? key,
    required this.title,
    required this.backColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(vertical: Dimensions.height15 / 2),
      decoration: BoxDecoration(
        color: backColor,
        borderRadius: BorderRadius.circular(Dimensions.radius30),
      ),
      child: SmallText(
        text: title,
        color: AppColor.whiteTextColor,
        size: Dimensions.font15,
        weight: FontWeight.w500,
      ),
    );
  }
}

class FilterContainer extends GetView<HomeController> {
  const FilterContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Container(
        height: Dimensions.height30 * 1.3,
        margin: EdgeInsets.symmetric(vertical: Dimensions.height10),
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
              color: AppColor.greyColor,
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
