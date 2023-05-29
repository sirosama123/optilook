import 'dart:convert';
import 'dart:io';

import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:optilook/provider/provider1.dart';
import 'package:optilook/screens/productView1.dart';
import 'package:optilook/utils/multi2.dart';
import 'package:provider/provider.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import '../../models/product.dart';
import '../../utils/product2.dart';
import 'package:http/http.dart' as http;

class AllProducts extends StatelessWidget {
  var listname;
  AllProducts({super.key,required this.listname});

  @override
  Widget build(BuildContext context) {
    final Provider11 = Provider.of<Provider1>(context, listen: true);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Stack(
            
            children: [
             
              SingleChildScrollView(
                child: Column(
                  
                  children: [
                  
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                               Padding(
                                 padding:EdgeInsets.only(left: 5.w),
                                 child: GestureDetector(
                                   onTap: (){
                                     Navigator.pop(context);
                                   },
                                   child: Container(
                                                           height: 40.h,
                                                           width: 40.w,
                                                           decoration: BoxDecoration(
                                       color: Colors.white,
                                       border: Border.all(color: Colors.grey),
                                       shape: BoxShape.circle,
                                       boxShadow: [
                                         BoxShadow(
                                           offset: Offset(1,1),
                                           color: Colors.grey,
                                           spreadRadius: 2,
                                           blurRadius: 6
                                         )
                                       ],
                                       
                                                           ),
                                                           child:  Padding(
                                       padding:  EdgeInsets.all(10),
                                       child: Image.asset("assets/back.png",fit: BoxFit.contain,height: 10.h,width: 10.w,)
                                                           ) ,
                                                         ),
                                 ),
                               ),
                               SizedBox(height: 10.h,),
                              Image.asset("assets/logo.png",height: 40.h,width: 120.w,),
                              SizedBox(height: 10.h,),
                            ],
                          ),
                        ),
                        Container()
                      ],
                    ),
                    GridView.builder(
                            shrinkWrap: true,
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                mainAxisExtent: 220.h,
                                crossAxisCount: 2,
                                mainAxisSpacing: 10,
                                crossAxisSpacing: 10),
                            physics: BouncingScrollPhysics(),
                            itemCount:listname.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                  onTap: () {
                                    var imgs = [];
                                    for (var i =0;i<listname![index].images.length;i++) {
                                      imgs.add(listname![index].images[i]['src']);
                                    }
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => ProductView1(
                                                abc: imgs, 
                                                name: listname![index].name, 
                                                price: listname![index].price.toString(), 
                                                description: listname![index].yoast_head_json['og_description'].toString(), 
                                                description2:listname![index].description2, 
                                                regular_price:listname![index].regularPrice, 
                                                sale_price:listname![index].salePrice, 
                                                related_ids: listname![index].related, 
                                                variations: listname![index].attributes, 
                                                variations_ids: listname![index].variations, id:listname![index].id.toString() ,
                                          )),
                                    );
                                  },
                                  child: Product2(
                                    img: listname![index].images[0]['src'],
                                    name: listname![index].name,
                                    price: listname![index].price.toString(),
                                    regular: listname![index].regularPrice, 
                                    salePrice: listname![index].salePrice, 
                                    description:listname![index].yoast_head_json['og_description'].toString(), 
                                    description2:  listname![index].description2,
                                  ));
                            },
                          ),
                     
                  ],
                ),
              ),
        

               Align(
                alignment: Alignment.topCenter,
                child: Container(
                  height: 80.h,
                  width: double.infinity,
                  child: Stack(
                    children: [
                      Padding(
                        padding:EdgeInsets.symmetric(horizontal: 20.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            DottedLine(
                                        dashLength: 10,
                                        dashGapLength: 10,
                                        lineThickness: 10,
                                        dashColor: Colors.transparent,
                                        dashGapColor: Colors.transparent,
                                        direction: Axis.vertical,
                                        lineLength: 60.h,
                                      ),
                           Container(
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black,
                                  blurRadius: 10,
                                  spreadRadius: 1
                                )
                              ]
                            ),
                             child: DottedLine(
                                          dashLength: 10,
                                          dashGapLength: 10,
                                          lineThickness: 10,
                                          dashColor: Colors.black,
                                          dashGapColor: Colors.black,
                                          direction: Axis.vertical,
                                          lineLength: 60.h,
                                        ),
                           ),
                          ],
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: GestureDetector(
                          onTap: (){
                         
                          },
                          child: Container(
                            height: 40.h,
                            width: 100.w,
                            decoration: BoxDecoration(
                              image: DecorationImage(image: AssetImage("assets/charcoal.jpg"),fit: BoxFit.cover),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black,
                                  offset: Offset(1, 1),
                                  blurRadius: 10,
                                  spreadRadius: 1
                                )
                              ],
                              borderRadius: BorderRadius.only(topLeft: Radius.circular(15.r),
                              bottomRight:  Radius.circular(15.r)
                              )
                            ),
                            child: Center(child: Multi2(color: Colors.white, subtitle: "Men Collection", weight: FontWeight.bold, size: 12)),
                          ),
                        ),

                      )
                    ],
                  ),
                ),
              ),
            ],
          )
             
        ),
      ),
    );
  }
}


