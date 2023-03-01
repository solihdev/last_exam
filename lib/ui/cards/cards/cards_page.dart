import 'package:flutter/material.dart';
import 'package:last_exam/state_manager/provider/card_provider.dart';
import 'package:last_exam/ui/cards/widgets/card_widget.dart';
import 'package:provider/provider.dart';

class CardsPage extends StatelessWidget {
  const CardsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cards Task"),
      ),
      body: Consumer<CardProvider>(
        builder: (context, value, child) {
          if (value.cards.isEmpty) {
            context.read<CardProvider>().listenCards();
            return const Center(
              child: Text("No cards"),
            );
          }
          else {
            return ListView.builder(
              scrollDirection: Axis.vertical,
              physics: const BouncingScrollPhysics(),
              itemCount: value.cards.length,
              itemBuilder: (BuildContext context, int index) {
                return CardWidget(
                  isVisibility: true,
                  cardModel: value.cards[index],
                );
              },
            );
          }
        },
      ),
    );
  }
}
