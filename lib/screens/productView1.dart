import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:material_dialogs/dialogs.dart';
import 'package:material_dialogs/widgets/buttons/icon_button.dart';
import 'package:material_dialogs/widgets/buttons/icon_outline_button.dart';
import 'package:optilook/provider/provider1.dart';
import 'package:optilook/screens/selectLens.dart';
import 'package:provider/provider.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:woocommerce_api/woocommerce_api.dart';
import '../constants/colors.dart';
import '../models/progressbar.dart';
import '../utils/crossout.dart';
import 'package:drop_shadow/drop_shadow.dart';
import '../utils/display1.dart';
import '../utils/lensShape.dart';
import '../utils/multi3.dart';
import '../utils/multi7.dart';
import '../utils/multiNumber.dart';
import '../utils/multiText.dart';
import '../utils/multiplay.dart';
import '../utils/para.dart';
import '../utils/product1.dart';
import '../utils/review.dart';
import '../utils/shape.dart';
import '../utils/slider.dart';
import '../utils/type2.dart';
import '../utils/types.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class ProductView1 extends StatefulWidget {
  String? id;
  String? name;
  String? price;
  String? regular_price;
  String? sale_price;
  String? description;
  String? description2;
  var related_ids;
  var variations;
  var variations_ids;
  var abc;
  ProductView1(
      {super.key,
      required this.id,
      required this.name,
      required this.price,
      required this.abc,
      required this.description,
      required this.description2,
      required this.regular_price,
      required this.sale_price,
      required this.related_ids,
      required this.variations,
      required this.variations_ids});

  @override
  State<ProductView1> createState() => _ProductView1State();
}

