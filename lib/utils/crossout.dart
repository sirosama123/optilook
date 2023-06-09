import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';


class CrossOut extends StatelessWidget {
  Color color;
  String subtitle;
  FontWeight weight;
  double size;
  CrossOut({super.key,required this.color,required this.subtitle,required this.weight,required this.size});


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
  subtitle,
  style: GoogleFonts.karla(
    textStyle: TextStyle(color: color, letterSpacing: 0.2,fontSize: size.sp,fontWeight: weight,decoration: TextDecoration.lineThrough,decorationColor: Color(0xff36454f),decorationStyle:TextDecorationStyle.solid,decorationThickness: 2 ),
  ),
  textAlign: TextAlign.center,
  
),

    );
  }
}