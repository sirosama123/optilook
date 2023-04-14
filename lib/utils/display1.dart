import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:optilook/provider/provider1.dart';
import 'package:optilook/screens/test.dart';
import 'package:optilook/utils/multiText.dart';
import 'package:provider/provider.dart';

class Display1 extends StatelessWidget {
  List<String> imgs;
  List<LinearGradient> colors;
  int currentIndex;
  Function onIndexChanged;
  Display1({super.key,required this.colors,required this.imgs,required this.currentIndex,required this.onIndexChanged});
  
  @override
  Widget build(BuildContext context) {
    final Provider11 = Provider.of<Provider1>(context);
   
    return Container(
      width: double.infinity,
      height: 350.h,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey, width: 0.5),
          borderRadius: BorderRadius.circular(10.r),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                offset: Offset(0.5, 0.5),
                color: Colors.grey,
                spreadRadius: 0.1,
                blurRadius: 5)
          ]),
      child: Stack(
        children: [
          Column(
            children: [
              Expanded(
                  flex: 5,
                  child: Padding(
                    padding:
                        EdgeInsets.only(top: 10.h, right: 10.w, left: 10.w),
                    child: Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(imgs[currentIndex]),
                              fit: BoxFit.cover)),
                    ),
                  )),
              Expanded(
                  flex: 4,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              height: 30.h,
                              width: 50.w,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15.r),
                                  color: Color.fromARGB(255, 216, 213, 213)),
                              child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Multi(
                                        color: Colors.black,
                                        subtitle: "4.1",
                                        weight: FontWeight.bold,
                                        size: 12),
                                    Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                      size: 13,
                                    ),
                                    Multi(
                                        color: Colors.black,
                                        subtitle: "7",
                                        weight: FontWeight.normal,
                                        size: 12),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Multi(
                                color: Colors.black,
                                subtitle: "Hooper",
                                weight: FontWeight.w600,
                                size: 16),
                            Container()
                          ],
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Multi(
                                color: Colors.black,
                                subtitle: "Suitable for 5-8 yrs Flexi Hooper",
                                weight: FontWeight.normal,
                                size: 14),
                            Container(
                              width: 100.w,
                              height: 40.h,
                              child: ListView(
                                  scrollDirection: Axis.horizontal,
                                  children: colors.asMap().entries.map((entry) {
                                    final index = entry.key;
                                    final gradient = entry.value;

                                    return Padding(
                                      padding: EdgeInsets.all(4.0),
                                      child: GestureDetector(
                                        onTap: () {
                                          Provider11.change(index);
                                        },
                                        child: Container(
                                          height: 24.h,
                                          width: 24.w,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            
                                            border: Border.all(color: Provider11.currentImg==index?Colors.black:Colors.transparent,width:  Provider11.currentImg==index?2:0)
                                          ),
                                          child: Padding(
                                            padding:  EdgeInsets.all(3),
                                            child: Container(
                                            height: 22.h,
                                            width: 22.w,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              gradient: gradient,
                                              
                                            ),
                                                                                  ),
                                          ),
                                        ),
                                        
                                      ),
                                    );
                                  }).toList()),
                            ),
                            // Row(
                            //   children: [

                            //     Padding(
                            //       padding: const EdgeInsets.all(4.0),
                            //       child: Container(
                            //         height: 22.h,
                            //         width: 22.w,
                            //         decoration: BoxDecoration(
                            //             shape: BoxShape.circle,
                            //             gradient: LinearGradient(colors: [
                            //               Colors.black,
                            //               Color.fromRGBO(39, 39, 39, 0.533)
                            //             ])),
                            //       ),
                            //     ),
                            //     Padding(
                            //       padding: const EdgeInsets.all(4),
                            //       child: Container(
                            //         height: 22.h,
                            //         width: 22.w,
                            //         decoration: BoxDecoration(
                            //             shape: BoxShape.circle,
                            //             gradient: LinearGradient(colors: [
                            //               Colors.amber,
                            //               Color.fromARGB(255, 164, 137, 54)
                            //             ])),
                            //       ),
                            //     )
                            //   ],
                            // )
                          ],
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Multi(
                                color: Colors.black,
                                subtitle: "Rs 12000",
                                weight: FontWeight.w600,
                                size: 16),
                            Container()
                          ],
                        ),
                      ],
                    ),
                  )),
              Expanded(
                  flex: 1,
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(colors: [
                          Color(0xffFFFDD0),
                          Color(0xffFFFDD0),
                          Colors.white
                        ]),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10.r),
                          bottomRight: Radius.circular(10.r),
                        )),
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Multi(
                              color: Colors.black,
                              subtitle: "Buy 1 Get 1",
                              weight: FontWeight.w500,
                              size: 15),
                          Container()
                        ],
                      ),
                    ),
                  ))
            ],
          ),
          Positioned(
            top: 10,
            right: 10,
            child: Container(
              height: 40.h,
              width: 40.w,
              decoration: BoxDecoration(
                  color: Colors.transparent,
                  border: Border.all(
                      color: Color.fromARGB(255, 215, 213, 213), width: 1.5.w),
                  shape: BoxShape.circle),
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(CupertinoIcons.heart),
              ),
            ),
          )
        ],
      ),
    );
  }
}
