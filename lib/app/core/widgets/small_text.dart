import 'package:flutter/material.dart';

import '../config/dimensions.dart';
import '../theme/app_color.dart';

class SmallText extends StatelessWidget {
  final Color color;
  final String text;
  final double size;
  final double height;
  final int maxline;
  final TextAlign textAlign;
  final TextOverflow overFlow;
  final TextDecoration textDecoration;
  final FontWeight weight;
  final FontStyle fontStyle;
  const SmallText(
      {Key? key,
      this.color = AppColor.blackTextColor,
      required this.text,
      this.size = 0,
      this.height = 1.2,
      this.maxline = 1,
      this.fontStyle = FontStyle.normal,
      this.weight = FontWeight.w600,
      this.textAlign = TextAlign.start,
      this.textDecoration = TextDecoration.none,
      this.overFlow = TextOverflow.ellipsis})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxline,
      textAlign: textAlign,
      style: TextStyle(
          color: color,
          fontSize: size == 0 ? Dimensions.font20 : size,
          fontFamily: 'OpenSans', //OpenSans,Roboto
          fontWeight: weight,
          fontStyle: fontStyle,
          decoration: textDecoration,
          height: height),
      overflow: overFlow,
    );
  }
}
