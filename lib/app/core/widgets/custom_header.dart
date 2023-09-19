import 'dart:ui' as ui;

import 'package:flutter/material.dart';

class CustomHeaderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(0, size.height * 0.1886792);
    path_0.cubicTo(0, size.height * 0.08447453, size.width * 0.01689491, 0,
        size.width * 0.03773585, 0);
    path_0.lineTo(size.width * 0.9622642, 0);
    path_0.cubicTo(size.width * 0.9831057, 0, size.width,
        size.height * 0.08447453, size.width, size.height * 0.1886792);
    path_0.lineTo(size.width, size.height);
    path_0.lineTo(size.width * 0.4754717, size.height);
    path_0.lineTo(size.width * 0.4339623, size.height * 0.7169811);
    path_0.lineTo(0, size.height * 0.7169811);
    path_0.lineTo(0, size.height * 0.1886792);
    path_0.close();

    Paint paint0Fill = Paint()..style = PaintingStyle.fill;
    paint0Fill.shader = ui.Gradient.linear(
        Offset(size.width * 0.2377358, size.height),
        Offset(size.width, size.height), [
      const Color(0xffBC2020).withOpacity(1),
      const Color(0xffDA7A0A).withOpacity(1),
      const Color(0xffCF7171).withOpacity(0)
    ], [
      0,
      1,
      1
    ]);
    canvas.drawPath(path_0, paint0Fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
