import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:last_exam/state_manager/cubit/cards_cubit.dart';
import 'package:last_exam/state_manager/cubit/cards_state.dart';
import 'package:last_exam/ui/tab_box/tabs/home/widgets/appbar.dart';
import 'package:last_exam/ui/tab_box/tabs/home/widgets/card_widget.dart';
import 'package:last_exam/ui/tab_box/tabs/home/widgets/fake_cart.dart';
import 'package:last_exam/utils/constants/colors.dart';
import 'widgets/additon_widget.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key, required this.isVisibility}) : super(key: key);

  bool isVisibility;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            CustomAppbar(),
            CardWidget(),
            AdditionWidget(),
          ],
        ),
      ),
    );
  }
}
