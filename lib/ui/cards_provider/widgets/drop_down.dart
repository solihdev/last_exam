import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:last_exam/state_manager/provider/edit_card_provider.dart';

class CustomDropdown extends StatefulWidget {
  const CustomDropdown({Key? key}) : super(key: key);

  @override
  State<CustomDropdown> createState() => _CustomDropdownState();
}

List<String> dropdownValue = ['UzCard','Humo'];
String value=dropdownValue[0];

class _CustomDropdownState extends State<CustomDropdown> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30),
      child: Container(
        height: 50,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            border: Border.all(color: Colors.black)),
        child: Padding(
          padding: const EdgeInsets.only(left: 20,right: 10),
          child: DropdownButton<String>(
            iconSize: 24,
            isExpanded: true,
            underline: Container(),
            elevation: 0,
            style: const TextStyle(color: Colors.deepPurple, fontSize: 20.0,),
            items: dropdownValue.map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(
                  value.toString(),
                  style: const TextStyle(color: Colors.black),
                ),
              );
            }).toList(),
            value: value,
            onChanged: (newValue) {
              setState(() {
                value=newValue!;
                context.read<EditCardProvider>().iconImage = newValue;
              });
            },
          ),
        ),
      ),
    );
  }
}
