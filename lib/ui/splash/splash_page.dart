import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:last_exam/utils/constants/colors.dart';
import 'package:last_exam/utils/constants/image.dart';
import 'dart:async';
import 'package:last_exam/utils/router/app_router.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3)).then(
      (value) => Navigator.pushNamedAndRemoveUntil(
        context,
        RouteName.main,
        (route) => false,
      ),
    );
    return Scaffold(
      backgroundColor: AppColors.C_2E4EE7,
      body: Center(
        child: Image.asset(
          AppImages.splash,
          width: 120.w,
          height: 120.h,
        ),
      ),
    );
  }
}
