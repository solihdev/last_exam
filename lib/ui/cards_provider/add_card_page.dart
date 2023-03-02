import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:last_exam/data/models/cards/card_model.dart';
import 'package:last_exam/state_manager/provider/card_provider.dart';
import 'package:last_exam/state_manager/provider/edit_card_provider.dart';
import 'package:last_exam/ui/cards_provider/cards_page.dart';
import 'package:last_exam/ui/cards_provider/widgets/button.dart';
import 'package:last_exam/ui/cards_provider/widgets/card_widget.dart';
import 'package:last_exam/ui/cards_provider/widgets/drop_down.dart';
import 'package:last_exam/ui/cards_provider/widgets/list_view.dart';
import 'package:last_exam/ui/cards_provider/widgets/text_field.dart';
import 'package:last_exam/utils/assistants/my_toast.dart';
import '../../../utils/constants/constants.dart';

class AddCardPage extends StatefulWidget {
  const AddCardPage({Key? key}) : super(key: key);

  @override
  State<AddCardPage> createState() => _AddCardPageState();
}

class _AddCardPageState extends State<AddCardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Karta qo'shing!"),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CardWidget(isVisibility: false),
            const ColorsView(),
            CustomTextField(
              text: "Karta raqami",
              type: TextInputType.number,
              textInputAction: TextInputAction.next,
              format: MyConstants.cardFormat,
            ),
            const SizedBox(height: 16),
            CustomTextField(
              text: "Amal qilish muddati",
              textInputAction: TextInputAction.next,
              type: TextInputType.datetime,
              format: MyConstants.validityPeriod,
            ),
            const SizedBox(height: 16),
            CustomTextField(
                textInputAction: TextInputAction.next,
                text: "Karta nomi", type: TextInputType.text, format: ""),
            const SizedBox(height: 16),
            CustomTextField(
              textInputAction: TextInputAction.next,
              text: "Karta egasini to'liq ismi va sharfi",
              type: TextInputType.text,
              format: "",
            ),
            const SizedBox(height: 16),
            const CustomDropdown(),
            const SizedBox(height: 16),
            InkWell(
                onTap: () async {
                  if (context.read<EditCardProvider>().validateAllFields()) {
                    context
                        .read<EditCardProvider>()
                        .changeFields(isLoading1: true);
                    await Future.delayed(const Duration(seconds: 2));
                    var card = context.read<EditCardProvider>();
                    await context.read<CardProvider>().addCard(CardModel(
                        gradient: card.gradient,
                        cardId: card.cardId,
                        cardNumber: card.cardNumber,
                        expireDate: card.expireDate,
                        iconImage: card.iconImage,
                        moneyAmount: card.moneyAmount,
                        owner: card.owner,
                        cardName: card.cardName));
                    // ignore: use_build_context_synchronously
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const CardsPage()));
                    context
                        .read<EditCardProvider>()
                        .changeFields(isLoading1: false);
                    context.read<EditCardProvider>().refreshFields();
                    MyToast("Karta muvaffaqiyatli qo'shildi");
                  } else {
                    MyToast("Fill all gaps!");
                  }
                },
                child: CostumButton(
                  text: "Qo'shish",
                )),
          ],
        ),
      ),
    );
  }
}
