import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:optilook/provider/provider1.dart';
import 'package:provider/provider.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import '../utils/display1.dart';
import '../utils/multi3.dart';
import '../utils/multiText.dart';
import '../utils/product1.dart';
import '../utils/product2.dart';
import '../utils/shape.dart';
import '../utils/type2.dart';
import '../utils/types.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  final controller = ScrollController();
  void onListenerController(){
    setState(() {
      
    });
  }
  @override
  void initState() {
    controller.addListener(onListenerController);
    super.initState();
  }
  @override
  void dispose() {
    controller.removeListener(onListenerController);
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final Provider11 = Provider.of<Provider1>(context);
    return SafeArea(
      child: Container(
        child: Scaffold(
          backgroundColor: Color(0xffF8F8F8),
          body: Stack(
            children: [
              Padding(
                padding: EdgeInsets.only(right: 10.w, left: 10.w, top: 130.h),
                child: Container(
                  child: ListView(
                    
                    controller: controller,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      
                      Container(
                        height: 150.h,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.r),
                            image: DecorationImage(
                                image: AssetImage("assets/sal3.png"),
                                fit: BoxFit.cover)),
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      Multi3(
                          color: Color(0xff36454f),
                          subtitle: "Frame Categories",
                          weight: FontWeight.bold,
                          size: 21),
                      SizedBox(
                        height: 15.h,
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            Container(
                              height: 50.h,
                              width: 50.w,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.r),
                                  color: Color(0xff36454f)),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Image.asset(
                                    "assets/menu1.png",
                                    height: 15.h,
                                    width: 15.w,
                                    fit: BoxFit.cover,
                                  ),
                                  Multi(
                                      color: Colors.white,
                                      subtitle: "All",
                                      weight: FontWeight.bold,
                                      size: 10)
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            Shape1(img: "assets/man.png", name: "Men Frames"),
                            SizedBox(
                              width: 10.w,
                            ),
                            Shape1(
                                img: "assets/woman.png",
                                name: "Women Frames"),
                            SizedBox(
                              width: 10.w,
                            ),
                            Shape1(
                                img: "assets/kid.png", name: "Junior Frames"),
                            SizedBox(
                              width: 10.w,
                            ),
                            Shape1(
                                img: "assets/premium.png",
                                name: "Premium Frames"),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      Multi3(
                          color: Color(0xff36454f),
                          subtitle: "Popular Eye Glasses",
                          weight: FontWeight.bold,
                          size: 21),
                      SizedBox(
                        height: 15.h,
                      ),
                      // StaggeredGrid.count(
                      //   crossAxisCount: 4,
                      //   mainAxisSpacing: 10,
                      //   crossAxisSpacing: 10,
                      //   children: [
                      //     StaggeredGridTile.count(
                      //       crossAxisCellCount: 2,
                      //       mainAxisCellCount: 2.2,
                      //       child: Types(
                      //         img: "assets/img5.png",
                      //         glowColor: Colors.pink.withOpacity(0.4),
                      //         catName: "Eye Glasses",
                      //         startingP: "Starting Rs 10000",
                      //         bgColor: Colors.pink.withOpacity(0.4),
                      //         height: 70.h,
                      //         fit: BoxFit.fitHeight,
                      //       ),
                      //     ),
                      //     StaggeredGridTile.count(
                      //         crossAxisCellCount: 2,
                      //         mainAxisCellCount: 2,
                      //         child: Type2(
                      //           img: "assets/lens.png",
                      //           glowColor: null,
                      //           catName: "Contact Lens",
                      //           startingP: "Starting Rs 10000",
                      //           bgColor: Color(0xffC6F0FF),
                      //           height: 70.h,
                      //           fit: BoxFit.fitHeight,
                      //         )),
                      //     StaggeredGridTile.count(
                      //       crossAxisCellCount: 2,
                      //       mainAxisCellCount: 2.2,
                      //       child: Types(
                      //         img: "assets/sunglasses.png",
                      //         glowColor: Colors.brown.withOpacity(0.4),
                      //         catName: "Sun Glasses",
                      //         startingP: "Starting Rs 10000",
                      //         bgColor: Colors.brown.withOpacity(0.4),
                      //         height: 70.h,
                      //         fit: BoxFit.contain,
                      //       ),
                      //     ),
                      //     StaggeredGridTile.count(
                      //         crossAxisCellCount: 2,
                      //         mainAxisCellCount: 2.8,
                      //         child: Type2(
                      //           img: "assets/cleaner.png",
                      //           glowColor: null,
                      //           catName: "Accessories",
                      //           startingP: "Starting Rs 1000",
                      //           bgColor: Color(0xffECF3C6),
                      //           height: 150.h,
                      //           fit: BoxFit.fitHeight,
                      //         )),
                      //     StaggeredGridTile.count(
                      //         crossAxisCellCount: 2,
                      //         mainAxisCellCount: 2.75,
                      //         child: Type2(
                      //           img: "assets/eyedrop.png",
                      //           glowColor: null,
                      //           catName: "Eye Care",
                      //           startingP: "Starting Rs 3000",
                      //           bgColor: Color(0xff36454f).withOpacity(0.2),
                      //           height: 150.h,
                      //           fit: BoxFit.fitHeight,
                      //         )),
                      //     StaggeredGridTile.count(
                      //         crossAxisCellCount: 2,
                      //         mainAxisCellCount: 2,
                      //         child: Type2(
                      //           img: "assets/comp.png",
                      //           glowColor: null,
                      //           catName: "Computer Glasses",
                      //           startingP: "Starting Rs 3000",
                      //           bgColor: Color(0xffC6F0FF),
                      //           height: 72.h,
                      //           fit: BoxFit.fitWidth,
                      //         )),
                      //   ],
                      // ),
                      //  SizedBox(
                      //   height: 15.h,
                      // ),
                      // Multi3(
                      //     color: Color(0xff36454f),
                      //     subtitle: "Popular Eye Glasses",
                      //     weight: FontWeight.bold,
                      //     size: 21),
                      // SizedBox(
                      //   height: 15.h,
                      // ),
                      StaggeredGrid.count(
                        crossAxisCount: 4,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                        children: [
                          StaggeredGridTile.count(
                            crossAxisCellCount: 2,
                            mainAxisCellCount: 2.4,
                            child: Types(
                              img: "assets/menEye.png",
                              glowColor: Colors.pink.withOpacity(0.3),
                              catName: "Men EyeGlasses",
                              startingP: "Starting Rs 10000",
                              bgColor: Colors.pink.withOpacity(0.3),
                              height: 70.h,
                              fit: BoxFit.fitHeight,
                            ),
                          ),
                          StaggeredGridTile.count(
                              crossAxisCellCount: 2,
                              mainAxisCellCount: 2.6,
                              child: Type2(
                                img: "assets/womenEye.png",
                                glowColor: null,
                                catName: "Women EyeGlasses",
                                startingP: "Starting Rs 10000",
                                bgColor: Color(0xffC6F0FF),
                                height: 90.h,
                                fit: BoxFit.contain,
                              )),
                          StaggeredGridTile.count(
                            crossAxisCellCount: 2,
                            mainAxisCellCount: 2.4,
                            child: Types(
                              img: "assets/kidEye.png",
                              glowColor: Colors.brown.withOpacity(0.4),
                              catName: "Junior EyeGlasses",
                              startingP: "Starting Rs 10000",
                              bgColor: Colors.brown.withOpacity(0.4),
                              height: 70.h,
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                          StaggeredGridTile.count(
                              crossAxisCellCount: 2,
                              mainAxisCellCount: 2.2,
                              child: Type2(
                                img: "assets/premium.png",
                                glowColor: null,
                                catName: "Premium Glasses",
                                startingP: "Starting Rs 1000",
                                bgColor: Color(0xffECF3C6),
                                height: 60.h,
                                fit: BoxFit.contain,
                              )),
                         
                        ],
                      ),
                       SizedBox(
                        height: 15.h,
                      ),
                      Multi3(
                          color: Color(0xff36454f),
                          subtitle: "Popular Contact Lenses",
                          weight: FontWeight.bold,
                          size: 21),
                      SizedBox(
                        height: 15.h,
                      ),
                      StaggeredGrid.count(
                        crossAxisCount: 4,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                        children: [
                          StaggeredGridTile.count(
                              crossAxisCellCount: 2,
                              mainAxisCellCount: 2,
                              child: Type2(
                                img: "assets/lens.png",
                                glowColor: null,
                                catName: "Bella Lenses",
                                startingP: "Starting Rs 10000",
                                bgColor: Color(0xffC6F0FF),
                                height: 50.h,
                                fit: BoxFit.contain,
                              )),
                          StaggeredGridTile.count(
                              crossAxisCellCount: 2,
                              mainAxisCellCount: 2.4,
                              child: Type2(
                                img: "assets/lens1.png",
                                glowColor: null,
                                catName: "FreshKon Lenses",
                                startingP: "Starting Rs 10000",
                                bgColor: Color(0xffC6F0FF),
                                height: 70.h,
                                fit: BoxFit.fitHeight,
                              )),
                          StaggeredGridTile.count(
                            crossAxisCellCount: 2,
                            mainAxisCellCount: 2.5,
                            child: Types(
                              img: "assets/lens2.png",
                              glowColor: Colors.brown.withOpacity(0.4),
                              catName: "Optiano Lenses",
                              startingP: "Starting Rs 10000",
                              bgColor: Colors.brown.withOpacity(0.4),
                              height: 70.h,
                              fit: BoxFit.contain,
                            ),
                          ),
                          StaggeredGridTile.count(
                              crossAxisCellCount: 2,
                              mainAxisCellCount: 2.3,
                              child: Type2(
                                img: "assets/clens.png",
                                glowColor: null,
                                catName: "Transparent Lenses",
                                startingP: "Starting Rs 1000",
                                bgColor: Color(0xffECF3C6),
                                height: 70.h,
                                fit: BoxFit.contain,
                              )),
                           StaggeredGridTile.count(
                            crossAxisCellCount: 2,
                            mainAxisCellCount: 2.4,
                            child: Type2(
                              img: "assets/cleaner.png",
                              glowColor: null,
                              catName: "Lens Care",
                              startingP: "Starting Rs 10000",
                              bgColor: Colors.brown.withOpacity(0.4),
                              height: 70.h,
                              fit: BoxFit.contain,
                            ),
                          ),
                          
                         
                        ],
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      Multi3(
                          color: Color(0xff36454f),
                          subtitle: "Sun Glasses",
                          weight: FontWeight.bold,
                          size: 21),
                      SizedBox(
                        height: 15.h,
                      ),
                      StaggeredGrid.count(
                        crossAxisCount: 4,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                        children: [
                          StaggeredGridTile.count(
                              crossAxisCellCount: 2,
                              mainAxisCellCount: 2.5,
                              child: Type2(
                                img: "assets/womanSun.png",
                                glowColor: null,
                                catName: "Women EyeGlasses",
                                startingP: "Starting Rs 10000",
                                bgColor: Color(0xffC6F0FF),
                                height: 80.h,
                                fit: BoxFit.fitHeight,
                              )),
                          StaggeredGridTile.count(
                              crossAxisCellCount: 2,
                              mainAxisCellCount: 2.5,
                              child: Type2(
                                img: "assets/sunglasses.png",
                                glowColor: null,
                                catName: "Men EyeGlasses",
                                startingP: "Starting Rs 10000",
                                bgColor: Color.fromARGB(255, 1, 58, 79).withOpacity(0.1),
                                height: 80.h,
                                fit: BoxFit.contain,
                              )),
                          
                         
                        ],
                      ),

                      SizedBox(height: 10.h,),
                      Row(
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
                          Container(),
                        ],
                      ),
                      SizedBox(height: 10.h,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(),
                          Product1(
                            img: 'assets/womenEye.png',
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          Product1(
                            img: 'assets/menEye.png',
                          ),
                          Container(),
                        ],
                      ),
                      SizedBox(height: 10.h,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(),
                          Product1(
                            img: 'assets/sunglasses.png',
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          Product1(
                            img: 'assets/womanSun.png',
                          ),
                          Container(),
                        ],
                      ),
                      SizedBox(height: 10.h,),
                    
                       SizedBox(height: 10.h,),
                     
                       SizedBox(height: 10.h,),
                   
                      SizedBox(height: 10.h,),
                      Display1(
                        colors: [
                          LinearGradient(colors: [
                            Colors.blue,
                            Color.fromRGBO(14, 198, 240, 0.529)
                          ]),
                          LinearGradient(colors: [
                            Colors.black,
                            Color.fromRGBO(39, 39, 39, 0.533)
                          ]),
                          LinearGradient(colors: [
                            Colors.amber,
                            Color.fromARGB(255, 164, 137, 54)
                          ]),
                        ],
                        imgs: [
                          'assets/img1.png',
                          'assets/img2.png',
                          'assets/img3.png',
                        ],
                        currentIndex: Provider11.currentImg,
                        onIndexChanged: () {},
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Display1(
                        colors: [
                          LinearGradient(colors: [
                            Colors.blue,
                            Color.fromRGBO(14, 198, 240, 0.529)
                          ]),
                          LinearGradient(colors: [
                            Colors.black,
                            Color.fromRGBO(39, 39, 39, 0.533)
                          ]),
                          LinearGradient(colors: [
                            Colors.amber,
                            Color.fromARGB(255, 164, 137, 54)
                          ]),
                        ],
                        imgs: [
                          'assets/img3.png',
                          'assets/img1.png',
                          'assets/img2.png',
                        ],
                        currentIndex: Provider11.currentImg,
                        onIndexChanged: () {},
                      )
                    ],
                  ),
                ),
              ),
              Column(
                children: [
                  Container(
                    width: double.infinity,
                    height: 55.h,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Builder(builder: (context) {
                          return GestureDetector(
                            onTap: () {
                              Scaffold.of(context).openDrawer();
                            },
                            child: AvatarGlow(
                              endRadius: 60.0,
                              // glowColor: Colors.red,
                              child: Material(
                                // Replace this child with your own
                                elevation: 8.0,
                                shadowColor: Colors.grey,
                                shape: CircleBorder(),
                                child: CircleAvatar(
                                  backgroundColor: Colors.grey[100],
                                  child: Image.asset(
                                    'assets/menu.png',
                                    height: 18.h,
                                  ),
                                  radius: 20.r,
                                ),
                              ),
                            ),
                          );
                        }),
                        Multi(
                            color: Colors.black,
                            subtitle: "OptiLook",
                            weight: FontWeight.bold,
                            size: 16),
                        AvatarGlow(
                          endRadius: 60.0,
                          // glowColor: Colors.red,
                          child: Material(
                            // Replace this child with your own
                            shadowColor: Colors.grey,
                            elevation: 8.0,
                            shape: CircleBorder(),
                            child: CircleAvatar(
                              backgroundColor: Colors.grey[100],
                              child: Image.asset(
                                'assets/cart.png',
                                height: 22.h,
                              ),
                              radius: 20.r,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 16,
                          child: Container(
                            height: 40.h,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10.r),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 5,
                                  blurRadius: 7,
                                  offset: Offset(
                                      0, 3), // changes position of shadow
                                ),
                              ],
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(right: 3.w, left: 3.w),
                              child: GestureDetector(
                                onTap: () {
                                  // setState(() {
                                  //   val = true;
                                  // });
                                },
                                child: TextField(
                                  // controller: _searchController,
                                  // onChanged: (value) {
                                  //   setState(() {
                                  //     val = true;
                                  //   }
                                  //   );
                                  // },
                                  decoration: InputDecoration(
                                    prefixIcon: Icon(
                                      Icons.search_outlined,
                                      color: Color(0xffCC0006),
                                      size: 16,
                                      // weight: 200,
                                    ),

                                    border: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    enabledBorder: InputBorder.none,
                                    errorBorder: InputBorder.none,
                                    disabledBorder: InputBorder.none,
                                    hintText: "Search here",
                                    // hintStyle: TextStyle(
                                    //     color: Colors.grey,
                                    //     fontWeight: FontWeight.bold,
                                    //     fontSize: 10),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(flex: 1, child: Container()),
                        Expanded(
                            flex: 2,
                            child: Container(
                              height: 40.h,
                              width: 40.w,
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                // image:DecorationImage(image: AssetImage("assets/filter.png"),fit: BoxFit.cover),
                                color: Color(0xff36454f),
                                borderRadius: BorderRadius.circular(10.r),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 5,
                                    blurRadius: 7,
                                    offset: Offset(
                                        0, 3), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: Center(
                                child: Image.asset(
                                  "assets/filter.png",
                                  height: 20.h,
                                  width: 20.w,
                                ),
                              ),
                            ))
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
