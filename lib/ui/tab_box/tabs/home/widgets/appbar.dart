import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:last_exam/utils/constants/colors.dart';
import 'package:last_exam/utils/constants/image.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12,left: 32,right: 32),
      child: Row(children: [
        Image.asset(
          AppImages.person,
          width: 52.w,
          height: 52.h,
        ),
        SizedBox(width: 16.w,),
        Text.rich(TextSpan(children: [
          TextSpan(
            text: "Good Morning\n",
            style:  TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w500,color: AppColors.C_C4C4C4),
          ),
          TextSpan(
            text: "Arya Wijaya",
            style:  TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600,color: AppColors.C_0E1446),
          ),
        ]),),
        const Expanded(child: SizedBox()),
        SvgPicture.asset(AppImages.notificationIcon),
      ]),
    );
  }
}
