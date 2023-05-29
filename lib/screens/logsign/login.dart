import 'dart:ui';

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
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  @override
  bool abc = false;
  Widget build(BuildContext context) {
    return Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/bg2.jpg"), fit: BoxFit.cover)),
        child: Container(
            height: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.3),
            ),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(25.0),
                child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 5.0),
                    child: Container(
                      decoration: BoxDecoration(

                          // color: Colors.transparent.withOpacity(0.2),
                          ),
                      child: Stack(
                        children: [
                          Column(
                            children: [
                              Container(
                                height: 70.h,
                                width: 120.w,
                                decoration: BoxDecoration(
                                  image: DecorationImage(image: AssetImage("assets/logo.png"),fit: BoxFit.contain)
                                ),
                              ),
                            abc==false?  LogIn1():LogIn2()
                            ],
                          ),
                          Positioned(
                            top: 50.h,
                            right: 40.w,
                            child:GestureDetector(
                              onTap: (){
                                setState(() {
                                  if (abc==true) {
                                    abc=false;
                                  } else {
                                    abc=true;
                                    
                                  }
                                });
                              },
                              child: Container(
                                height: 50.h,
                                width: 50.w,
                                color: Colors.amber,
                              ),
                            ) ,
                          )
                        ],
                      ),
                    )))));
  }
}







class LogIn1 extends StatelessWidget {
  const LogIn1({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.all(50),
      child: Container(
        height: 300.h,
        width: 300.w,
        color: Colors.blue,
           ),
    );
  }
}













class LogIn2 extends StatelessWidget {
  const LogIn2({super.key});

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
                        child: Container(
       height: 300.h,
       width: 300.w,
       color: Colors.black,
       ),
                        duration: Duration(milliseconds: 3000),
                        curve: Curves.bounceOut,
                        tween: Tween(begin: 3.0, end: 0.0),
                        builder: (context, value, child){
                          return Transform.
                          translate(
                            offset:  Offset(
                               0,
                              value * 120
                            ),
                            child: child,
                          );
                        },
                      );
    
    
  }
}





class MyApp3 extends StatelessWidget {
  const MyApp3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      // Hide the debug banner
      debugShowCheckedModeBanner: false,
      title: 'Kindacode.com',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double _targetSize = 300;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        color: Colors.purple[900],
        child: TweenAnimationBuilder(
          tween: Tween<double>(
            begin: 50,
            end: _targetSize,
          ),
          duration: const Duration(seconds: 2),
          
          onEnd: () {
            
          },
          curve: Curves.linear,
          builder: (BuildContext _, double size, Widget? __) {
            return GestureDetector(
              onTap: (){
                setState(() {
              if (_targetSize == 50) {
                _targetSize = 300;
              } else {
                _targetSize = 50;
              }
            });
              },
              child: Container(
                width: size,
                height: size,
                decoration: const BoxDecoration(
                    gradient: RadialGradient(
                        center: Alignment.center,
                        colors: [Colors.yellow, Colors.red]),
                    ),
              ),
            );
          },
        ),
      ),
    );
  }
}