class _ProductView1State extends State<ProductView1> {
  @override
  Widget build(BuildContext context) {
    int i = 4;
    String? cleanString1;

    String removeHtmlTags(String htmlString) {
      RegExp exp = RegExp(r"<[^>]*>", multiLine: true, caseSensitive: true);
      String cleanString = htmlString.replaceAll(exp, '');

      RegExp exp2 =
          RegExp(r"<a.*?>(.*?)<\/a>", multiLine: true, caseSensitive: true);
      cleanString = cleanString.replaceAll(exp2, '');
      cleanString1 = cleanString;
      return cleanString;
    }

    remover() {
      String htmlString = '${widget.description2}';

      String cleanString = removeHtmlTags(htmlString);

      print(cleanString);
    }

    void this1() async {
      // Create a new instance of the WooCommerce API client
      WooCommerceAPI wcApi = WooCommerceAPI(
        url: "https://optilookpk.com", // Replace with your store URL
        consumerKey:
            "ck_c33fd0a8dbe04438618cebaa6bc8ab422b1755ed", // Replace with your consumer key
        consumerSecret:
            "cs_5c528f0b4620b24e4a831225605027651e267b72", // Replace with your consumer secret
        // Replace with your API version
      );

      // Call the "List Categories" endpoint to retrieve all categories
      // var categories = await wcApi.getAsync("products?category=67");
      var categories =
          await wcApi.getAsync("products/categories?slug=ophthalmic-lenses");

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
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: SingleChildScrollView(
                child: Column(
                 
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.w, vertical: 20.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.cancel_outlined,
                                color: Color(0xff36454f),
                              ),
                              SizedBox(
                                width: 15.w,
                              ),
                              Multi3(
                                  color: Color(0xff36454f),
                                  subtitle: "You use Eyeglasses for:",
                                  weight: FontWeight.bold,
                                  size: 18)
                            ],
                          ),
                          Container()
                        ],
                      ),
                    ),
                    // LenShape(
                    //   img: 'assets/powerspec.png',
                    //   heading: 'Powered Specs',
                    //   line2: 'For distance or near vision',
                    //   line3: '(Thin,anti-glare,blue-cut options)'
                    //   ),
                    // SizedBox(height: 10.h,),
                    // LenShape(
                    //   img: 'assets/blue.png',
                    //   heading: '0 Power Blue Computer Glasses',
                    //   line2: 'For distance or near vision',
                    //   line3: '(Thin,anti-glare,blue-cut options)'
                    //   ),
                    SizedBox(
                      height: 10.h,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SelectLens()),
                        );
                      },
                      child: LenShape(
                          img: 'assets/bifocal.png',
                          heading: 'Dual Vision Specs',
                          line2: 'For distance or near vision',
                          line3: '(Thin,anti-glare,blue-cut options)'),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: LenShape(
                          img: 'assets/frame.png',
                          heading: 'Frame Only',
                          line2: 'For distance or near vision',
                          line3: '(Thin,anti-glare,blue-cut options)'),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
        await Future.delayed(Duration(milliseconds: 500));
      }

      await locationDialog(height: 300.h, alignment: Alignment.bottomCenter);
    }

    showSimilar() {
      Dialogs.bottomMaterialDialog(
        msg: null,
        title: "Similar Products",
        color: Colors.white,
        context: context,

        actions: [
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

    showColors() {
      Dialogs.bottomMaterialDialog(
        msg: null,
        title: "Similar Products",
        color: Colors.white,
        context: context,

        actions: [
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

    final Provider11 = Provider.of<Provider1>(context,listen: true);
    return WillPopScope(
      onWillPop: () async {
        Provider11.variation1.clear();
        Provider11.related_ids.clear();
        return true;
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MaterialApp(
          builder: EasyLoading.init(),
          debugShowCheckedModeBanner: false,
          home: SafeArea(
            child: Scaffold(
              body: Stack(
                children: [
                  SingleChildScrollView(
                    child: Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        TweenAnimationBuilder(
                          child: MyApp2(
                            imgAddress: widget.abc,
                          ),
                          duration: Duration(milliseconds: 3000),
                          curve: Curves.bounceOut,
                          tween: Tween(begin: 1.0, end: 0.0),
                          builder: (context, value, child) {
                            return Transform.translate(
                              offset: Offset(0.0, value * 60),
                              child: child,
                            );
                          },
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        TweenAnimationBuilder(
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10.w),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GestureDetector(
                                  onTap: () async {
                                    EasyLoading.show(
                                      status: 'Please Wait...',
                                      dismissOnTap: false,
                                      maskType: EasyLoadingMaskType.black,
                                    );
                                    await Provider11.getRelatedIds(
                                        widget.related_ids, context);
                                    EasyLoading.dismiss();
                                    // Provider11.fetchProducts();
                                    // showSimilar();
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
                                            offset: Offset(1, 1),
                                            color: Colors.grey,
                                            spreadRadius: 2,
                                            blurRadius: 6)
                                      ],
                                    ),
                                    child: Padding(
                                        padding: EdgeInsets.all(10),
                                        child: Image.asset(
                                          "assets/cards.png",
                                          fit: BoxFit.contain,
                                          height: 10.h,
                                          width: 10.w,
                                        )),
                                  ),
                                ),
                                
                                Container(
                                  height: 40.h,
                                  width: 130.w,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(20.r),
                                    boxShadow: [
                                      BoxShadow(
                                          offset: Offset(1, 1),
                                          color: Colors.grey,
                                          spreadRadius: 2,
                                          blurRadius: 10)
                                    ],
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(2),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        GestureDetector(
                                          onTap: (){
                                            Provider11.currentImg=0;
                                          },
                                          child: Container(
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(20.r),
                                                  color: Provider11.currentImg==0? AppColors.charcoal
                                                      .withOpacity(0.3):Colors.transparent),
                                              child: Padding(
                                                padding: EdgeInsets.all(12),
                                                child: Multi(
                                                    color: AppColors.charcoal,
                                                    subtitle: "Photo",
                                                    weight: FontWeight.bold,
                                                    size: 12),
                                              )),
                                        ),
                                        GestureDetector(
                                          onTap: (){
                                            Provider11.currentImg=1;
                                          },
                                          child: Container(
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(20.r),
                                                  color:Provider11.currentImg==1? AppColors.charcoal
                                                      .withOpacity(0.3):Colors.transparent),
                                              child: Padding(
                                                padding: EdgeInsets.all(12),
                                                child: Multi(
                                                    color: AppColors.charcoal,
                                                    subtitle: "Try On",
                                                    weight: FontWeight.bold,
                                                    size: 12),
                                              )),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () async {
                                    EasyLoading.show(
                                      status: 'Please Wait...',
                                      dismissOnTap: false,
                                      maskType: EasyLoadingMaskType.black,
                                    );
                                    await Provider11.getVariation(
                                        widget.variations_ids, widget.id.toString(), context);
                                    EasyLoading.dismiss();
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
                                            offset: Offset(1, 1),
                                            color: Colors.grey,
                                            spreadRadius: 2,
                                            blurRadius: 6)
                                      ],
                                    ),
                                    child: Padding(
                                        padding: EdgeInsets.all(10),
                                        child: Image.asset(
                                          "assets/colors.png",
                                          fit: BoxFit.contain,
                                          height: 20.h,
                                          width: 20.w,
                                        )),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          duration: Duration(milliseconds: 3000),
                          curve: Curves.bounceOut,
                          tween: Tween(begin: 1.0, end: 0.0),
                          builder: (context, value, child) {
                            // horizontal disposition of the widget.
                            return Transform.translate(
                              offset: Offset(
                                0.0,
                                value * 500,
                              ),
                              child: child,
                            );
                          },
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        TweenAnimationBuilder(
                          child: 
                          Padding(
                            padding:EdgeInsets.only(left: 10.w),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                        child: MultiPlay(color: Color(0xff36454f), subtitle: "${widget.name}", weight: FontWeight.normal, size: 24)
                                      ),
                                SizedBox(height: 4.h,),
                                Multi(color: AppColors.charcoal, subtitle: 'Transparent Full Rim Rectangle', weight: FontWeight.normal, size: 12),
                                SizedBox(height: 3.h,),
                                Row(
                                  children: [
                                    Multi(color: AppColors.charcoal, subtitle: 'Frame Size: ', weight: FontWeight.normal, size: 12),
                                    Container(
                                      decoration: BoxDecoration(
                                        color: AppColors.charcoal.withOpacity(0.4),
                                        borderRadius: BorderRadius.circular(8.r)
                                      ),
                                      child: Padding(
                                        padding:EdgeInsets.only(top: 4.h,bottom: 4.h,right: 5.w,left: 5.w),
                                        child: Multi(color: Colors.white, subtitle: "medium", weight: FontWeight.normal, size: 10),
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(height: 3.h,),
                                Row(
                                  children: [
                                    Multi(color: AppColors.charcoal, subtitle: '4.1 ', weight: FontWeight.normal, size: 12),
                                    Icon(CupertinoIcons.star_fill,color: AppColors.lime,size: 12,),
                                    Multi(color: Color.fromARGB(255, 73, 85, 94), subtitle: ' 114 ratings', weight: FontWeight.normal, size: 12),
                                  ],
                                ),
                                SizedBox(height: 3.h,),
                                MultiNumber(color: AppColors.charcoal, subtitle: "Rs ${widget.price}", weight: FontWeight.w600, size: 28)
                              ],
                            ),
                          ),
                          // Padding(
                          //   padding: EdgeInsets.symmetric(horizontal: 10.w),
                          //   child: Container(
                          //     width: double.infinity,
                          //     height: 55.h,
                          //     decoration: BoxDecoration(
                          //         borderRadius: BorderRadius.only(
                          //             topLeft: Radius.circular(10.r),
                          //             topRight: Radius.circular(10.r)),
                          //         image: DecorationImage(
                          //             image: AssetImage("assets/lemon.jpg"),
                          //             fit: BoxFit.cover)),
                          //     child: Center(
                          //       child: Padding(
                          //         padding: EdgeInsets.all(8.0),
                          //         child: Row(
                          //           mainAxisAlignment: MainAxisAlignment.start,
                          //           children: [
                          //             Multi3(
                          //                 color: Color(0xff36454f),
                          //                 subtitle: "Rs $price",
                          //                 weight: FontWeight.bold,
                          //                 size: 24),
                          //             SizedBox(
                          //               width: 7.w,
                          //             ),
                          //             sale_price == ""
                          //                 ? Container()
                          //                 : CrossOut(
                          //                     color: Color(0xff36454f),
                          //                     subtitle: "Rs $regular_price",
                          //                     weight: FontWeight.bold,
                          //                     size: 16)
                          //           ],
                          //         ),
                          //       ),
                          //     ),
                          //   ),
                          // ),
                          
                          duration: Duration(milliseconds: 3000),
                          curve: Curves.bounceOut,
                          tween: Tween(begin: 1.0, end: 0.0),
                          builder: (context, value, child) {
                            // horizontal disposition of the widget.
                            return Transform.translate(
                              offset: Offset(value * 500, 0.0),
                              child: child,
                            );
                          },
                        ),
                        SizedBox(height: 10.h,),
                        TweenAnimationBuilder(
                          child: Container(
                            height: 60.h,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: AppColors.lime.withOpacity(0.4),
                                    ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 7,
                                    child: Center(
                                      child: Multi(
                                          color:AppColors.charcoal,
                                          subtitle: "${widget.description}",
                                          weight: FontWeight.normal,
                                          size: 11),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Icon(CupertinoIcons.check_mark_circled_solid,color: AppColors.charcoal,size: 25,)
                                      ],
                                    ))
                                ],
                              ),
                            ),
                          ),
                          duration: Duration(milliseconds: 3000),
                          curve: Curves.bounceOut,
                          tween: Tween(begin: 1.0, end: 0.0),
                          builder: (context, value, child) {
                            // horizontal disposition of the widget.
                            return Transform.translate(
                              offset: Offset(value * 500, 0.0),
                              child: child,
                            );
                          },
                        ),
                        SizedBox(
                          height: 10.h,
                        ),

                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(   
                            color: AppColors.charcoal.withOpacity(0.2),
                            border: Border(top: BorderSide(color: AppColors.charcoal,width: 1.5),bottom: BorderSide(color: AppColors.charcoal,width: 1.5))
                          ),
                          child: Padding(
                            padding:EdgeInsets.symmetric(horizontal: 10.w,vertical: 10.h),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 10.h,),
                                MultiPlay(color: AppColors.charcoal, subtitle: "Buy at Store", weight: FontWeight.w500, size: 21),
                                SizedBox(height: 15.h,),
                                Row(
                                  children: [
                                    CircleAvatar(
                                      backgroundColor: Colors.white,
                                      child: Icon(CupertinoIcons.settings,color: AppColors.charcoal,size: 25.sp,),
                                      radius: 20.r,
                                    ),
                                    SizedBox(width: 10.w,),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Multi(color: AppColors.charcoal, subtitle: 'Free Eye Test', weight: FontWeight.w700, size: 14),
                                        SizedBox(height: 4.h,),
                                        Multi(color: AppColors.charcoal, subtitle: 'Using Our State of Art Machine', weight: FontWeight.w500, size: 12),
                                      ],
                                    ),

                                  ],
                                ),
                                SizedBox(height: 15.h,),
                                Row(
                                  children: [
                                    CircleAvatar(
                                      backgroundColor: Colors.white,
                                      child:Image.asset("assets/spray.png",height: 25.h,width: 25.w,color: AppColors.charcoal,),
                                      radius: 20.r,
                                    ),
                                    SizedBox(width: 10.w,),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Multi(color: AppColors.charcoal, subtitle: 'Free Lens Cleaner', weight: FontWeight.w700, size: 14),
                                        SizedBox(height: 4.h,),
                                        Multi(color: AppColors.charcoal, subtitle: '150ml solution worth 200/.', weight: FontWeight.w500, size: 12),
                                      ],
                                    ),

                                  ],
                                ),
                                SizedBox(height: 15.h,),
                                Row(
                                  children: [
                                    CircleAvatar(
                                      backgroundColor: Colors.white,
                                      child: Image.asset("assets/search.png",height: 25.h,width: 25.w,color: AppColors.charcoal,),
                                      radius: 20.r,
                                    ),
                                    SizedBox(width: 10.w,),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Multi(color: AppColors.charcoal, subtitle: 'Free Repair', weight: FontWeight.w700, size: 14),
                                        SizedBox(height: 4.h,),
                                        Multi(color: AppColors.charcoal, subtitle: 'for frames bought from any shop', weight: FontWeight.w500, size: 12),
                                      ],
                                    ),

                                  ],
                                ),
                                // SizedBox(
                                //   height:10.h
                                // ),
                                DropShadow(
                                  child: Container(
                                    height: 40.h,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15.r)
                                    ),
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: AppColors.charcoal,
                                        
                                      ),
                                      onPressed: (){}, 
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Icon(CupertinoIcons.location,color: Colors.white,),
                                          SizedBox(width: 10.w,),
                                          Multi(color: Colors.white, subtitle: "Use my Current Location", weight: FontWeight.bold, size: 14),
                                          
                                          
                                        ],
                                      )
                                      ),
                                  )
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 20.h,),
                        Padding(
                          padding:EdgeInsets.only(left: 10.w),
                          child: Multi(color: AppColors.charcoal, subtitle: "Check Delievery Options", weight: FontWeight.bold, size: 16),
                        ),
                        SizedBox(height: 15.h,),
                        Padding(
                          padding:  EdgeInsets.symmetric(horizontal: 10.w),
                          child: Container(
                            decoration: BoxDecoration(
                              color:AppColors.charcoal,
                              border: Border.all(color: Color.fromARGB(255, 154, 154, 154),width: 0.5),
                              borderRadius: BorderRadius.circular(10.r),
                              
                            ),
                            child: Padding(
                              padding:EdgeInsets.all(10),
                              child: Row(children: [
                                Expanded(
                                  flex: 9,
                                  child: Container(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Icon(CupertinoIcons.location_solid,color: Colors.white,),
                                        SizedBox(width: 5.w,),
                                        Multi(color: Colors.white, subtitle: "Enable Location For Delievery", weight: FontWeight.w500, size: 14),
                            
                                      ],
                                    ),
                                  )
                                  ),
                                Expanded(
                                  flex: 2,
                                  child: GestureDetector(
                                    onTap: (){
                                      
                                    },
                                    child: Multi3(color: AppColors.lime, subtitle: "ENABLE", weight: FontWeight.bold, size: 16))
                                  ),
                              ]),
                            ),
                          ),
                        ),
                        SizedBox(height: 20.h,),
                        Padding(
                          padding:  EdgeInsets.only(right: 10.w),
                          child: Row(
                            children: [
                              Expanded(
                                flex:2,
                                child: CircleAvatar(
                                  backgroundColor:Color.fromARGB(255, 154, 154, 154),
                                  radius: 24,
                                  child: CircleAvatar(
                                    backgroundColor: Colors.white,
                                                          radius:20.r,
                                                          child: Padding(
                                                            padding:EdgeInsets.all(10),
                                                            child: Image.asset("assets/home.png",height: 30.h,width: 30.w,color: AppColors.charcoal,),
                                                          ),
                                                        ),
                                )
                                ),
                                Expanded(
                                  flex: 8,
                                  child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Multi(color: AppColors.charcoal, subtitle: 'Free Repair', weight: FontWeight.w700, size: 14),
                                          SizedBox(height: 4.h,),
                                          Multi(color: AppColors.charcoal, subtitle: 'for frames bought from any shop', weight: FontWeight.w500, size: 12),
                                        ],
                                      ),)
                            ],
                          ),
                        ),
                        SizedBox(height: 5.h,),
                        Padding(
                          padding:  EdgeInsets.symmetric(horizontal: 10.w),
                          child: Divider(
                            color:Color.fromARGB(255, 154, 154, 154) ,
                            thickness: 1,
                          ),
                        ),
                        SizedBox(height: 5.h,),
                        Padding(
                          padding:  EdgeInsets.only(right: 10.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                flex:2,
                                child: CircleAvatar(
                                  backgroundColor:Color.fromARGB(255, 154, 154, 154),
                                  radius: 24,
                                  child: CircleAvatar(
                                    backgroundColor: Colors.white,
                                                          radius:20.r,
                                                          child: Padding(
                                                            padding:EdgeInsets.all(10),
                                                            child: Image.asset("assets/shop.png",height: 30.h,width: 30.w,color: AppColors.charcoal,),
                                                          ),
                                                        ),
                                )
                                ),
                                Expanded(
                                  flex: 8,
                                  child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Multi(color: AppColors.charcoal, subtitle: 'Pickup from Store', weight: FontWeight.w700, size: 14),
                                          SizedBox(height: 4.h,),
                                          Multi(color: AppColors.charcoal, subtitle: 'Buy online and get it delievered at your nearest store', weight: FontWeight.w500, size: 12),
                                          SizedBox(height: 4.h,),
                                          Container(
                              decoration: BoxDecoration(
                                color:AppColors.charcoal,
                                border: Border.all(color: Color.fromARGB(255, 154, 154, 154),width: 0.5),
                                borderRadius: BorderRadius.circular(10.r),
                                
                              ),
                              child: Padding(
                                padding:EdgeInsets.all(5),
                                child: Row(children: [
                                  Expanded(
                                    flex: 3,
                                    child: Row(
                                      children: [
                                        Expanded(
                                          flex: 2,
                                          child:  Padding(
                                            padding:EdgeInsets.only(right:4.w),
                                            child: Image.asset("assets/size.png",height: 40.h,width:40.w,color:AppColors.lime),
                                          ),),
                                        Expanded(
                                          flex: 3,
                                          child: Multi(color: Colors.white, subtitle: "Ensure Perfect Fit", weight: FontWeight.w500, size: 10))
                                      ],
                                    )
                                    ),
                                 Expanded(
                                    flex: 3,
                                    child: Row(
                                      children: [
                                        Expanded(
                                          flex: 2,
                                          child:  Padding(
                                            padding:EdgeInsets.only(left:4.w,right:5.w),
                                            child: Image.asset("assets/expert.png",height: 40.h,width:40.w,color:AppColors.lime),
                                          ),),
                                        Expanded(
                                          flex: 4,
                                          child: Multi(color: Colors.white, subtitle: "Expert Supervision", weight: FontWeight.w500, size: 10))
                                      ],
                                    )
                                    ),
                                  Expanded(
                                    flex: 3,
                                    child: Row(
                                      children: [
                                        Expanded(
                                          flex: 2,
                                          child:  Padding(
                                            padding:EdgeInsets.only(left:4.w,right:5.w),
                                            child: Image.asset("assets/exchange.png",height: 40.h,width:40.w,color:AppColors.lime),
                                          ),),
                                        Expanded(
                                          flex: 3,
                                          child: Multi(color: Colors.white, subtitle: "Hassle Free Exchange", weight: FontWeight.w500, size: 10))
                                      ],
                                    )
                                    ),
                                ]),
                              ),
                            ),
                                        ],
                                      ),)
                            ],
                          ),
                        ),
                        SizedBox(height: 20.h,),
                        Center(
                          child: Container(
                            height: 50.h,
                            width: 100.w,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage("assets/logo.png",),
                                fit: BoxFit.contain
                                )
                            ),
                          ),
                        ),
                        SizedBox(height: 5.h,),
                        Center(child: Multi7(color: AppColors.charcoal, subtitle: "ESSENTIALS", weight: FontWeight.normal, size: 25)),
                        SizedBox(height: 5.h,),
                        Padding(
                          padding:  EdgeInsets.symmetric(horizontal: 80.w),
                          child: Container(
                            height: 200.h,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage("https://marveloptics.com/wp-content/uploads/2019/07/32_Mens-Prescription-Eyeglasses.jpg"),
                                fit: BoxFit.cover
                                )
                            ),
                          ),
                        ),
                        SizedBox(height: 15.h,),
                        Padding(
                          padding:  EdgeInsets.symmetric(horizontal: 10.w),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 2,
                                child: Center(
                                  child: Multi7(
                                    color: AppColors.charcoal, 
                                    subtitle: "subtitle", 
                                    weight: FontWeight.normal, 
                                    size: 18),
                                ) ),
                              Expanded(
                                flex: 4,
                                child:Container(
                                   height: 100.h,
                                  width: 100.w,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: NetworkImage("https://marveloptics.com/wp-content/uploads/2019/07/32_Mens-Prescription-Eyeglasses.jpg"),
                                      fit: BoxFit.cover
                                      )
                                  ),
                                ) ),
                            ],
                          ),
                        ),
 Padding(
   padding:  EdgeInsets.symmetric(horizontal: 10.w),
   child: Row(
                                children: [
                                  Expanded(
                                    flex: 4,
                                    child:Container(
                                      height: 100.h,
                                      width: 100.w,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: NetworkImage("https://marveloptics.com/wp-content/uploads/2019/07/32_Mens-Prescription-Eyeglasses.jpg"),
                                          fit: BoxFit.cover
                                          )
                                      ),
                                    )
                                     ),
                                  Expanded(
                                    flex: 2,
                                    child:Center(
                                      child: Multi7(
                                        color: AppColors.charcoal, 
                                        subtitle: "subtitle", 
                                        weight: FontWeight.normal, 
                                        size: 18),
                                    ) ),
                                 ],
                              ),
 ),
  SizedBox(height: 20.h,),
   Padding(
                          padding:EdgeInsets.only(left: 10.w),
                          child: Multi(color: AppColors.charcoal, subtitle: "Commitment to Quality", weight: FontWeight.bold, size: 16),
                        ),
                        SizedBox(height:10.h),
                        Padding(
                          padding:EdgeInsets.symmetric(horizontal: 10.w),
                          child: Para(color: AppColors.charcoal, subtitle: "We at Optilook are commited to giving you the best quality possible. Give us a try, you will love us..", weight: FontWeight.normal, size: 10),
                        ),
                        SizedBox(height:10.h),
                        Row(
                          children: [
                            Expanded(
                              flex: 3,
                              child: Column(
                                children: [
                                  Image.asset(
                                    "assets/warranty2.png",
                                    height: 40.h,
                                    width: 40.w,
                                    color: AppColors.charcoal,
                                    ),
                                  SizedBox(height: 3.h,),
                                    Multi(color: AppColors.charcoal, subtitle: "1 Year Warranty", weight: FontWeight.w500, size: 12)
                                ],
                              )),
                            Expanded(
                              flex: 3,
                              child: Column(
                                children: [
                                  Image.asset(
                                    "assets/exchange2.png",
                                    height: 40.h,
                                    width: 40.w,
                                    color: AppColors.charcoal,
                                    ),
                                    SizedBox(height: 3.h,),
                                    Multi(color: AppColors.charcoal, subtitle: "14 Days Exchange Policy", weight: FontWeight.w500, size: 12)
                                ],
                              )),
                          ],
                        ),
                         SizedBox(height: 10.h,),
                        Padding(
                          padding:  EdgeInsets.symmetric(horizontal: 10.w),
                          child: Divider(
                            color:Color.fromARGB(255, 154, 154, 154) ,
                            thickness: 1,
                          ),
                        ),
                        SizedBox(height: 20.h,),
                        Padding(
                          padding:  EdgeInsets.symmetric(horizontal: 10.w),
                          child: Multi7(color: AppColors.charcoal, subtitle: "Product Details", weight: FontWeight.bold, size: 15),
                        ),
                        SizedBox(height: 10.h,),
                        Padding(
                          padding:  EdgeInsets.symmetric(horizontal: 10.w),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 2,
                                child: Container(
                                  child: Multi(
                                    color: AppColors.charcoal, 
                                    subtitle: "About the Product", 
                                    weight: FontWeight.normal, 
                                    size: 12
                                    ),
                                )
                                ),
                              Expanded(
                                flex: 6,
                                child: Container(
                                  child: Multi(
                                    color: AppColors.charcoal, 
                                    subtitle: "Transparent Gold Full Rim Rectangle Optilook Air Essentials", 
                                    weight: FontWeight.w600, 
                                    size: 12
                                    ),
                                )
                                ),
                            ],
                          ),
                        ),
                        SizedBox(height: 10.h,),
                        Padding(
                          padding:  EdgeInsets.symmetric(horizontal: 10.w),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 2,
                                child: Container(
                                  child: Multi(
                                    color: AppColors.charcoal, 
                                    subtitle: "Product ID", 
                                    weight: FontWeight.normal, 
                                    size: 12
                                    ),
                                )
                                ),
                              Expanded(
                                flex: 6,
                                child: Container(
                                  child: Multi(
                                    color: AppColors.charcoal, 
                                    subtitle: "146012", 
                                    weight: FontWeight.w600, 
                                    size: 12
                                    ),
                                )
                                ),
                            ],
                          ),
                        ),
                        SizedBox(height: 10.h,),
                         Padding(
                           padding:  EdgeInsets.symmetric(horizontal: 10.w),
                           child: Row(
                            children: [
                              Expanded(
                                flex: 2,
                                child: Container(
                                  child: Multi(
                                    color: AppColors.charcoal, 
                                    subtitle: "Frame Style", 
                                    weight: FontWeight.normal, 
                                    size: 12
                                    ),
                                )
                                ),
                              Expanded(
                                flex: 6,
                                child: Container(
                                  child: Multi(
                                    color: AppColors.charcoal, 
                                    subtitle: "Light-Weight", 
                                    weight: FontWeight.w600, 
                                    size: 12
                                    ),
                                )
                                ),
                            ],
                                                 ),
                         ),
                        SizedBox(height: 10.h,),
                         Padding(
                          padding:  EdgeInsets.symmetric(horizontal: 10.w),
                           child: Row(
                            children: [
                              Expanded(
                                flex: 2,
                                child: Container(
                                  child: Multi(
                                    color: AppColors.charcoal, 
                                    subtitle: "Frame Width", 
                                    weight: FontWeight.normal, 
                                    size: 12
                                    ),
                                )
                                ),
                              Expanded(
                                flex: 6,
                                child: Container(
                                  child: Multi(
                                    color: AppColors.charcoal, 
                                    subtitle: "134 mm", 
                                    weight: FontWeight.w600, 
                                    size: 12
                                    ),
                                )
                                ),
                            ],
                                                 ),
                         ),
                        SizedBox(height: 10.h,),
                         Padding(
                          padding:  EdgeInsets.symmetric(horizontal: 10.w),
                           child: Row(
                            children: [
                              Expanded(
                                flex: 2,
                                child: Container(
                                  child: Multi(
                                    color: AppColors.charcoal, 
                                    subtitle: "Weight", 
                                    weight: FontWeight.normal, 
                                    size: 12
                                    ),
                                )
                                ),
                              Expanded(
                                flex: 6,
                                child: Container(
                                  child: Multi(
                                    color: AppColors.charcoal, 
                                    subtitle: "17 g", 
                                    weight: FontWeight.w600, 
                                    size: 12
                                    ),
                                )
                                ),
                            ],
                                                 ),
                         ),
                        SizedBox(height: 10.h,),
                         Padding(
                          padding:  EdgeInsets.symmetric(horizontal: 10.w),
                           child: Row(
                            children: [
                              Expanded(
                                flex: 2,
                                child: Container(
                                  child: Multi(
                                    color: AppColors.charcoal, 
                                    subtitle: "Material", 
                                    weight: FontWeight.normal, 
                                    size: 12
                                    ),
                                )
                                ),
                              Expanded(
                                flex: 6,
                                child: Container(
                                  child: Multi(
                                    color: AppColors.charcoal, 
                                    subtitle: "Acetate", 
                                    weight: FontWeight.w600, 
                                    size: 12
                                    ),
                                )
                                ),
                            ],
                                                 ),
                         ),
                        SizedBox(height: 10.h,),
                         Padding(
                           padding:  EdgeInsets.symmetric(horizontal: 10.w),
                           child: Row(
                            children: [
                              Expanded(
                                flex: 2,
                                child: Container(
                                  child: Multi(
                                    color: AppColors.charcoal, 
                                    subtitle: "Collection", 
                                    weight: FontWeight.normal, 
                                    size: 12
                                    ),
                                )
                                ),
                              Expanded(
                                flex: 6,
                                child: Container(
                                  child: Multi(
                                    color: AppColors.charcoal, 
                                    subtitle: "Air Essentials", 
                                    weight: FontWeight.w600, 
                                    size: 12
                                    ),
                                )
                                ),
                            ],
                                                 ),
                         ),
                        SizedBox(height: 10.h,),
                         Padding(
                          padding:  EdgeInsets.symmetric(horizontal: 10.w),
                           child: Row(
                            children: [
                              Expanded(
                                flex: 2,
                                child: Container(
                                  child: Multi(
                                    color: AppColors.charcoal, 
                                    subtitle: "Height", 
                                    weight: FontWeight.normal, 
                                    size: 12
                                    ),
                                )
                                ),
                              Expanded(
                                flex: 6,
                                child: Container(
                                  child: Multi(
                                    color: AppColors.charcoal, 
                                    subtitle: "34 mm", 
                                    weight: FontWeight.w600, 
                                    size: 12
                                    ),
                                )
                                ),
                            ],
                                                 ),
                         ),
                        SizedBox(height: 20.h,),
                       Container(
                        width:double.infinity,
                        // color:AppColors.charcoal,
                         child: Column(
                          children: [
                             Padding(
                            padding:  EdgeInsets.symmetric(horizontal: 10.w),
                            child: Column(
                              children: [
                                Padding(
                                  padding:  EdgeInsets.only(bottom: 10.h),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        flex:4,
                                        child:Multi(color: Colors.white, subtitle: "Reviews and Ratings", weight: FontWeight.bold, size: 12)
                                        ),
                                     Expanded(
                                        flex:4,
                                        child: Container(
                                                                      height: 20.h,
                                                                      width: 130.w,
                                                                      child: ElevatedButton(
                                                                        child: Row(
                                                                          mainAxisAlignment:
                                          MainAxisAlignment.center,
                                                                          children: [
                                        Container(),
                                        Multi(color: Colors.white, subtitle: "WRITE A REVIEW", weight: FontWeight.bold, size: 12)
                                                                           
                                                                          ],
                                                                        ),
                                                                        style: ElevatedButton.styleFrom(
                                                                          backgroundColor: Color(0xff36454f),
                                                                          shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                            2.r), // <-- Radius
                                                                          ),
                                                                        ),
                                                                        onPressed: () async {
                                                                      
                                                                          //  Navigator.pop(context);
                                                                        },
                                                                      )),
                                        ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                           
                            Padding(
                              padding:  EdgeInsets.symmetric(horizontal: 10.w),
                              child: Row(
                                children: [
                                   Expanded(
                                    flex:4,
                                    child:Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Multi(color: AppColors.charcoal, subtitle: "Average Rating", weight: FontWeight.bold, size: 10),
                                        SizedBox(height:5.h),
                                        Container(
                                        height: 40.h,
                                        width: 60.w,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10.r),
                                          color: AppColors.lime
                                        ),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            MultiNumber(color: Colors.white, subtitle: "4.7", weight: FontWeight.normal, size: 20),
                                            SizedBox(width: 3.w,),
                                            Icon(CupertinoIcons.star_fill,color: Colors.white,size: 20,)
                                          ],
                                        ),
                                        ),
                                        SizedBox(height:5.h),
                                        Multi(color: AppColors.charcoal, subtitle: "Total 114 Ratings", weight: FontWeight.normal, size: 10),
                            
                                      ],
                                    ) 
                                    ),
                                     Expanded(
                                    flex:1,
                                    child:Column(
                                      children: [
                                        MultiNumber(color: AppColors.charcoal, subtitle: "5 star", weight: FontWeight.bold, size: 10),
                                        SizedBox(height: 5.h,),
                                        MultiNumber(color: AppColors.charcoal, subtitle: "4 star", weight: FontWeight.bold, size: 10),
                                         SizedBox(height: 5.h,),
                                        MultiNumber(color: AppColors.charcoal, subtitle: "3 star", weight: FontWeight.bold, size: 10),
                                         SizedBox(height: 5.h,),
                                        MultiNumber(color: AppColors.charcoal, subtitle: "2 star", weight: FontWeight.bold, size: 10),
                                         SizedBox(height: 5.h,),
                                        MultiNumber(color: AppColors.charcoal, subtitle: "1 star", weight: FontWeight.bold, size: 10)
                                      ],
                                    ) 
                                    ),
                                     Expanded(
                                    flex:4,
                                    child:Column(
                                      children: [
                                        Progress(val: 50.0,),
                                        SizedBox(height: 5.h,),
                                        Progress(val: 40.0,),
                                        SizedBox(height: 5.h,),
                                        Progress(val: 30.0,),
                                        SizedBox(height: 5.h,),
                                        Progress(val: 20.0,),
                                        SizedBox(height: 5.h,),
                                        Progress(val: 10.0,),
                            
                                      ],
                                    ) 
                                    ),
                                     Expanded(
                                    flex:1,
                                    child:Column(
                                      children: [
                                        MultiNumber(color: AppColors.charcoal, subtitle: "50%", weight: FontWeight.bold, size: 10),
                                        SizedBox(height: 5.h,),
                                        MultiNumber(color: AppColors.charcoal, subtitle: "40%", weight: FontWeight.bold, size: 10),
                                         SizedBox(height: 5.h,),
                                        MultiNumber(color: AppColors.charcoal, subtitle: "30%", weight: FontWeight.bold, size: 10),
                                         SizedBox(height: 5.h,),
                                        MultiNumber(color: AppColors.charcoal, subtitle: "20%", weight: FontWeight.bold, size: 10),
                                         SizedBox(height: 5.h,),
                                        MultiNumber(color: AppColors.charcoal, subtitle: "10%", weight: FontWeight.bold, size: 10)
                                      ],
                                    ) 
                                    ),
                                ],
                              ),
                            ) ,
                          ],
                         ),
                       ),
                      












                        // FutureBuilder(
                        //     future: remover(),
                        //     builder: (context, index) {
                        //       return Column(
                        //         children: [
                        //           Padding(
                        //             padding:
                        //                 EdgeInsets.symmetric(horizontal: 10.w),
                        //             child: Container(
                        //               width: double.infinity,
                        //               height: 40.h,
                        //               decoration: BoxDecoration(
                        //                   borderRadius: BorderRadius.only(
                        //                       topLeft: Radius.circular(10.r),
                        //                       topRight: Radius.circular(10.r)),
                        //                   image: DecorationImage(
                        //                       image: AssetImage(
                        //                           "assets/charcoal.jpg"),
                        //                       fit: BoxFit.cover)),
                        //               child: Center(
                        //                 child: Padding(
                        //                   padding: EdgeInsets.all(8.0),
                        //                   child: Row(
                        //                     mainAxisAlignment:
                        //                         MainAxisAlignment.start,
                        //                     children: [
                        //                       Multi3(
                        //                           color: Colors.white,
                        //                           subtitle:
                        //                               "Product Description",
                        //                           weight: FontWeight.bold,
                        //                           size: 16),
                        //                     ],
                        //                   ),
                        //                 ),
                        //               ),
                        //             ),
                        //           ),
                        //           Padding(
                        //             padding:
                        //                 EdgeInsets.symmetric(horizontal: 10.w),
                        //             child: Container(
                        //               decoration: BoxDecoration(
                        //                   color: Color(0xffEEF424),
                        //                   borderRadius: BorderRadius.only(
                        //                       bottomLeft: Radius.circular(15.r),
                        //                       bottomRight:
                        //                           Radius.circular(15.r))),
                        //               width: double.infinity,
                        //               child: Padding(
                        //                 padding: EdgeInsets.symmetric(
                        //                     vertical: 10.h, horizontal: 10.w),
                        //                 child: Container(
                        //                   width: 160.w,
                        //                   child: SingleChildScrollView(
                        //                     scrollDirection: Axis.horizontal,
                        //                     child: Row(
                        //                       mainAxisAlignment:
                        //                           MainAxisAlignment
                        //                               .spaceBetween,
                        //                       children: [
                        //                         Multi3(
                        //                             color: Color(0xff36454f),
                        //                             subtitle:
                        //                                 cleanString1.toString(),
                        //                             weight: FontWeight.bold,
                        //                             size: 12),
                        //                         Container()
                        //                       ],
                        //                     ),
                        //                   ),
                        //                 ),
                        //               ),
                        //             ),
                        //           ),
                        //         ],
                        //       );
                        //     }),
                        SizedBox(
                          height: 20.h,
                        ),
                        ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: i,
                          itemBuilder: (context,index){
                            return Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10.w),
                              child: Padding(
                                padding:  EdgeInsets.only(top:5.h),
                                child: Column(
                                  children: [
                                    Review(),
                                    SizedBox(height:4.h),
                                     Padding(
                          padding:  EdgeInsets.symmetric(horizontal: 10.w),
                          child: Divider(
                            color:Color.fromARGB(255, 154, 154, 154) ,
                            thickness: 1,
                          ),
                        ),
                                  ],
                                ),
                              ),
                            );
                          }),
                          SizedBox(height: 10.h,),
                          Center(
                            child: Container(
                                                                      height: 20.h,
                                                                      width: 160.w,
                                                                      child: ElevatedButton(
                                                                        child: Row(
                                                                          mainAxisAlignment:
                                          MainAxisAlignment.center,
                                                                          children: [
                                        Container(),
                                        Multi(color: Colors.white, subtitle: "Read All 25 Reviews", weight: FontWeight.bold, size: 12)
                                                                           
                                                                          ],
                                                                        ),
                                                                        style: ElevatedButton.styleFrom(
                                                                          backgroundColor: Color(0xff36454f),
                                                                          shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                            2.r), // <-- Radius
                                                                          ),
                                                                        ),
                                                                        onPressed: () async {
                                                                            setState(() {
                                                                              i=25;
                                                                            });
                                                                          //  Navigator.pop(context);
                                                                        },
                                                                      )),
                          ),
                          SizedBox(height: 20.h,),
                          Container(
                            height: 100.h,
                            width: double.infinity,
                            color: AppColors.charcoal,
                            child: Padding(
                              padding:EdgeInsets.all(5),
                              child: Column(
                                children: [
                                  Multi(color: Colors.white, subtitle: "Can we Help?", weight: FontWeight.bold, size: 12),
                                 SizedBox(height: 10.h,),
                                  Row(
                            children: [
                              Expanded(
                                  flex: 3,
                                  child: Container(
                                    child: ElevatedButton(
                                      onPressed: () async{
                                        // await  FlutterPhoneDirectCaller.callNumber(widget.phone.toString());
                                      },
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Image.asset(
                                            "assets/call2.png",
                                            height: 45.h,
                                            width: 45.w,
                                          ),
                                          Multi(
                                              color: Colors.white,
                                              subtitle: "Phone Call",
                                              weight: FontWeight.bold,
                                              size: 12)
                                        ],
                                      ),
                                      style: ElevatedButton.styleFrom(
                                          primary:
                                              Color.fromARGB(255, 54, 53, 53),
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 15.w, vertical: 5.h),
                                          textStyle: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold)),
                                    ),
                                  )),
                              Expanded(
                                  flex: 3,
                                  child: Container(
                                    child: Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: ElevatedButton(
                                        onPressed: () async {
                                          // final countryCode =
                                          //     '92'; // Replace with the country code for Pakistan
                                          // final url =
                                          //     'https://wa.me/$countryCode${widget.phone}'; // Construct the URL

                                          // if (await canLaunch(url)) {
                                          //   await launch(url);
                                          // } else {
                                          //   throw 'Could not launch WhatsApp. Make sure the app is installed on your device.';
                                          // }
                                        },
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Image.asset(
                                              "assets/whatsapp2.png",
                                              height: 45.h,
                                              width: 45.w,
                                            ),
                                            Container(
                                                width: 70.w,
                                                child: Multi(
                                                    color: Colors.white,
                                                    subtitle: "Whatsapp Call",
                                                    weight: FontWeight.bold,
                                                    size: 12))
                                          ],
                                        ),
                                        style: ElevatedButton.styleFrom(
                                            primary:
                                                Color.fromARGB(255, 54, 53, 53),
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 15.w,
                                                vertical: 5.h),
                                            textStyle: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold)),
                                      ),
                                    ),
                                  )),
                            ],
                          )
                                ],
                              ),
                            ),
                          ),
