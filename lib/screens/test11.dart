import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:optilook/utils/multi3.dart';
 
class RibbonShape extends StatelessWidget {
  String? tag;
  Color? bg;
  Color? bg2;
  RibbonShape({super.key,required this.tag,required this.bg,required this.bg2});

  @override
  Widget build(BuildContext context) {
     return 
      Stack(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(bottom: 10.0),
            child: ClipPath(
              clipper: ArcClipper(),
              child: Container(
                  width: 80.w,
                  height: 20.h,
                  padding: EdgeInsets.only(bottom:2),
                  color: bg,
                  child: Center(
                      child: Multi3(color: Colors.white, subtitle: "$tag", weight: FontWeight.bold, size: 12))),
            ),
          ),
          Positioned(
            bottom: 0.0,
            child: ClipPath(
              clipper: TriangleClipper(),
              child: Container(
                width: 10.w,
                height: 10.h,
                color: bg2,
              ),
            ),
          )
        ],
      
    );
  }
}
 
class ArcClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(15.0, 0.0);
 
    var firstControlPoint = Offset(7.5, 2.0);
    var firstPoint = Offset(5.0, 5.0);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstPoint.dx, firstPoint.dy);
 
    var secondControlPoint = Offset(2.0, 7.5);
    var secondPoint = Offset(0.0, 15.0);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondPoint.dx, secondPoint.dy);
 
    path.lineTo(0.0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width - 20, size.height / 2);
    path.lineTo(size.width, 0.0);
    path.close();
 
    return path;
  }
 
  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
 
class TriangleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, 0.0);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0.0);
    path.close();
 
    return path;
  }
 
  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}