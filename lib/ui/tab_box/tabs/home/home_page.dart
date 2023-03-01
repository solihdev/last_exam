import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:last_exam/ui/tab_box/tabs/home/widgets/appbar.dart';
import 'package:last_exam/utils/constants/image.dart';
import 'widgets/additon_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomAppbar(),
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  SizedBox(
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
                  ),
                  const AdditionWidget(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
