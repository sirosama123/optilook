import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:optilook/provider/provider1.dart';
import 'package:optilook/screens/card6/template_gallery_app.dart';
import 'package:optilook/screens/logsign/login.dart';
import 'package:optilook/screens/productView1.dart';
import 'package:optilook/screens/landing.dart';
import 'package:optilook/screens/mainLanding.dart';
import 'package:optilook/screens/splashScreen.dart';
import 'package:provider/provider.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  HttpOverrides.global = MyHttpOverrides();
  runApp(const MyApp());
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port) => true;
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return ChangeNotifierProvider(
            create: (context) => Provider1(),
            child: MaterialApp( 
                debugShowCheckedModeBanner: false, home:SplashScreen()),
          );
        });
  }
}




