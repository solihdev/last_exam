import 'package:flutter/material.dart';
import 'package:last_exam/data/models/cards/card_model.dart';

// ignore: must_be_immutable
class CardWidget extends StatelessWidget {
  CardModel? cardModel;

  CardWidget({Key? key, this.cardModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
          padding: const EdgeInsets.all(16),
          child: Container(
            width: double.infinity,
            height: 230,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                gradient: LinearGradient(
                    colors: [Color(int.parse(cardModel!.gradient[0])),
                            Color(int.parse(cardModel!.gradient[1])),
                          ],)),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 16),
                  Text(
                   cardModel!.cardNumber,
                    style: const TextStyle(
                      fontSize: 26,
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                             cardModel!.expireDate,
                            style: const TextStyle(
                                fontSize: 16, color: Colors.white),
                          ),
                          const SizedBox(
                            height: 24,
                          ),
                          Text(
                             cardModel!.cardName,
                            style: const TextStyle(
                                fontSize: 20, color: Colors.white),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
  }
}
