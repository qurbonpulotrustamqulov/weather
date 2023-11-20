import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/services/constants/colors.dart';
import 'package:weather_app/services/constants/images.dart';

class CustomSplashTwoPainter extends StatelessWidget {
  const CustomSplashTwoPainter({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: SplashTwoPainter(),
      size: Size(double.infinity, 200.sp),
      child: Image(
        image: CustomImages.imgBlueStar,
        width: 340.sp,
        height: 340.sp,
      ),
    );
  }
}

class SplashTwoPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    double x = size.width;

    Paint paint = Paint()
      ..color = CustomColors.$0C1823
      ..style = PaintingStyle.fill;

    Path path = Path()
      ..moveTo(250.sp, 0)
      ..cubicTo(205.sp, 40.sp, 290.sp, 30.sp, 265.sp, 70.sp)
      ..arcTo(Rect.fromCircle(center: Offset(280.sp, 79.sp), radius: 20),
          pi * 1.2, -pi, false)
      ..cubicTo(330.sp, 50.sp, 330.sp, 160.sp, x.sp, 10.sp)
      ..lineTo(x, 0)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) =>
      oldDelegate != this;
}
