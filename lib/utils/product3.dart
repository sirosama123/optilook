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
import 'crossout.dart';


class Product3 extends StatelessWidget {
  String? img;
  String? name;
  String? price;
  String? regular;
  String? salePrice;
  String? description;
  String? description2;
  Product3({super.key,required this.img,required this.name,required this.price,required this.regular,required this.salePrice,required this.description,required this.description2});

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
      // height: 200.h,
      // width: 150.w,
      // decoration: BoxDecoration(
      //   borderRadius: BorderRadius.circular(10.r),
      //   border: Border.all(color: Colors.grey,width: 1),
      //    image: DecorationImage(
      //             image: AssetImage("assets/bg2.jpg"),opacity: 0.5,
      //             fit: BoxFit.cover,
      //             )
      // ),
      child: Stack(

        children: [
          
          Positioned(
            bottom: 0,
            right: 0,
            child:Container(
                                  height: 30.h,
                                  width: 30.w,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      bottomRight: Radius.circular(10.r),
                                      topLeft: Radius.circular(10.r)
                                    ),
                                    gradient: LinearGradient(colors: [Color(0xff36454f),Color.fromARGB(255, 34, 43, 49)]),
                                    // boxShadow: [
                                    //   BoxShadow(
                                    //     offset: Offset(1, 1),
                                    //     color: Color(0xff36454f),
                                    //     blurRadius: 2,
                                    //     spreadRadius: 1
                                    //   )
                                    // ]
                                  ),
                                  child: Center(
                                    child: Multi3(color: Colors.white, subtitle: "Add", weight: FontWeight.bold, size: 9),
                                  ),
                                ), ),
         
          
          Column(
            children: [
              Expanded(
                flex: 8,
                child: Container(
                  decoration: BoxDecoration(
                   
                  ),
                  child: Image.network("$img",fit: BoxFit.cover,),
                )
                ),
              Expanded(
                flex: 5,
                child: Padding(
                  padding:EdgeInsets.symmetric(horizontal: 10.w),
                  child: Container(
                    child: Column(
                      children: [
                        SizedBox(height: 4.h,),
                         Row(
                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                           salePrice==""? Container(
                              width: 145.w,
                              child: Multi(color: Color(0xff36454f), subtitle: "$name", weight: FontWeight.w900, size: 15)):Container(
                              width: 145.w,
                              child: Multi(color: Color(0xff36454f), subtitle: "$name", weight: FontWeight.w900, size: 12)),
                          ],
                        ),
                        // SizedBox(height: 2.h,),
                        salePrice==""?
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Multi3(color: Colors.amber, subtitle: "Rs $price", weight: FontWeight.w900, size: 21),
                            Container()
                          ],
                        ):Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Multi3(color: Colors.amber, subtitle: "Rs $price", weight: FontWeight.w900, size: 16),
                                Container()
                              ],
                            ),
                             Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CrossOut(color: Colors.amber, subtitle: "Rs $regular", weight: FontWeight.w900, size: 14),
                                Container()
                              ],
                            ),
                          ],
                        ),
                        // SizedBox(height: 2.h,),
                        Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                
                                
                              ],
                            ),
                      ],
                    ),
                  ),
                )
                ),
            ],
          ),
        ],
      ),
    );
  }
}