SizedBox(height: 80.h,),
                      ],
                    ),
                  ),
                  Positioned(
                      child: Container(
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: () {
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
                                      offset: Offset(1, 1),
                                      color: Colors.grey,
                                      spreadRadius: 2,
                                      blurRadius: 6)
                                ],
                              ),
                              child: Padding(
                                  padding: EdgeInsets.all(10),
                                  child: Image.asset(
                                    "assets/back.png",
                                    fit: BoxFit.contain,
                                    height: 10.h,
                                    width: 10.w,
                                  )),
                            ),
                          ),
                        ),
                        Container(
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  height: 40.h,
                                  width: 40.w,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(color: Colors.grey),
                                    shape: BoxShape.circle,
                                    boxShadow: [
                                      BoxShadow(
                                          offset: Offset(1, 1),
                                          color: Colors.grey,
                                          spreadRadius: 2,
                                          blurRadius: 6)
                                    ],
                                  ),
                                  child: Padding(
                                      padding: EdgeInsets.all(10),
                                      child: Image.asset(
                                        "assets/heart.png",
                                        fit: BoxFit.contain,
                                        height: 10.h,
                                        width: 10.w,
                                      )),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  height: 40.h,
                                  width: 40.w,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(color: Colors.grey),
                                    shape: BoxShape.circle,
                                    boxShadow: [
                                      BoxShadow(
                                          offset: Offset(1, 1),
                                          color: Colors.grey,
                                          spreadRadius: 2,
                                          blurRadius: 6)
                                    ],
                                  ),
                                  child: Padding(
                                      padding: EdgeInsets.all(10),
                                      child: Image.asset(
                                        "assets/bag.png",
                                        fit: BoxFit.contain,
                                        height: 20.h,
                                        width: 20.w,
                                      )),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  )),
                  Positioned(
                      bottom: 0,
                      right: 0,
                      left: 0,
                      child: Container(
                        child:  Padding(
                          padding:EdgeInsets.all(12),
                          child: Container(
                                  height: 50.h,
                                  width: 200.w,
                                  child: ElevatedButton(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
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
                                        borderRadius: BorderRadius.circular(
                                            10.r), // <-- Radius
                                      ),
                                    ),
                                    onPressed: () async {
                                      _show();
                                      //  Navigator.pop(context);
                                    },
                                  )),
                        ),
                        height: 80.h,
                        width: double.infinity,
                        decoration:
                            BoxDecoration(color: Colors.white, boxShadow: [
                          BoxShadow(
                              color: Color(0xff36454f),
                              offset: Offset(1, 1),
                              spreadRadius: 10,
                              blurRadius: 15)
                        ]),
                      ))
                ],
              ),
            ),
          ),
        ),
        builder: FlutterSmartDialog.init(),
      ),
    );
  }
}

class RaisedButton {}
