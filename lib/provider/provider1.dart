import 'dart:collection';
import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import 'package:material_dialogs/dialogs.dart';
import 'package:optilook/screens/productsScreens/men.dart';
import 'package:optilook/utils/multi2.dart';
import 'package:optilook/utils/multi3.dart';
import 'package:optilook/utils/product2.dart';
import 'package:woocommerce_api/woocommerce_api.dart';

import '../models/product.dart';
import '../models/relatedIds.dart';
import '../models/variationClass.dart';
import '../screens/productsScreens/showSimilar.dart';
import '../screens/productsScreens/women.dart';
import '../utils/multiNumber.dart';
import '../utils/product1.dart';
import '../utils/product3.dart';
import '../utils/showSimilar.dart';

class Provider1 extends ChangeNotifier {
  String ck = 'ck_c33fd0a8dbe04438618cebaa6bc8ab422b1755ed';
  String cs = 'cs_5c528f0b4620b24e4a831225605027651e267b72';
  String url = 'https://optilookpk.com';
  int currentImg = 0;

  List<Product>? men;
  List<Product>? women;
  List<Product>? junior;
  List<Product>? premium;



  List<Product>? bella;
  List<Product>? freshkon;
  List<Product>? optiano;
  List<Product>? transparent;
  List<Product>? lensCare;

  List<Product>? sunglasses;

  List<VariationsD> variation1 = [];
  List<RelatedIds> related_ids = [];

  List<dynamic>? lens;

  change(int index) {
    currentImg = index;
    notifyListeners();
  }

//get variation data;
  getVariation(List lst, String id, context) async {
    Map<String, dynamic> data = {};
    // variation1.clear();
    if (variation1.length == 0) {
      for (var i = 0; i < lst.length; i++) {
        data = {};
        final response = await http.get(Uri.parse(
            'https://optilookpk.com/wp-json/wc/v3/products/$id/variations/${lst[i]}?consumer_key=ck_c33fd0a8dbe04438618cebaa6bc8ab422b1755ed&consumer_secret=cs_5c528f0b4620b24e4a831225605027651e267b72&per_page=100&page=1'));
        data = json.decode(response.body);
        variation1.add(VariationsD(
            id: data['id'].toString(),
            img: data['image']['src']!,
            price: data['price']!,
            regular_price: data['regular_price']!,
            s_price: data['sale_price']!));

        print("${i} here is ${i + 1}");
      }
    }

    // print(lst.length);
    // for (var i = 0; i < variation1.length; i++) {
    //   print("${i} ==>${variation1[i].id}\n");
    // }
    // showDialog(
    //   context: context,
    //   builder: (BuildContext context) {
    //     return AlertDialog(
    //       title: Text('Welcome'),
    //       content: Container(
    //         width: 250.w,
    //         height: 250.h,
    //         child: ListView.builder(
    //             scrollDirection: Axis.horizontal,
    //             itemCount: variation1.length,
    //             itemBuilder: (context, int) {
                  // return Product2(
                  //   img: variation1[int].img,
                  //   name: variation1[int].id,
                  //   price: variation1[int].id,
                  //   regular: variation1[int].id,
                  //   salePrice: variation1[int].id,
                  //   description: variation1[int].id,
                  //   description2: variation1[int].id,
                  // );
    //             }),
    //       ),
    //       actions: [],
    //     );
    //   },
    // );
     print(lst.length);
    for (var i = 0; i < related_ids.length; i++) {
      print("${i} ==>${related_ids[i].id}\n");
    }

    locationDialog({
      required AlignmentGeometry alignment,
      double width = double.infinity,
      double height = 200,
    }) async {
      SmartDialog.show(
        alignment: alignment,
        builder: (_) => Container(
          width: width,
          height: 250.h,
          color: Colors.white,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: Column(
              children: [
                SizedBox(
                  height: 4.h,
                ),
                 MultiNumber(
                        color: Color(0xff36454f),
                        subtitle: "Variations",
                        weight: FontWeight.normal,
                        size: 18),
                SizedBox(
                  height: 4.h,
                ),
                Divider(
                  color: Color(0xff36454f),
                  height: 1,
                ),
                SizedBox(
                  height: 4.h,
                ),
                Container(
                  height: 200.h,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: variation1.length,
                      itemBuilder: (context, int) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Product3(
                    img: variation1[int].img,
                    name: variation1[int].id,
                    price: variation1[int].id,
                    regular: variation1[int].id,
                    salePrice: variation1[int].id,
                    description: variation1[int].id,
                    description2: variation1[int].id,
                  )
                        );
                      }),
                ),
              ],
            ),
          ),
        ),
      );
      await Future.delayed(Duration(milliseconds: 500));
    }

    await locationDialog(height: 500.h, alignment: Alignment.bottomCenter);
    notifyListeners();
  }

  // get related id's data;
  getRelatedIds(List lst, context) async {
    Map<String, dynamic> data = {};
    // variation1.clear();
    if (related_ids.length == 0) {
      for (var i = 0; i < lst.length; i++) {
        data = {};
        final response = await http.get(Uri.parse(
            'https://optilookpk.com/wp-json/wc/v3/products/${lst[i]}?consumer_key=ck_c33fd0a8dbe04438618cebaa6bc8ab422b1755ed&consumer_secret=cs_5c528f0b4620b24e4a831225605027651e267b72&per_page=100&page=1'));
        data = json.decode(response.body);
        related_ids.add(RelatedIds(
            id: data['id'].toString(),
            img: data['images'][0]['src']!,
            price: data['price']!,
            regular_price: data['regular_price']!,
            s_price: data['sale_price']!,
            name: data['name']!,
            images: data['images'],
            yoast_head_json: data['yoast_head_json'], 
            attributes: data['attributes'], 
            description: data['description'],
            description2: data['description'], 
            related: data['related_ids'], 
            variations: data['variations']
            ));

        print("${i} here is ${i + 1}");
      }
    }

    print(lst.length);
    for (var i = 0; i < related_ids.length; i++) {
      print("${i} ==>${related_ids[i].id}\n");
    }

    locationDialog({
      required AlignmentGeometry alignment,
      double width = double.infinity,
      double height = 200,
    }) async {
      SmartDialog.show(
        alignment: alignment,
        builder: (_) => Container(
          width: width,
          height: 250.h,
          color: Colors.white,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: Column(
              children: [
                SizedBox(
                  height: 4.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MultiNumber(
                        color: Color(0xff36454f),
                        subtitle: "Similar products",
                        weight: FontWeight.normal,
                        size: 18),
                    GestureDetector(
                        onTap: () {
                          Navigator.push(
context,
MaterialPageRoute(builder: (context) => ShowSimilar()),);
                        },
                        child: Multi3(
                            color: Color(0xff36454f),
                            subtitle: "View all",
                            weight: FontWeight.bold,
                            size: 16)),
                  ],
                ),
                SizedBox(
                  height: 4.h,
                ),
                Divider(
                  color: Color(0xff36454f),
                  height: 1,
                ),
                SizedBox(
                  height: 4.h,
                ),
                Container(
                  height: 200.h,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: related_ids.length,
                      itemBuilder: (context, int) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ShowSimilarProduct(
                            img: related_ids[int].img,
                            name: related_ids[int].name,
                            price: related_ids[int].id,
                            regular_price: related_ids[int].id,
                            sale_price: related_ids[int].id,
                          ),
                        );
                      }),
                ),
              ],
            ),
          ),
        ),
      );
      await Future.delayed(Duration(milliseconds: 500));
    }

    await locationDialog(height: 500.h, alignment: Alignment.bottomCenter);
    notifyListeners();
  }

