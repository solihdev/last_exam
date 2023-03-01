import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:last_exam/ui/tab_box/tabs/home/home_page.dart';
import 'package:last_exam/ui/tab_box/widgets/float_button.dart';
import 'package:last_exam/utils/constants/colors.dart';
import 'package:last_exam/utils/constants/image.dart';

class TabBox extends StatefulWidget {
  const TabBox({Key? key}) : super(key: key);

  @override
  State<TabBox> createState() => _TabBoxState();
}

class _TabBoxState extends State<TabBox> {
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    List pages = const [
      HomePage(),
      Scaffold(),
      Scaffold(),
    ];
    return Scaffold(
      body: pages[currentPage],
      floatingActionButton: const FloatButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.black,
          currentIndex: currentPage,
          type: BottomNavigationBarType.fixed,
          onTap: (value) {
            setState(() {
              currentPage = value;
            });
          },
          items: [
            BottomNavigationBarItem(
              // activeIcon: SvgPicture.asset(AppImages.homeActiveIcon),
              icon: SvgPicture.asset(AppImages.homeIcon,
                  color: currentPage == 0
                      ? AppColors.C_4162FF
                      : AppColors.C_DADFE7),
              label: "",
            ),
            const BottomNavigationBarItem(icon: Icon(null), label: ''),
            BottomNavigationBarItem(
              // activeIcon: SvgPicture.asset(AppImages.homeActiveIcon),
              icon: SvgPicture.asset(AppImages.walletIcon,
                  color: currentPage == 2
                      ? AppColors.C_4162FF
                      : AppColors.C_DADFE7),
              label: "",
            ),
          ]),
    );
  }
}
