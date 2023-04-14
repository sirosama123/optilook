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


class Shape1 extends StatelessWidget {
  String? img;
  String? name;
  Shape1({super.key,required this.img,required this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      height:50.h,
      // width: 120.w,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey,width: 1),
        borderRadius: BorderRadius.circular(12.r),
        color: Colors.white,
          boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 1,
                                    blurRadius: 2,
                                    offset: Offset(
                                        0, 3), // changes position of shadow
                                  ),],
        
      ),
      child: Padding(
        padding:EdgeInsets.all(3),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset("$img",height: 25.h,width: 25.w,fit: BoxFit.cover,),
            SizedBox(width: 5.w,),
            Multi3(color: Color(0xff36454f), subtitle: "$name", weight: FontWeight.bold, size: 16)
          ],
        ),
      ),
    );
  }
}