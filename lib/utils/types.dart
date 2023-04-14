import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:optilook/provider/provider1.dart';
import 'package:optilook/utils/multi2.dart';
import 'package:optilook/utils/multi3.dart';
import 'package:provider/provider.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import '../utils/display1.dart';
import '../utils/multiText.dart';


class Types extends StatelessWidget {
  String? img;
  Color? glowColor;
  String? catName;
  String? startingP;
  Color? bgColor;
  double? height;
  BoxFit? fit;
  Types({super.key,required this.img,required this.glowColor,required this.catName,required this.startingP,required this.bgColor,required this.height,required this.fit});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        color: bgColor
      ),
      child: Padding(
        padding:  EdgeInsets.symmetric(vertical: 20.h,horizontal: 10.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: height!.h,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image:AssetImage("$img")
                   )
              ),
              child: AvatarGlow(
       endRadius: 200.0,
       
       child: Material(     // Replace this child with your own
         elevation: 8.0,
         color: bgColor,
         shape: CircleBorder(),
        
       ),
       glowColor: bgColor!,
      ),
            ),
           Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               Multi3(color: Colors.white, subtitle: "$catName", weight: FontWeight.bold, size: 16),
            Multi3(color: Colors.black, subtitle: "$startingP", weight: FontWeight.bold, size: 14),
            ],
           )
          ],
        ),
      ),
    );
  }
}