import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:last_exam/utils/constants/image.dart';

class FakeCardScreen extends StatelessWidget {
  const FakeCardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 311,
      child: ListView.builder(
        padding: const EdgeInsets.only(left: 16, right: 24).r,
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: 4,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Image.asset(
              AppImages.card,
              width: 311,
              height: 208,
            ),
          );
        },
      ),
    );
  }
}
