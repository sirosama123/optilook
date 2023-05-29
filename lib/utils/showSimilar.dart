import 'package:avatar_glow/avatar_glow.dart';
import 'package:custom_clippers/custom_clippers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:optilook/provider/provider1.dart';
import 'package:optilook/utils/crossout.dart';
import 'package:optilook/utils/multi2.dart';
import 'package:optilook/utils/multi3.dart';
import 'package:optilook/utils/multiplay.dart';
import 'package:optilook/utils/shadowText.dart';
import 'package:provider/provider.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import '../screens/test11.dart';
import '../utils/display1.dart';
import '../utils/multiText.dart';
import 'multiNumber.dart';

class ShowSimilarProduct extends StatelessWidget {
  String? img;
  String? name;
  String? price;
  String? regular_price;
  String? sale_price;
  ShowSimilarProduct({
    super.key,
    required this.img,
    required this.name,
    required this.price,
    required this.regular_price,
    required this.sale_price
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.h,
      width: 200.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(10.r),
          bottomRight: Radius.circular(10.r)
        ),
        border: Border.all(color: Colors.grey),
      ),
      child: Column(
        children: [
          Expanded(
            flex: 4,
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage("$img",
                  ),
                  fit: BoxFit.cover
                  )
              ),
            )),
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MultiPlay(color: Color(0xff36454f), subtitle: "$name", weight: FontWeight.bold, size: 16),
                      SizedBox(height: 3.h,),
                     sale_price==""? MultiNumber(color: Color(0xff36454f), subtitle: "Rs $price", weight: FontWeight.normal, size: 18):
                     Row(
                      children: [
                        MultiNumber(color: Color(0xff36454f), subtitle: "Rs $price", weight: FontWeight.normal, size: 18),
                        SizedBox(width: 3.w,),
                        CrossOut(color: Color.fromARGB(255, 72, 91, 103), subtitle: "Rs $regular_price", weight: FontWeight.normal, size: 16)
                      ],
                     )
                    ],
                  ),
                ),
              )
              )
        ],
      ),
    );
  }
}