import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:optilook/provider/provider1.dart';
import 'package:optilook/screens/productView1.dart';
import 'package:provider/provider.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../utils/product2.dart';

class WomenGlasses extends StatelessWidget {
  const WomenGlasses({super.key});

  @override
  Widget build(BuildContext context) {
    final Provider11 = Provider.of<Provider1>(context, listen: true);
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemBuilder: (context, int) {
              return GridView.builder(
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisExtent: 220.h,
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10),
                physics: BouncingScrollPhysics(),
                itemCount: Provider11.women!.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                      onTap: () {
                        var imgs = [];
                        for (var i =0;i<Provider11.women![index].images.length;i++) {
                          imgs.add(Provider11.women![index].images[i]['src']);
                        }
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProductView1(
                                    abc: imgs, 
                                    name: Provider11.women![index].name, 
                                    price: Provider11.women![index].price.toString(), 
                                    description: Provider11.women![index].yoast_head_json['og_description'].toString(), 
                                    description2:Provider11.women![index].description2, 
                                    regular_price:Provider11.women![index].regularPrice, 
                                    sale_price:Provider11.women![index].salePrice, 
                                    related_ids: Provider11.women![index].related, 
                                    variations: Provider11.women![index].attributes, 
                                    variations_ids: Provider11.women![index].variations, id:Provider11.women![index].id.toString() ,
                                  )),
                        );
                      },
                      child: Product2(
                        img: Provider11.women![index].images[0]['src'],
                        name: Provider11.women![index].name,
                        price: Provider11.women![index].price.toString(),
                        regular: Provider11.women![index].regularPrice, 
                        salePrice: Provider11.women![index].salePrice, 
                        description:Provider11.women![index].yoast_head_json['og_description'].toString(), 
                        description2:  Provider11.women![index].description2,
                      ));
                },
              );
            }),
      ),
    );
  }
}
