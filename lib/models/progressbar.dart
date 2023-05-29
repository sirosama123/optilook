import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';
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



class Progress extends StatelessWidget {
  var val;
   Progress({super.key,required this.val});

  @override
  Widget build(BuildContext context) {
    return FAProgressBar(
      
                      currentValue: val,
                      size: 15,
                      maxValue: 100,
                      changeColorValue: 100,
                      changeProgressColor: Colors.pink,
                      backgroundColor: Color.fromARGB(255, 224, 220, 220),
                      progressColor: AppColors.lime,
                      animatedDuration: const Duration(milliseconds: 300),
                      direction: Axis.horizontal,
                      verticalDirection: VerticalDirection.up,
                      formatValueFixed: 2,
                    );
  }
}