import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:last_exam/data/models/cart_model/color_model.dart';

import '../../../../state_manager/provider/edit_card_provider.dart';

class ColorsView extends StatefulWidget {
  const ColorsView({Key? key}) : super(key: key);

  @override
  State<ColorsView> createState() => _ColorsViewState();
}

int selectGradient = 0;

class _ColorsViewState extends State<ColorsView> {
  @override
  Widget build(BuildContext context) {
    List<ColorModel> list = [
      ColorModel(
        colors: ["0xFFF44336", "0xFF2196F3"],
        isSelected: true,
      ),
      ColorModel(colors: ["0xFF2196F3", "0xFFFFEB3B"], isSelected: false),
      ColorModel(colors: ["0xFF64FFDA", "0xFF795548"], isSelected: false),
      ColorModel(colors: ["0xFF69F0AE", "0xFFFF9800"], isSelected: true),
      ColorModel(colors: ["0xFF18FFFF", "0xFF9E9E9E"], isSelected: false),
      ColorModel   (colors: ["0xFFF44336", "0xFFFFFFFF"], isSelected: false),
    ];
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16),
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.12,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          itemCount: list.length,
          itemBuilder: (BuildContext context, int index) {
            return Column(
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectGradient = index;
                      context.read<EditCardProvider>().changeFields(gradient1: list[index].colors);
                    });
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 6),
                    height: 54,
                    width: 54,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(colors: [
                          Color(int.parse(list[index].colors[0])),
                          Color(int.parse(list[index].colors[1])),
                        ]),
                        shape: BoxShape.circle,
                        color: Colors.teal),
                    child: selectGradient == index
                        ? const Center(
                            child: Icon(
                              Icons.done,
                              color: Colors.white,
                              size: 30,
                            ),
                          )
                        : const SizedBox(),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
