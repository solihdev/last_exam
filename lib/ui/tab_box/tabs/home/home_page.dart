import 'package:flutter/material.dart';
import 'package:last_exam/ui/tab_box/tabs/home/widgets/appbar.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children:const [
             CustomAppbar(),
          ],
        ),
      ),
    );
  }
}
