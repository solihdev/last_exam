import 'package:flutter/material.dart';
import 'package:last_exam/ui/tab_box/tabs/home/widgets/appbar.dart';
import 'package:last_exam/ui/tab_box/widgets/fake_cart.dart';
import 'widgets/additon_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            CustomAppbar(),
            FakeCardScreen(),
            AdditionWidget(),
          ],
        ),
      ),
    );
  }
}
