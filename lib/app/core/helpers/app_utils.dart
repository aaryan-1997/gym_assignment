import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../config/dimensions.dart';
import '../theme/app_color.dart';

class AppUtils {
  static FutureOr<DateTime> chooseDate(BuildContext context,
      {title = "", DateTime? firstDate, DateTime? lastDate}) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: firstDate ?? DateTime(1900),
      lastDate: lastDate ?? DateTime.now(),
      helpText: title,
      confirmText: "Done",
      cancelText: "Cancel",
      initialEntryMode: DatePickerEntryMode.calendarOnly,
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: AppColor.primeryColor,
              onPrimary: AppColor.whiteColor,
              onSurface: AppColor.blackColor,
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                // ignore: deprecated_member_use
                primary: AppColor.primeryColor, // button text color
              ),
            ),
          ),
          child: child!,
        );
      },
    );

    if (pickedDate != null) {
      return pickedDate;
    } else {
      return DateTime.now();
    }
  }

  static void showSuccessSnackBar(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: AppColor.greenTextColor,
      textColor: AppColor.whiteTextColor,
      fontSize: Dimensions.font16,
    );
  }

  static void showErrorSnackBar(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: AppColor.primeryColor,
      textColor: AppColor.whiteTextColor,
      fontSize: Dimensions.font16,
    );
  }

  String getSubString({String value = "", int start = 0, end = 1}) {
    try {
      return value.substring(start, end);
    } catch (e) {
      log("_substring_error=>$e");
      return "";
    }
  }

  List<Widget> getRatingStars(
      {required double? rating,
      required double starSize,
      Color iconColor = AppColor.yellowColor}) {
    List<Icon> temp = [];
    if (rating != null) {
      for (var i = 0; i < rating ~/ 2; i++) {
        //(rating/2).toInt() == rating ~/ 2
        temp.add(Icon(
          Icons.star,
          size: starSize,
          color: iconColor,
        ));
      }
      if (rating > 0 && rating % 2 != 0) {
        temp.add(Icon(
          Icons.star_half,
          size: starSize,
          color: iconColor,
        ));
      }
      while (temp.length < 5) {
        temp.add(Icon(
          Icons.star_border,
          size: starSize,
          color: iconColor,
        ));
      }
    }
    return temp;
  }

  static String removeHtmlTags(String htmlString) {
    return htmlString
        .replaceAll(RegExp(r'<[^>]*>'), '')
        .replaceAll("&nbsp;", ' ');
  }
}
