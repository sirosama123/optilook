import 'package:avatar_glow/avatar_glow.dart';
import 'package:custom_clippers/custom_clippers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:optilook/provider/provider1.dart';
import 'package:optilook/utils/multi2.dart';
import 'package:optilook/utils/multi3.dart';
import 'package:optilook/utils/shadowText.dart';
import 'package:provider/provider.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import '../screens/test11.dart';
import '../utils/display1.dart';
import '../utils/multiText.dart';


class LenShape extends StatelessWidget {
  String? img;
  String? heading;
  String? line2;
  String? line3;
  LenShape({super.key,required this.heading,required this.img,required this.line2,required this.line3});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 80.h,
      decoration: BoxDecoration(
        color: Color(0xff36454f),
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(color: Colors.grey,width: 1)
      ),
      child: Row(
        children: [
          Expanded(
            flex: 4,
            child: Padding(
              padding: const EdgeInsets.all(25),
              child: Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("$img"),
                    fit: BoxFit.contain
                  )
                ),
              ),
            )
            ),
          Expanded(
            flex: 10,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Multi3(color: Colors.white, subtitle: "$heading", weight: FontWeight.bold, size: 16),
                Multi3(color: Colors.white, subtitle: "$line2", weight: FontWeight.normal, size: 12),
                Multi3(color: Colors.white, subtitle: "$line3", weight: FontWeight.normal, size: 12),
              ],
            )
            ),
        ],
      ),
    );
  }
}