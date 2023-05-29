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


class Product1 extends StatelessWidget {
  String? img;
  Product1({super.key,required this.img});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(vertical: 20.h),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            height: 140.h,
            width: 150.w,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.r),
              boxShadow: [
                BoxShadow(
                  offset: Offset(2, 2),
                  spreadRadius: 2,
                  blurRadius: 5,
                  color: Colors.grey
                )
              ]
            ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            // child: Column(
            //   crossAxisAlignment: CrossAxisAlignment.start,
            //   children: [
            //     SizedBox(height: 25.h,),
            //     Multi3(color: Color(0xff36454f), subtitle: "GlassABCD", weight: FontWeight.bold, size: 21),
            //     Multi3(color: Color(0xff36454f), subtitle: "MODEL5257", weight: FontWeight.bold, size: 12),
            //     Multi3(color: Color(0xff36454f), subtitle: "Rs 5000", weight: FontWeight.bold, size: 21),
            //   ],
            // ),
          ), 
          ),

      
        Positioned(
          bottom: -10,
          
          child: ClipPath(
    clipper: MultiplePointsClipper(Sides.bottom, heightOfPoint: 4,numberOfPoints: 25),
    child: Container(
      decoration: BoxDecoration(
        
        gradient: LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          colors: [
          Color(0xff36454f),
          Color.fromARGB(255, 111, 134, 149),
          Colors.white,
        ])
      ),
      width: 150.w,
             height: 85.h,
            //  padding: EdgeInsets.all(20),
             alignment: Alignment.center,
             child: Padding(
               padding:  EdgeInsets.symmetric(horizontal: 10.w),
               child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ShadowText(color: Colors.white, shadowColor: Color(0xff36454f), subtitle: "GlassABCD", weight:FontWeight.bold, size: 14),
                      Container()
                    ],
                  ),
                  SizedBox(height: 5.h,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Multi3(color: Colors.amber, subtitle: "Rs 5000", weight: FontWeight.bold, size: 12),
                      Container()
                    ],
                  ),
                  SizedBox(height: 5.h,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 20.h,
                        width: 50.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.r),
                          gradient: LinearGradient(colors: [Color(0xff36454f),Color.fromARGB(255, 34, 43, 49)]),
                          boxShadow: [
                            BoxShadow(
                              offset: Offset(1, 1),
                              color: Color(0xff36454f),
                              blurRadius: 2,
                              spreadRadius: 1
                            )
                          ]
                        ),
                        child: Center(
                          child: Multi3(color: Colors.white, subtitle: "Add", weight: FontWeight.bold, size: 9),
                        ),
                      ),
                      Container(
                        child: Icon(CupertinoIcons.heart_fill,color: Colors.amber,size: 25,),
                      )
                    ],
                  ),
                ],
                         ),
             ),
       ),
),
          ),
        Positioned(
          left: -10,
          top: 0,

          child: RibbonShape(bg: Colors.amber, tag: 'new', bg2: Colors.amber[700],)),
        Positioned(
          top: 20,
          child: Container(
            height: 60.h,
            width: 150.w,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage("$img"),
                fit: BoxFit.contain
                )
            ),
          ),),
          // Positioned(
          // bottom: 0,
          // right: 0,
          // child: Container(
          //   height: 30.h,
          //   width: 30.w,
          //   decoration: BoxDecoration(
          //     color: Color(0xff36454f),
          //     borderRadius: BorderRadius.only(
          //       topLeft: Radius.circular(10),
          //       bottomRight: Radius.circular(10),
          //     )
          //   ),
          //   child: Center(
          //     child: Icon(Icons.add,color: Colors.amber,),
          //   ),
          // ),),
        ],
      ),
    );
  }
}