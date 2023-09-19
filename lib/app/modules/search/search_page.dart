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
        slivers: [
          const SliverAppBar(title: SearchHeader(),pinned: true),
          SliverToBoxAdapter(
            child: Container(
              padding: EdgeInsets.zero,
              margin: EdgeInsets.symmetric(horizontal: Dimensions.width10),
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(0),
              ),
              child: TextFormField(
                cursorColor: AppColor.greyColor,
                autovalidateMode: AutovalidateMode.disabled,
                decoration: InputDecoration(
                  fillColor: AppColor.greyColor.withOpacity(0.2),
                  filled: true,
                  isDense: true,
                  contentPadding: EdgeInsets.only(
                    left: Dimensions.width15,
                    top: Dimensions.height5,
                    bottom: Dimensions.height5,
                  ),
                  prefixIcon: GestureDetector(
                    onTap: () {},
                    child: Icon(
                      Icons.search,
                      color: AppColor.greyColor,
                      size: Dimensions.iconSize20,
                    ),
                  ),
                  hintText: "Search location",
                  focusedBorder: outlineInputBorder,
                  enabledBorder: outlineInputBorder,
                  focusedErrorBorder: outlineInputBorder,
                  errorBorder: outlineInputBorder,
                  errorStyle: TextStyle(
                    fontWeight: FontWeight.normal,
                    color: AppColor.redColor,
                    fontSize: Dimensions.font14,
                  ),
                  border: outlineInputBorder,
                  hintStyle: TextStyle(
                    fontWeight: FontWeight.normal,
                    color: AppColor.greyColor,
                    fontSize: Dimensions.font14,
                  ),
                ),
                keyboardType: TextInputType.text,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              margin: EdgeInsets.symmetric(
                vertical: Dimensions.height10,
                horizontal: Dimensions.width10,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        controller.getCities();
                      },
                      child: Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.symmetric(
                            vertical: Dimensions.height10,
                            horizontal: Dimensions.width10),
                        decoration: BoxDecoration(
                          color: AppColor.greyColor.withOpacity(0.2),
                          borderRadius:
                              BorderRadius.circular(Dimensions.radius10),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.my_location_outlined,
                                  size: Dimensions.font20,
                                  color: AppColor.blackColor,
                                ),
                                SizedBox(width: Dimensions.width5),
                                SmallText(
                                  text: "Around Your Location",
                                  color: AppColor.blackTextColor,
                                  size: Dimensions.font15,
                                  weight: FontWeight.w500,
                                ),
                              ],
                            ),
                            Icon(
                              Icons.arrow_right_alt,
                              size: Dimensions.font20,
                              color: AppColor.redButtonColor,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: Dimensions.width10),
                  Container(
                    padding: EdgeInsets.symmetric(
                        vertical: Dimensions.height10,
                        horizontal: Dimensions.width10),
                    decoration: BoxDecoration(
                      color: AppColor.greyColor.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(Dimensions.radius10),
                    ),
                    child: Icon(
                      Icons.edit_location_sharp,
                      size: Dimensions.font20,
                      color: AppColor.blackColor,
                    ),
                  )
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Obx(() {
              return Container(
                margin: EdgeInsets.symmetric(
                  vertical: Dimensions.height10,
                  horizontal: Dimensions.width10,
                ),
                child: Row(
                  children: [
                    SmallText(
                      text: controller.currentCity.value.toUpperCase(),
                      size: Dimensions.font18,
                      weight: FontWeight.w500,
                    ),
                    SmallText(
                      text: " (${controller.popularLocation.length} gyms)",
                      size: Dimensions.font16,
                      weight: FontWeight.normal,
                    ),
                  ],
                ),
              );
            }),
          ),
          Obx(
            () {
              return  controller.popularLocation.isEmpty 
                      ? const SliverFillRemaining(
                          hasScrollBody: false,
                          child:
                              Center(child: SmallText(text: "Data not found")),
                        )
                      : SliverList(
                          delegate: SliverChildBuilderDelegate(
                            childCount: controller.popularLocation.length,
                            (context, index) {
                              return InkWell(
                                onTap: () {},
                                child: Container(
                                  width: Get.width,
                                  margin: EdgeInsets.symmetric(
                                    vertical: Dimensions.height5,
                                    horizontal: Dimensions.width10,
                                  ),
                                  padding: EdgeInsets.symmetric(
                                      vertical: Dimensions.height10,
                                      horizontal: Dimensions.width10),
                                  decoration: BoxDecoration(
                                    color: AppColor.greyColor.withOpacity(0.2),
                                    borderRadius: BorderRadius.circular(
                                        Dimensions.radius10),
                                  ),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.location_pin,
                                        size: Dimensions.font20,
                                        color: AppColor.blackColor,
                                      ),
                                      SizedBox(width: Dimensions.width5),
                                      SmallText(
                                        text:
                                            "${controller.popularLocation[index].location}, ${controller.popularLocation[index].address2}",
                                        size: Dimensions.font15,
                                        weight: FontWeight.normal,
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        );
            },
          )
        ],
      ),
    );
  }
}

OutlineInputBorder outlineInputBorder = OutlineInputBorder(
  borderSide: BorderSide(color: AppColor.greyColor.withAlpha(150)),
  borderRadius: BorderRadius.circular(10),
);

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
          GestureDetector(
            onTap: () {
              Get.defaultDialog(
                title: "Cities",
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: controller.cities
                      .map(
                        (element) => ListTile(
                          onTap: () {
                            controller.filterGymCity("${element.city}");
                            Get.back();
                          },
                          title: SmallText(
                            text: "${element.city}".toUpperCase(),
                            size: Dimensions.font15,
                            weight: FontWeight.normal,
                          ),
                          dense: true,
                        ),
                      )
                      .toList(),
                ),
              );
            },
            child: Row(
              children: [
                Text(
                  controller.currentCity.value,
                  style: const TextStyle(
                      fontSize: 13, fontWeight: FontWeight.w500),
                ),
                SizedBox(width: Dimensions.width5 / 2),
                Icon(Icons.arrow_drop_down, size: Dimensions.iconSize20),
              ],
            ),
          ),
        ],
      );
    });
  }
}
