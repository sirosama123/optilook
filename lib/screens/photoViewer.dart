import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:optilook/provider/provider1.dart';
import 'package:photo_view/photo_view.dart';
import 'package:provider/provider.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

import '../utils/multi3.dart';


class PhotoViewer extends StatelessWidget {
  var list1;
  PhotoViewer({super.key,required this.list1});

  @override
  Widget build(BuildContext context) {
    final Provider11 = Provider.of<Provider1>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor:Color(0xff36454f),
        title: Multi3(color: Colors.white, subtitle: "Product Gallery", weight: FontWeight.bold, size: 18),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 8,
            child: Container(
              color: Colors.white,
    child: PhotoView(
      backgroundDecoration: BoxDecoration(
        color: Colors.white
      ),
      imageProvider: NetworkImage(list1[Provider11.currentImg]),
    ))),
          Expanded(
            flex: 2,
            child: Column(
              children: [
                Container(
                  height: 100.h,
                  color: Colors.amber.withOpacity(0.3),
                  child: Container(
                    height: 100.h,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: list1.length,
                      itemBuilder: (context,index){
                        return  GestureDetector(
                          onTap: (){
                            Provider11.change(index);
                          },
                          child: Padding(
                            padding:EdgeInsets.all(4),
                            child: Container(
                              height: 100.h,
                              width: 100.w,
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Color(0xff36454f),
                                    offset: Offset(0, 0),
                                    blurRadius: 10,
                                    spreadRadius: -5
                                  )
                                ],
                                borderRadius: BorderRadius.circular(15.r),
                                border: Provider11.currentImg==index?Border.all(color: Color(0xff36454f),width: 1.5):null,
                                color: Colors.transparent,
                                image: DecorationImage(
                                  image: NetworkImage(list1[index],),fit: BoxFit.cover
                                  )
                              ),
                            ),
                          ),
                        );
                      }
                      ),
                  ),
                ),
              ],
            )),
        ],
      ),
    );
  }
}