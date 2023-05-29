import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:optilook/screens/landing2.dart';
import 'package:optilook/utils/multi3.dart';



import 'dart:async';
import 'package:flutter/material.dart';

import 'mainLanding.dart';


class SplashScreen extends StatefulWidget {
@override
_SplashScreenState createState() => _SplashScreenState();
}
class _SplashScreenState extends State<SplashScreen> {
@override
void initState() {
	super.initState();
	Timer(Duration(seconds: 10),
		()=>Navigator.pushReplacement(context,
										MaterialPageRoute(builder:
														(context) =>
														Example()
														)
									)
		);
}
@override
Widget build(BuildContext context) {
	return SpashScreen2();
}
}





class SpashScreen2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MovingContainerScreen(),
    );
  }
}

class MovingContainerScreen extends StatefulWidget {
  @override
  _MovingContainerScreenState createState() => _MovingContainerScreenState();
}

class _MovingContainerScreenState extends State<MovingContainerScreen>
    with SingleTickerProviderStateMixin {
late  AnimationController _animationController;
 late Animation<Offset> _animation;

  @override
  void initState() {
    super.initState();

    // Set up the animation controller
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 12),
    );

    // Set up the animation
    _animation = Tween<Offset>(
      begin: Offset(0, -0.2), // Start at the top of the screen
      end: Offset(0, 0.8), // End at the bottom of the screen
    ).animate(_animationController);

    // Start the animation
    _animationController.repeat();
  }

  @override
  void dispose() {
    // Dispose the animation controller when the screen is disposed
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
    
      body: Stack(
        children: [
          
          Container(
            child: AnimatedBuilder(
              animation: _animation,
              builder: (context, child) {
                return SlideTransition(
                  position: _animation,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                        Container(
                        width: 80.h,
                        height: 80.w,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Color(0xff36454F),
                              spreadRadius: 1,
                              blurRadius: 10,
                              offset: Offset(-1, 1)
                            )
                          ],
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(10.r),
                          image: DecorationImage(image: AssetImage("assets/a.jpg"),fit: BoxFit.fitHeight)
                        ),
                      ),
                      SizedBox(height: 5.h,),
                      Container(
                        width: 60.h,
                        height: 60.w,
                        decoration: BoxDecoration(
                           boxShadow: [
                            BoxShadow(
                              color: Color(0xff36454F),
                              spreadRadius: 1,
                              blurRadius: 10,
                              offset: Offset(-1, 1)
                            )
                          ],
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(10.r),
                          image: DecorationImage(image: AssetImage("assets/b.jpg"),fit: BoxFit.cover)
                        ),
                      ),
                      SizedBox(height: 5.h,),
                    Container(
                        width: 80.h,
                        height: 80.w,
                        decoration: BoxDecoration(
                           boxShadow: [
                            BoxShadow(
                              color: Color(0xff36454F),
                              spreadRadius: 1,
                              blurRadius: 10,
                              offset: Offset(-1, 1)
                            )
                          ],
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(10.r),
                          image: DecorationImage(image: AssetImage("assets/c.jpg"),fit: BoxFit.cover)
                        ),
                      ),
                      SizedBox(height: 5.h,),
                        ],
                      ),
                      SizedBox(width: 5.w,),
                      Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         
                        children: [
                          Container(
                        width: 60.h,
                        height: 60.w,
                        decoration: BoxDecoration(
                           boxShadow: [
                            BoxShadow(
                              color: Color(0xff36454F),
                              spreadRadius: 1,
                              blurRadius: 10,
                              offset: Offset(-1, 1)
                            )
                          ],
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(10.r),
                          image: DecorationImage(image: AssetImage("assets/d.jpg"),fit: BoxFit.cover)
                        ),
                      ),
                      SizedBox(height: 5.h,),
                      Container(
                        width: 60.h,
                        height: 60.w,
                        decoration: BoxDecoration(
                           boxShadow: [
                            BoxShadow(
                              color: Color(0xff36454F),
                              spreadRadius: 1,
                              blurRadius: 10,
                              offset: Offset(-1, 1)
                            )
                          ],
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(10.r),
                          image: DecorationImage(image: AssetImage("assets/e.jpg"),fit: BoxFit.cover)
                        ),
                      ),
                      SizedBox(height: 5.h,),
                        Container(
                        width: 60.h,
                        height: 60.w,
                        decoration: BoxDecoration(
                           boxShadow: [
                            BoxShadow(
                              color: Color(0xff36454F),
                              spreadRadius: 1,
                              blurRadius: 10,
                              offset: Offset(-1, 1)
                            )
                          ],
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(10.r),
                          image: DecorationImage(image: AssetImage("assets/f.jpg"),fit: BoxFit.cover)
                        ),
                      ),
                      SizedBox(height: 5.h,),
                        ],
                      ),
                      SizedBox(width: 5.w,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                        Container(
                        width: 80.h,
                        height: 80.w,
                        decoration: BoxDecoration(
                           boxShadow: [
                            BoxShadow(
                              color: Color(0xff36454F),
                              spreadRadius: 1,
                              blurRadius: 10,
                              offset: Offset(-1, 1)
                            )
                          ],
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(10.r),
                          image: DecorationImage(image: AssetImage("assets/g.jpg"),fit: BoxFit.cover)
                        ),
                      ),
                      SizedBox(height: 5.h,),
                       Container(
                        width: 60.h,
                        height: 60.w,
                        decoration: BoxDecoration(
                           boxShadow: [
                            BoxShadow(
                              color: Color(0xff36454F),
                              spreadRadius: 1,
                              blurRadius: 10,
                              offset: Offset(-1, 1)
                            )
                          ],
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(10.r),
                          image: DecorationImage(image: AssetImage("assets/a.jpg"),fit: BoxFit.cover)
                        ),
                      ),
                      SizedBox(height: 5.h,),
                      Container(
                        width: 80.h,
                        height: 80.w,
                        decoration: BoxDecoration(
                           boxShadow: [
                            BoxShadow(
                              color: Color(0xff36454F),
                              spreadRadius: 1,
                              blurRadius: 10,
                              offset: Offset(-1, 1)
                            )
                          ],
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(10.r),
                          image: DecorationImage(image: AssetImage("assets/c.jpg"),fit: BoxFit.cover)
                        ),
                      ),
                      SizedBox(height: 5.h,),
                      
                        ],
                      ),
                      SizedBox(width: 5.w,),
                      Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         
                        children: [
                          Container(
                        width: 60.h,
                        height: 60.w,
                        decoration: BoxDecoration(
                           boxShadow: [
                            BoxShadow(
                              color: Color(0xff36454F),
                              spreadRadius: 1,
                              blurRadius: 10,
                              offset: Offset(-1, 1)
                            )
                          ],
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(10.r),
                          image: DecorationImage(image: AssetImage("assets/d.jpg"),fit: BoxFit.cover)
                        ),
                      ),
                      SizedBox(height: 5.h,),
                      Container(
                        width: 60.h,
                        height: 60.w,
                        decoration: BoxDecoration(
                           boxShadow: [
                            BoxShadow(
                              color: Color(0xff36454F),
                              spreadRadius: 1,
                              blurRadius: 10,
                              offset: Offset(-1, 1)
                            )
                          ],
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(10.r),
                          image: DecorationImage(image: AssetImage("assets/e.jpg"),fit: BoxFit.cover)
                        ),
                      ),
                      SizedBox(height: 5.h,),
                        Container(
                        width: 60.h,
                        height: 60.w,
                        decoration: BoxDecoration(
                           boxShadow: [
                            BoxShadow(
                              color: Color(0xff36454F),
                              spreadRadius: 1,
                              blurRadius: 10,
                              offset: Offset(-1, 1)
                            )
                          ],
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(10.r),
                          image: DecorationImage(image: AssetImage("assets/f.jpg"),fit: BoxFit.cover)
                        ),
                      ),
                      SizedBox(height: 5.h,),
                        ],
                      ),
                      SizedBox(width: 5.w,),
                    ],
                  )
                );
              },
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              height: 350.h,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Colors.amber,
                    Colors.amber,
                  ],
                  
                  )
              ),
              child: 
                  Column(
                    children: [
                      Image.asset("assets/logo.png",height: 250.h,width: 250.w,),
                      Container(
              height: 30.h,
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Multi3(color: Colors.black, subtitle: "Powered By ", weight: FontWeight.bold, size: 20),
                  Image.asset("assets/zelle.png",height: 30.h,width: 30.w,)
                ],
              ),
            ),
                    ],
                  ),
                  
            ),
          ),
         
        ],
      ),
    );
  }
}
