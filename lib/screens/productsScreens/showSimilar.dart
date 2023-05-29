import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:optilook/provider/provider1.dart';
import 'package:optilook/screens/productView1.dart';
import 'package:provider/provider.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../utils/product2.dart';

class ShowSimilar extends StatelessWidget {
  const ShowSimilar({super.key});

  @override
  Widget build(BuildContext context) {
    final Provider11 = Provider.of<Provider1>(context, listen: true);
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child:  GridView.builder(
                
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisExtent: 220.h,
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10),
                physics: BouncingScrollPhysics(),
                itemCount: Provider11.related_ids.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                      onTap: () {
                        var imgs = [];
                        for (var i = 0;
                            i < Provider11.related_ids[index].images.length;
                            i++) {
                          imgs.add(
                              Provider11.related_ids[index].images[i]['src']);
                        }
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProductView1(
                                    abc: imgs,
                                    name: Provider11.related_ids[index].name,
                                    price: Provider11.related_ids[index].price
                                        .toString(),
                                    description: Provider11.related_ids[index]
                                        .yoast_head_json['og_description']
                                        .toString(),
                                    description2: Provider11
                                        .related_ids[index].description2,
                                    regular_price: Provider11
                                        .related_ids[index].regular_price,
                                    sale_price:
                                        Provider11.related_ids[index].s_price,
                                    related_ids:
                                        Provider11.related_ids[index].related,
                                    variations: Provider11
                                        .related_ids[index].attributes,
                                    variations_ids: Provider11
                                        .related_ids[index].variations,
                                    id: Provider11.related_ids[index].id
                                        .toString(),
                                  )),
                        );
                       
                      },
                      child: Product2(
                        img: Provider11.related_ids[index].images[0]['src'],
                        name: Provider11.related_ids[index].name,
                        price: Provider11.related_ids[index].price.toString(),
                        regular: Provider11.related_ids[index].regular_price,
                        salePrice: Provider11.related_ids[index].s_price,
                        description: Provider11.related_ids[index]
                            .yoast_head_json['og_description']
                            .toString(),
                        description2:
                            Provider11.related_ids[index].description2,
                      ));
                },
              )
            
      ),
    );
  }
}
