import 'dart:ui';

import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:material_dialogs/dialogs.dart';
import 'package:material_dialogs/widgets/buttons/icon_button.dart';
import 'package:material_dialogs/widgets/buttons/icon_outline_button.dart';
import 'package:optilook/provider/provider1.dart';
import 'package:provider/provider.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:woocommerce_api/woocommerce_api.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class LogIn extends StatelessWidget {
  const LogIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/bg2.jpg"), fit: BoxFit.cover)),
        child: Container(
            height: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.3),
            ),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(25.0),
                child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 5.0),
                    child: Container(
                      decoration: BoxDecoration(

                          // color: Colors.transparent.withOpacity(0.2),
                          ),
                      child: Column(
                        children: [
                          Container(
                            height: 70.h,
                            width: 120.w,
                            decoration: BoxDecoration(
                              image: DecorationImage(image: AssetImage("assets/logo.png"),fit: BoxFit.contain)
                            ),
                          ),
                          PentagonShape()
                        ],
                      ),
                    )))));
  }
}





class PentagonShape extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 500,
      height: 500,
      child: CustomPaint(
        painter: _PentagonShapePainter(),
      ),
    );
  }
}

class _PentagonShapePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final radius = size.width / 2;
    final rotationAngle = -math.pi / 2;
    final sides = 5;
    final angle = (math.pi * 2) / sides;

    final path = Path();
    path.moveTo(radius, 0);

    for (var i = 1; i <= sides; i++) {
      final x = radius * math.cos(angle * i + rotationAngle);
      final y = radius * math.sin(angle * i + rotationAngle);
      path.lineTo(x, y);
    }

    path.close();

    final paint = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.fill;

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

