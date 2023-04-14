import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:material_dialogs/dialogs.dart';
import 'package:material_dialogs/widgets/buttons/icon_button.dart';
import 'package:material_dialogs/widgets/buttons/icon_outline_button.dart';
import 'package:optilook/provider/provider1.dart';
import 'package:provider/provider.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:woocommerce_api/woocommerce_api.dart';
import '../utils/crossout.dart';
import '../utils/display1.dart';
import '../utils/lensShape.dart';
import '../utils/multi3.dart';
import '../utils/multiText.dart';
import '../utils/multiplay.dart';
import '../utils/product1.dart';
import '../utils/shape.dart';
import '../utils/slider.dart';
import '../utils/type2.dart';
import '../utils/types.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';


class ProductView1 extends StatelessWidget {
  const ProductView1({super.key});

  @override
  Widget build(BuildContext context) {

 String? cleanString1;

    String removeHtmlTags(String htmlString) {
 RegExp exp = RegExp(r"<[^>]*>", multiLine: true, caseSensitive: true);
  String cleanString = htmlString.replaceAll(exp, '');
  
  RegExp exp2 = RegExp(r"<a.*?>(.*?)<\/a>", multiLine: true, caseSensitive: true);
  cleanString = cleanString.replaceAll(exp2, '');
  cleanString1 = cleanString;
  return cleanString;
}

     remover() {
  String htmlString = '<p><strong>The Attachment - Square:</strong></p>\n<p><a href=\"https://optilookpk.com/shop/\">View More Glasses</a></p>\n<ul>\n<li>Frame Width Horizontally: 140 mm or 14 cm</li>\n<li>Frame Height Vertically: 42 mm or 4.2 cm</li>\n<li>Material: Metal</li>\n<li>Sides: TR</li>\n<li>Size: 52-21-143 (Medium)</li>\n<li>Color: Silver With Black</li>\n<li>Category: Men</li>\n<li>Weight: 20g</li>\n<li>Brand: No Brand</li>\n<li>Origin: China</li>\n<li>Quality Grade: AA</li>\n<li>Rx: Prescription glass can be fitted well</li>\n</ul>';

  String cleanString = removeHtmlTags(htmlString);
  
  print(cleanString);
}

void this1() async {
  // Create a new instance of the WooCommerce API client
  WooCommerceAPI wcApi = WooCommerceAPI(
    url: "https://optilookpk.com", // Replace with your store URL
    consumerKey: "ck_c33fd0a8dbe04438618cebaa6bc8ab422b1755ed", // Replace with your consumer key
    consumerSecret: "cs_5c528f0b4620b24e4a831225605027651e267b72", // Replace with your consumer secret
     // Replace with your API version
  );

  // Call the "List Categories" endpoint to retrieve all categories
  // var categories = await wcApi.getAsync("products?category=67");
  var categories = await wcApi.getAsync("products/categories?slug=ophthalmic-lenses");

  // Extract the name of each category from the response
  List<String> categoryNames = [];
  List<String> ids = [];
  for (var category in categories) {
    categoryNames.add(category["name"]);
    ids.add(category["id"].toString());
  }

  // Print the names of all categories
  print(categoryNames);
  print(ids);
}








 _show() async {
  locationDialog({
    required AlignmentGeometry alignment,
    double width = double.infinity,
    double height = double.infinity,
  }) async {
    SmartDialog.show(
      alignment: alignment,
      builder: (_) => Container(
        width: width, 
        height: height, 
        color: Colors.white,
        child: Padding(
          padding:EdgeInsets.symmetric(horizontal: 10.w),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 20.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                     Row(
                      children: [
                         Icon(Icons.cancel_outlined,color: Color(0xff36454f),),
                         SizedBox(width: 15.w,),
                      Multi3(color: Color(0xff36454f), subtitle: "You use Eyeglasses for:", weight: FontWeight.bold, size: 18)
                      ],
                     ),
                     Container()
                    ],
                  ),
                ),
                LenShape(
                  img: 'assets/powerspec.png', 
                  heading: 'Powered Specs', 
                  line2: 'For distance or near vision', 
                  line3: '(Thin,anti-glare,blue-cut options)'
                  ),
                SizedBox(height: 10.h,),
                LenShape(
                  img: 'assets/blue.png', 
                  heading: '0 Power Blue Computer Glasses', 
                  line2: 'For distance or near vision', 
                  line3: '(Thin,anti-glare,blue-cut options)'
                  ),
                SizedBox(height: 10.h,),
                LenShape(
                  img: 'assets/bifocal.png', 
                  heading: 'Dual Vision Specs', 
                  line2: 'For distance or near vision', 
                  line3: '(Thin,anti-glare,blue-cut options)'
                  ),
                SizedBox(height: 10.h,),
                LenShape(
                  img: 'assets/frame.png', 
                  heading: 'Frame Only', 
                  line2: 'For distance or near vision', 
                  line3: '(Thin,anti-glare,blue-cut options)'
                  ),
                SizedBox(height: 10.h,),
              ],
            ),
          ),
        ),
        ),
    );
    await Future.delayed(Duration(milliseconds: 500));
  }
  await locationDialog(height: 500.h, alignment: Alignment.bottomCenter);

}





    showSimilar(){
      Dialogs.bottomMaterialDialog(
        
          msg: null,
          title: "Similar Products",
          color: Colors.white,
          context: context,
          
          actions:[
            
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(),
                            Product1(
                              img: 'assets/img4.png',
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            Product1(
                              img: 'assets/kidEye.png',
                            ),
                             SizedBox(
                              width: 10.w,
                            ),
                            Product1(
                              img: 'assets/img4.png',
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                             
                            Product1(
                              img: 'assets/img4.png',
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                          ],
                        ),
          ),
          ],
           
            // IconsOutlineButton(
            //   onPressed: () {},
            //   text: 'Cancel',
            //   iconData: Icons.cancel_outlined,
            //   textStyle: TextStyle(color: Colors.grey),
            //   iconColor: Colors.grey,
            // ),
            // IconsButton(
            //   onPressed: () {},
            //   text: 'Delete',
            //   iconData: Icons.delete,
            //   color: Colors.red,
            //   textStyle: TextStyle(color: Colors.white),
            //   iconColor: Colors.white,
            // ),
          );
    }

    showColors(){
      Dialogs.bottomMaterialDialog(
        
          msg: null,
          title: "Similar Products",
          color: Colors.white,
          context: context,
          
          actions:[
            
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(),
                            Product1(
                              img: 'assets/img4.png',
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            Product1(
                              img: 'assets/kidEye.png',
                            ),
                             SizedBox(
                              width: 10.w,
                            ),
                            Product1(
                              img: 'assets/img4.png',
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                             
                            Product1(
                              img: 'assets/img4.png',
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                          ],
                        ),
          ),
          ],
           
            // IconsOutlineButton(
            //   onPressed: () {},
            //   text: 'Cancel',
            //   iconData: Icons.cancel_outlined,
            //   textStyle: TextStyle(color: Colors.grey),
            //   iconColor: Colors.grey,
            // ),
            // IconsButton(
            //   onPressed: () {},
            //   text: 'Delete',
            //   iconData: Icons.delete,
            //   color: Colors.red,
            //   textStyle: TextStyle(color: Colors.white),
            //   iconColor: Colors.white,
            // ),
          );
    }
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  
                
                     TweenAnimationBuilder(
                        child: MyApp2(title: 'ank',),
                        duration: Duration(milliseconds: 3000),
                        curve: Curves.bounceOut,
                        tween: Tween(begin: 1.0, end: 0.0),
                        builder: (context, value, child){
                          return Transform.translate(
                            offset:  Offset(
                                0.0,
                              value * 60
                            ),
                            child: child,
                          );
                        },
                      ),
                  SizedBox(height: 10.h,),
                    TweenAnimationBuilder(
                        child: Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 10.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: (){
                            showSimilar();
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
                          child: Image.asset("assets/cards.png",fit: BoxFit.contain,height: 10.h,width: 10.w,)
                                              ) ,
                                            ),
                        ),
                    Container(
                      child: MultiPlay(color: Color(0xff36454f), subtitle: "Vincent Chase", weight: FontWeight.normal, size: 24)
                    ),
                    GestureDetector(
                      onTap: (){
                        showColors();
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
                        child: Padding(
                          padding:  EdgeInsets.all(10),
                          child: Image.asset("assets/colors.png",fit: BoxFit.contain,height: 20.h,width: 20.w,)
                        ) ,
                      ),
                    ),
                      ],
                    ),
                  ),
                        duration: Duration(milliseconds: 3000), 
                        curve: Curves.bounceOut, 
                        tween: Tween(begin: 1.0, end: 0.0), 
                        builder: (context, value, child){
                        // horizontal disposition of the widget. 
                         return Transform.translate( 
                             offset:  Offset( 
                                
                                0.0 ,
                                value * 500,
                             ), 
                             child: child, 
                           ); 
                         }, 
                      ),
                  
                  SizedBox(height: 10.h,),
                    TweenAnimationBuilder( 
                       child:   Padding(
                           padding:  EdgeInsets.symmetric(horizontal: 10.w),
                           child: Container(
                            width: double.infinity,
                            height: 40.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(topLeft: Radius.circular(10.r),topRight: Radius.circular(10.r)),
                              image: DecorationImage(image: AssetImage("assets/lemon.jpg"),fit: BoxFit.cover)
                            ),
                            child: Center(
                              child: Padding(
                                padding:EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Multi3(color: Color(0xff36454f), subtitle: "Rs 1000", weight: FontWeight.bold, size: 24),
                                    SizedBox(width: 7.w,),
                                    CrossOut(color: Color(0xff36454f), subtitle: "Rs 1200", weight: FontWeight.bold, size: 16)
                                  ],
                                ),
                              ),
                            ),
                                                 ),
                         ),
                        duration: Duration(milliseconds: 3000), 
                        curve: Curves.bounceOut, 
                        tween: Tween(begin: 1.0, end: 0.0), 
                        builder: (context, value, child){
                        // horizontal disposition of the widget. 
                         return Transform.translate( 
                             offset:  Offset( 
                               value * 500, 
                                0.0 
                             ), 
                             child: child, 
                           ); 
                         }, 
                       ), 
                        TweenAnimationBuilder( 
                       child:     Padding(
                             padding:  EdgeInsets.symmetric(horizontal: 10.w),
                             child: Container(
                               
                               height: 50.h,
                               width: double.infinity,
                               decoration: BoxDecoration(
                                 color: Color(0xff36454f),

                                 
                                 borderRadius: BorderRadius.only(
                                   bottomLeft: Radius.circular(15.r),
                                   bottomRight: Radius.circular(15.r)
                                 )
                               ),
                               child: Padding(
                                 padding: const EdgeInsets.all(8.0),
                                 child: Multi(color: Color(0xffEEF424), subtitle: "Stand out with Attachment Square - the perfect glasses frame to make a bold fashion statement. Elevate your style with Attachment Square", weight: FontWeight.bold, size: 11),
                               ),
                             ),
                           ),                  
                     
                        duration: Duration(milliseconds: 3000), 
                        curve: Curves.bounceOut, 
                        tween: Tween(begin: 1.0, end: 0.0), 
                        builder: (context, value, child){
                        // horizontal disposition of the widget. 
                         return Transform.translate( 
                             offset:  Offset( 
                               value * 500, 
                                0.0 
                             ), 
                             child: child, 
                           ); 
                         }, 
                       ), 
                    SizedBox(height: 10.h,),
                    FutureBuilder(
                      future: remover(),
                      builder: (context,index){
                        return Column(
                          children: [
                            Padding(
                           padding:  EdgeInsets.symmetric(horizontal: 10.w),
                           child: Container(
                            width: double.infinity,
                            height: 30.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(topLeft: Radius.circular(10.r),topRight: Radius.circular(10.r)),
                              image: DecorationImage(image: AssetImage("assets/charcoal.jpg"),fit: BoxFit.cover)
                            ),
                            child: Center(
                              child: Padding(
                                padding:EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Multi3(color: Colors.white, subtitle: "Product Description", weight: FontWeight.bold, size: 16),
                                  ],
                                ),
                              ),
                            ),
                                                 ),
                         ),
                            Padding(
                              padding:  EdgeInsets.symmetric(horizontal: 10.w),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Color(0xffEEF424),
                                    borderRadius: BorderRadius.only(
                                   bottomLeft: Radius.circular(15.r),
                                   bottomRight: Radius.circular(15.r)
                                 )
                                ),
                                width: double.infinity,
                                child: Padding(
                                  padding:EdgeInsets.symmetric(vertical: 10.h,horizontal: 10.w),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Multi3(color: Color(0xff36454f), subtitle: cleanString1.toString(), weight: FontWeight.bold, size: 12),
                                      Container()
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                       
                      }
                      )
                  












                    
                      
                       
                       
                 
                
                    
                 ,SizedBox(height: 100.h,)  
                ],
              ),
            ),
            Positioned(child: Container(
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                    width: 50.w,
                    height: 40.h,
                    child: NeumorphicButton(
                        child: Icon(Icons.arrow_back,color: Color.fromARGB(255, 86, 86, 86),),
                        style: NeumorphicStyle(
                          border: NeumorphicBorder(color: Color.fromARGB(255, 86, 86, 86),),
                          depth: -20,
                          color: Colors.transparent
                        ),
                        onPressed: () {
                        // Do something when the button is pressed
                        },
                      ),
                                  ),
                  ),
                  Container(
                    child:Row(
                      children: [
                       Container(
                    width: 50.w,
                    height: 40.h,
                    child: NeumorphicButton(
                      
                        child: Icon(Icons.favorite_outline,color: Color.fromARGB(255, 86, 86, 86),),
                        style: NeumorphicStyle(
                          shape: NeumorphicShape.flat,
                boxShape: NeumorphicBoxShape.circle(),
                          border: NeumorphicBorder(color: Color.fromARGB(255, 86, 86, 86),),
                          depth: -20,
                          color: Colors.transparent
                        ),
                        onPressed: () {
                        // Do something when the button is pressed
                        },
                      ),
                                  ),
                Container(
                    width: 50.w,
                    height: 40.h,
                    child: NeumorphicButton(
                        child: Icon(Icons.shopping_bag_outlined,color: Color.fromARGB(255, 86, 86, 86),),
                        style: NeumorphicStyle(
                          shape: NeumorphicShape.flat,
                boxShape: NeumorphicBoxShape.circle(),
                          border: NeumorphicBorder(color: Color.fromARGB(255, 86, 86, 86),),
                          depth: -20,
                          color: Colors.transparent
                        ),
                        onPressed: () {
                        // Do something when the button is pressed
                        },
                      ),
                                  ),
                      ],
                    ),
                  )
                ],
              ),
            )),
            Positioned(
              bottom: 0,right: 0,left: 0,
              child: Container(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap: (){
                        this1();
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 20.h,
                            width: 20.w,
                            decoration: BoxDecoration(
                              image: DecorationImage(image: AssetImage("assets/whatsapp.png"),fit: BoxFit.cover)
                            ),
                          ),
                          Container(
                            width: 65.w,
                            child: Multi(color: Color(0xff36454f), subtitle: "Buy on Whatsapp", weight: FontWeight.bold, size: 12))
                        ],
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 20.h,
                          width: 20.w,
                          decoration: BoxDecoration(
                            image: DecorationImage(image: AssetImage("assets/call.png"),fit: BoxFit.cover)
                          ),
                        ),
                        Container(
                          width: 60.w,
                          child: Multi(color: Color(0xff36454f), subtitle: "Buy on Call", weight: FontWeight.bold, size: 12))
                      ],
                    ),
                    Container(
                      height: 50.h,
                      width: 200.w,
                      child: ElevatedButton(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(),
                            Multi(
                                color: Colors.white,
                                subtitle: "Add to Cart",
                                weight: FontWeight.w600,
                                size: 18), // <-- Text
                            Icon(
                              // <-- Icon
                              Icons.arrow_forward,
                              size: 24.0,
                              color: Colors.white,
                            ),
                          ],
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xff36454f),
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(10.r), // <-- Radius
                          ),
                        ),
                        onPressed: () async {
                          _show();
                        //  Navigator.pop(context);
                        },
                      )),
                  ],
                ),
                height: 80.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                     color: Color(0xff36454f),
                     offset: Offset(1, 1),
                     spreadRadius: 10,
                     blurRadius: 15
                  )
                  ]
                ),
              ))
          ],
        ),
      ),
    ),
    builder: FlutterSmartDialog.init(),
    );
  }
}

class RaisedButton {
}