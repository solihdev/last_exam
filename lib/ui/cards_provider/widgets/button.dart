import 'package:flutter/material.dart';
import 'package:last_exam/state_manager/provider/edit_card_provider.dart';
import 'package:provider/provider.dart';

class CostumButton extends StatelessWidget {
  CostumButton({Key? key, required this.text}) : super(key: key);

  String text;

  @override
  Widget build(BuildContext context) {
    return Consumer<EditCardProvider>(
      builder: (context, value, child) {
        return Padding(
          padding: const EdgeInsets.only(left: 30, right: 30),
          child: Container(
            height: 60,
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Center(
              child: value.isLoading
                  ? const CircularProgressIndicator(
                      color: Colors.white,
                    )
                  : Text(
                      text,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w600),
                    ),
            ),
          ),
        );
      },
    );
  }
}
