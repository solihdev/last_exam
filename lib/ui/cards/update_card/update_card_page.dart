import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:last_exam/data/models/cards/card_model.dart';
import 'package:last_exam/state_manager/provider/card_provider.dart';
import 'package:last_exam/state_manager/provider/edit_card_provider.dart';
import 'package:last_exam/ui/cards/widgets/button.dart';
import 'package:last_exam/ui/cards/widgets/list_view.dart';
import 'package:last_exam/utils/assistants/my_toast.dart';
import 'package:last_exam/utils/router/app_router.dart';

import '../widgets/card_widget.dart';
import '../widgets/text_field.dart';

class UpdateCardPage extends StatelessWidget {
  CardModel cardModel;

  UpdateCardPage({required this.cardModel, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Kartani tahrirlang!"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CardWidget(isVisibility: false),
            ColorsView(),
            CustomTextField(
              text: "Karta nomi",
              type: TextInputType.text,
              format: "",
            ),
            const SizedBox(height: 16),
            CustomTextField(
              text: "Karta egasini to'liq ismi va sharfi",
              type: TextInputType.text,
              format: "",
            ),
            const SizedBox(
              height: 100,
            ),
            InkWell(
              onTap: () async {
                if (context.read<EditCardProvider>().validateAllFields()) {
                  context
                      .read<EditCardProvider>()
                      .changeFields(isLoading1: true);
                  await Future.delayed(Duration(seconds: 2));
                  var card = context.read<EditCardProvider>();
                  await context.read<CardProvider>().updateCar(CardModel(
                      gradient: card.gradient,
                      cardId: card.cardId,
                      cardNumber: card.cardNumber,
                      expireDate: card.expireDate,
                      iconImage: card.iconImage,
                      moneyAmount: card.moneyAmount,
                      owner: card.owner,
                      cardName: card.cardName));
                  // ignore: use_build_context_synchronously
                  Navigator.pushReplacementNamed(context, RouteName.main);
                  context
                      .read<EditCardProvider>()
                      .changeFields(isLoading1: false);
                  context.read<EditCardProvider>().refreshFields();
                  MyToast("Your card updated succesfully!");
                } else {
                  MyToast("Fill all gaps!");
                }
              },
              child: CostumButton(
                text: "Yangilash",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
