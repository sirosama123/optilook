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
import '../utils/shape.dart';
import '../utils/slider.dart';
import '../utils/type2.dart';
import '../utils/types.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class Review extends StatelessWidget {
  Review({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Multi(
                  color: AppColors.charcoal,
                  subtitle: "Name of Person",
                  weight: FontWeight.w500,
                  size: 12),
              Multi(
                  color: AppColors.charcoal,
                  subtitle: "11 May, 23",
                  weight: FontWeight.normal,
                  size: 12),
            ],
          ),
          SizedBox(height: 5.h,),
          Container(
            height: 25.h,
            width: 50.w,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                color: AppColors.lime),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MultiNumber(
                    color: Colors.white,
                    subtitle: "4.7",
                    weight: FontWeight.normal,
                    size: 16),
                SizedBox(
                  width: 3.w,
                ),
                Icon(
                  CupertinoIcons.star_fill,
                  color: Colors.white,
                  size: 16,
                )
              ],
            ),
          ),
          SizedBox(height: 5.h,),
          Multi(
                  color: AppColors.charcoal,
                  subtitle: "experience",
                  weight: FontWeight.bold,
                  size: 12),
          SizedBox(height: 2.h,),
          Para(color: AppColors.charcoal, subtitle: "review of a person", weight: FontWeight.normal, size: 10)
        ],
      ),
    );
  }
}
