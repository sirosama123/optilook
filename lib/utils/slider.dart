import 'package:flutter/material.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../screens/photoViewer.dart';




class MyApp2 extends StatefulWidget {
  List imgAddress;

  MyApp2({ Key? key, required this.imgAddress}) : super(key: key);

  @override
  _MyApp2State createState() => _MyApp2State();
}

class _MyApp2State extends State<MyApp2> {
  // final List<Color> colors = [
  //   Colors.red,
  //   Colors.orange,
  //   Colors.yellow,
  //   Colors.green,
  //   Colors.blue,
  //   Colors.indigo,
  //   Colors.purple,
  // ];
  // final List<String> imgAddress = [
  //   "https://i0.wp.com/optilookpk.com/wp-content/uploads/2023/04/Attachment-Square-1.jpg?fit=1080%2C1080&ssl=1",
  //   "https://i0.wp.com/optilookpk.com/wp-content/uploads/2023/04/Attachment-Square-2.jpg?fit=1080%2C1080&ssl=1",
  //   "https://i0.wp.com/optilookpk.com/wp-content/uploads/2023/04/Attachment-Square-3.jpg?fit=1080%2C1080&ssl=1",
  //   "https://i0.wp.com/optilookpk.com/wp-content/uploads/2023/03/OL-2.jpg?fit=300%2C149&ssl=1",
  //   "https://i0.wp.com/optilookpk.com/wp-content/uploads/2023/03/OL-1.jpg?fit=300%2C200&ssl=1",
  // ];

  bool _isPlaying = true;

  late CarouselSliderController _sliderController;

  @override
  void initState() {
    super.initState();
    _sliderController = CarouselSliderController();
  }

  @override
  Widget build(BuildContext context) {
    return  ListView(
      shrinkWrap: true,
        children: <Widget>[
          Container(
            height: 250.h,
            child: CarouselSlider.builder(
              
              unlimitedMode: true,
              controller: _sliderController,
              slideBuilder: (index) {
                return GestureDetector(
                  onTap: (){
                    Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PhotoViewer(list1: widget.imgAddress)),);
                    print( widget.imgAddress[index]);
                  },
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      image: DecorationImage(image: NetworkImage(widget.imgAddress[index]),fit: BoxFit.cover)
                    ),
                    
                  ),
                );
              },
              slideTransform: CubeTransform(),
              slideIndicator: CircularSlideIndicator(
                padding: EdgeInsets.only(bottom: 10),
                indicatorBorderColor: Colors.black,
              ),
              itemCount: widget.imgAddress.length,
              initialPage: 0,
              enableAutoSlider: false,
              
            ),
          ),
          // Padding(
          //   padding: const EdgeInsets.symmetric(vertical: 10),
          //   child: Align(
          //     child: ConstrainedBox(
          //       constraints: BoxConstraints(minWidth: 240, maxWidth: 600),
          //       child: Row(
          //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //         children: [
          //           IconButton(
          //             iconSize: 48,
          //             icon: Icon(Icons.skip_previous),
          //             onPressed: () {
          //               _sliderController.previousPage();
          //             },
          //           ),
          //           IconButton(
          //             iconSize: 64,
          //             icon: Icon(
          //               _isPlaying ? Icons.pause_circle_outline : Icons.play_circle_outline,
          //             ),
          //             onPressed: () {
          //               setState(
          //                 () {
          //                   _isPlaying = !_isPlaying;
          //                   _sliderController.setAutoSliderEnabled(_isPlaying);
          //                 },
          //               );
          //             },
          //           ),
          //           IconButton(
          //             iconSize: 48,
          //             icon: Icon(Icons.skip_next),
          //             onPressed: () {
          //               _sliderController.nextPage();
          //             },
          //           ),
          //         ],
          //       ),
          //     ),
          //   ),
          // ),
        ],
  
    );
  }
}