//get all data of men's eyeglasses

  getMenData(context) async {
    final response = await http.get(Uri.parse(
        'https://optilookpk.com/wp-json/wc/v3/products?category=52&consumer_key=ck_c33fd0a8dbe04438618cebaa6bc8ab422b1755ed&consumer_secret=cs_5c528f0b4620b24e4a831225605027651e267b72&per_page=100&page=1'));
    men = (json.decode(response.body) as List<dynamic>)
        .map((data) => Product.fromJson(data as Map<String, dynamic>))
        .toList();
//     if (men!.isNotEmpty==true) {
       Navigator.push(
context,
MaterialPageRoute(builder: (context) => MenGlasses()),);
//     }
    notifyListeners();
  }

  //get all data of women's eyeglasses

  getWoMenData(context) async {
    final response = await http.get(Uri.parse(
        'https://optilookpk.com/wp-json/wc/v3/products?category=22&consumer_key=ck_c33fd0a8dbe04438618cebaa6bc8ab422b1755ed&consumer_secret=cs_5c528f0b4620b24e4a831225605027651e267b72&per_page=100&page=1'));
    women = (json.decode(response.body) as List<dynamic>)
        .map((data) => Product.fromJson(data as Map<String, dynamic>))
        .toList();
          
   

    notifyListeners();
  }


  Future<List<Product>> fetchMenData() async {
  final response = await http.get(Uri.parse('https://optilookpk.com/wp-json/wc/v3/products?category=22&consumer_key=ck_c33fd0a8dbe04438618cebaa6bc8ab422b1755ed&consumer_secret=cs_5c528f0b4620b24e4a831225605027651e267b72&per_page=100&page=1'));
  notifyListeners();
  if (response.statusCode == 200) {
    final jsonList = jsonDecode(response.body) as List<dynamic>;
    print(jsonList.map((json) => Product.fromJson(json)).toList());
    return jsonList.map((json) => Product.fromJson(json)).toList();
  } else {
    throw Exception('Failed to load users');
  }
  
}


  //get all data of junior's eyeglasses

  getJuniorData() async {
    final response = await http.get(Uri.parse(
        'https://optilookpk.com/wp-json/wc/v3/products?category=84&consumer_key=ck_c33fd0a8dbe04438618cebaa6bc8ab422b1755ed&consumer_secret=cs_5c528f0b4620b24e4a831225605027651e267b72&per_page=100&page=1'));
    junior = (json.decode(response.body) as List<dynamic>)
        .map((data) => Product.fromJson(data as Map<String, dynamic>))
        .toList();

    notifyListeners();
  }

  //get all data of premium's eyeglasses

  getPremiumData() async {
    final response = await http.get(Uri.parse(
        'https://optilookpk.com/wp-json/wc/v3/products?category=75&consumer_key=ck_c33fd0a8dbe04438618cebaa6bc8ab422b1755ed&consumer_secret=cs_5c528f0b4620b24e4a831225605027651e267b72&per_page=100&page=1'));
    premium = (json.decode(response.body) as List<dynamic>)
        .map((data) => Product.fromJson(data as Map<String, dynamic>))
        .toList();
    notifyListeners();
  }

  getBellaData() async {
    final response = await http.get(Uri.parse(
        'https://optilookpk.com/wp-json/wc/v3/products?category=46&consumer_key=ck_c33fd0a8dbe04438618cebaa6bc8ab422b1755ed&consumer_secret=cs_5c528f0b4620b24e4a831225605027651e267b72&per_page=100&page=1'));
    bella = (json.decode(response.body) as List<dynamic>)
        .map((data) => Product.fromJson(data as Map<String, dynamic>))
        .toList();
    notifyListeners();
  }


  getFreshKonData() async {
    final response = await http.get(Uri.parse(
        'https://optilookpk.com/wp-json/wc/v3/products?category=47&consumer_key=ck_c33fd0a8dbe04438618cebaa6bc8ab422b1755ed&consumer_secret=cs_5c528f0b4620b24e4a831225605027651e267b72&per_page=100&page=1'));
    freshkon = (json.decode(response.body) as List<dynamic>)
        .map((data) => Product.fromJson(data as Map<String, dynamic>))
        .toList();
    notifyListeners();
  }

  getOptianoData() async {
    final response = await http.get(Uri.parse(
        'https://optilookpk.com/wp-json/wc/v3/products?category=48&consumer_key=ck_c33fd0a8dbe04438618cebaa6bc8ab422b1755ed&consumer_secret=cs_5c528f0b4620b24e4a831225605027651e267b72&per_page=100&page=1'));
    optiano = (json.decode(response.body) as List<dynamic>)
        .map((data) => Product.fromJson(data as Map<String, dynamic>))
        .toList();
    notifyListeners();
  }  

  getTransparentData() async {
    final response = await http.get(Uri.parse(
        'https://optilookpk.com/wp-json/wc/v3/products?category=43&consumer_key=ck_c33fd0a8dbe04438618cebaa6bc8ab422b1755ed&consumer_secret=cs_5c528f0b4620b24e4a831225605027651e267b72&per_page=100&page=1'));
    transparent = (json.decode(response.body) as List<dynamic>)
        .map((data) => Product.fromJson(data as Map<String, dynamic>))
        .toList();
    notifyListeners();
  }  

  getLensCareData() async {
    final response = await http.get(Uri.parse(
        'https://optilookpk.com/wp-json/wc/v3/products?category=77&consumer_key=ck_c33fd0a8dbe04438618cebaa6bc8ab422b1755ed&consumer_secret=cs_5c528f0b4620b24e4a831225605027651e267b72&per_page=100&page=1'));
    lensCare = (json.decode(response.body) as List<dynamic>)
        .map((data) => Product.fromJson(data as Map<String, dynamic>))
        .toList();
    notifyListeners();
  }  
   
  getSunGlassesData() async {
    final response = await http.get(Uri.parse(
        'https://optilookpk.com/wp-json/wc/v3/products?category=41&consumer_key=ck_c33fd0a8dbe04438618cebaa6bc8ab422b1755ed&consumer_secret=cs_5c528f0b4620b24e4a831225605027651e267b72&per_page=100&page=1'));
    sunglasses = (json.decode(response.body) as List<dynamic>)
        .map((data) => Product.fromJson(data as Map<String, dynamic>))
        .toList();
    notifyListeners();
  }     


    //get all data of premium's eyeglasses

  getLensData() async {
    final response = await http.get(Uri.parse(
        'https://optilookpk.com/wp-json/wc/v3/products?category=51&consumer_key=ck_c33fd0a8dbe04438618cebaa6bc8ab422b1755ed&consumer_secret=cs_5c528f0b4620b24e4a831225605027651e267b72&per_page=100&page=1'));
    lens = (json.decode(response.body) as List<dynamic>)
        .map((data) => Product.fromJson(data as Map<String, dynamic>))
        .toList();
    print(lens!.length);
    notifyListeners();
  }
  notifyListeners();
}
