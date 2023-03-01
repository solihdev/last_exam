import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:last_exam/utils/constants/colors.dart';

class FloatButton extends StatelessWidget {
  const FloatButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Positioned(
        bottom: 34.h,
        left: 155.9.w,
        child: Container(
          width: 90.w,
          height: 45.5.h,
          decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.elliptical(76, 80),
                  bottomRight: Radius.elliptical(76, 80))
                  .r),
        ),
      ),
      Positioned(
        bottom: 40.h,
        left: 165.w,
        child: InkWell(
          onTap: () {},
          child: Container(
              height: 72.h,
              width: 72.w,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.C_40BCFC,
              ),
              child: Center(
                child: Text(
                  "+",
                  style: TextStyle(
                      fontSize: 32.sp,
                      fontWeight: FontWeight.w400,
                      color: Colors.white),
                ),
              )),
        ),
      ),
    ]);
  }
}
