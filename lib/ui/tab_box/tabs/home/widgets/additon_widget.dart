import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:last_exam/utils/constants/colors.dart';
import 'package:last_exam/utils/constants/image.dart';

class AdditionWidget extends StatelessWidget {
  const AdditionWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 42,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 32, right: 32),
          child: Row(children: [
            const Text(
              "Featured",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: AppColors.C_0E1446),
            ),
            const Expanded(child: SizedBox()),
            SvgPicture.asset(AppImages.moreIcon),
          ]),
        ),
        const SizedBox(
          height: 20,
        ),
        Image.asset(AppImages.deeds),
      ],
    );
  }
}
