import 'dart:ui' as ui;

import 'package:flutter/material.dart';

class CustomHeaderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint0Fill = Paint()..style = PaintingStyle.fill;
    paint0Fill.color = Colors.white.withOpacity(0);
    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), paint0Fill);

    Path path_1 = Path();
    path_1.moveTo(size.width * 0.003745318, size.height * 0.2909091);
    path_1.cubicTo(
        size.width * 0.003745318,
        size.height * 0.1402860,
        size.width * 0.02889787,
        size.height * 0.01818182,
        size.width * 0.05992509,
        size.height * 0.01818182);
    path_1.lineTo(size.width * 0.9400749, size.height * 0.01818182);
    path_1.cubicTo(
        size.width * 0.9711011,
        size.height * 0.01818182,
        size.width * 0.9962547,
        size.height * 0.1402860,
        size.width * 0.9962547,
        size.height * 0.2909091);
    path_1.lineTo(size.width * 0.9962547, size.height * 0.9818182);
    path_1.lineTo(size.width * 0.4756554, size.height * 0.9818182);
    path_1.lineTo(size.width * 0.4344569, size.height * 0.7090909);
    path_1.lineTo(size.width * 0.003745318, size.height * 0.7090909);
    path_1.lineTo(size.width * 0.003745318, size.height * 0.2909091);
    path_1.close();

    // Paint paint_1_stroke = Paint()
    //   ..style = PaintingStyle.stroke
    //   ..strokeWidth = 2;
    // paint_1_stroke.color = Colors.black.withOpacity(1.0);
    // canvas.drawPath(path_1, paint_1_stroke);

    Paint paint1Fill = Paint()..style = PaintingStyle.fill;
    paint1Fill.shader = ui.Gradient.linear(
        Offset(size.width * 0.2397004, size.height * 0.9818182),
        Offset(size.width * 0.9962547, size.height * 0.9818182), [
      const Color(0xffBC2020).withOpacity(1),
      const Color(0xffDA7A0A).withOpacity(1),
      const Color(0xffCF7171).withOpacity(0)
    ], [
      0,
      1,
      1
    ]);
    canvas.drawPath(path_1, paint1Fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
