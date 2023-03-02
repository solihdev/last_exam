import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:last_exam/data/models/cards/card_model.dart';
import 'package:last_exam/state_manager/provider/card_provider.dart';
import 'package:last_exam/state_manager/provider/edit_card_provider.dart';
import 'package:last_exam/ui/cards_provider/update_card/update_card_page.dart';
import 'package:last_exam/utils/router/app_router.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class CardWidget extends StatelessWidget {
  CardModel? cardModel;

  CardWidget({Key? key, required this.isVisibility, this.cardModel})
      : super(key: key);

  bool isVisibility;

  @override
  Widget build(BuildContext context) {
    // print(cardModel!.gradient[1]);
    return Consumer<EditCardProvider>(
      builder: (context, value, child) {
        return Padding(
          padding: const EdgeInsets.all(16),
          child: Container(
            width: double.infinity,
            height: 280.h,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                gradient: LinearGradient(
                    colors: isVisibility
                        ? [
                            Color(int.parse(cardModel!.gradient[0])),
                            Color(int.parse(cardModel!.gradient[1])),
                          ]
                        : [
                            Color(int.parse(value.gradient[0])),
                            Color(int.parse(value.gradient[1])),
                          ])),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Shaxsiy",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    isVisibility ? cardModel!.cardNumber : value.cardNumber,
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
                            isVisibility
                                ? cardModel!.expireDate
                                : value.expireDate,
                            style: const TextStyle(
                                fontSize: 16, color: Colors.white),
                          ),
                          const SizedBox(
                            height: 24,
                          ),
                          Text(
                            isVisibility ? cardModel!.cardName : value.cardName,
                            style: const TextStyle(
                                fontSize: 20, color: Colors.white),
                          ),
                        ],
                      ),
                      Consumer<EditCardProvider>(
                          builder: (context, value, child) => SizedBox(
                                width: 50,
                                height: 50,
                                child: Image.network(isVisibility
                                    ? cardModel!.iconImage == "UzCard"
                                        ? "https://xs.uz/upload/post/2018/09/17/ad0ec05d27d06bc55f9947547fede0480917.jpg"
                                        : "https://glance.uz/image/cache/catalog/image/catalog/demo-technics/payment/image-removebg-preview%20(5).webp"
                                    : value.iconImage == "UzCard"
                                        ? "https://xs.uz/upload/post/2018/09/17/ad0ec05d27d06bc55f9947547fede0480917.jpg"
                                        : "https://glance.uz/image/cache/catalog/image/catalog/demo-technics/payment/image-removebg-preview%20(5).webp"),
                              ))
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        isVisibility ? cardModel!.owner : value.owner,
                        style:
                            const TextStyle(fontSize: 20, color: Colors.white),
                      ),
                      // const SizedBox(width: 20),
                      Visibility(
                          visible: isVisibility,
                          child: IconButton(
                            onPressed: () {
                              context.read<EditCardProvider>().changeFields(
                                    owner1: cardModel!.owner,
                                    expireDate1: cardModel!.expireDate,
                                    cardId1: cardModel!.cardId,
                                    cardName1: cardModel!.cardName,
                                    cardNumber1: cardModel!.cardNumber,
                                    gradient1: cardModel!.gradient,
                                    iconImage1: cardModel!.iconImage,
                                    moneyAmount1: cardModel!.moneyAmount,
                                  );
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context)=>UpdateCardPage(cardModel: cardModel!),),                              );
                            },
                            icon: const Icon(
                              Icons.edit,
                              color: Colors.white,
                            ),
                          )),
                      const Expanded(child: SizedBox()),
                      Visibility(
                          visible: isVisibility,
                          child: IconButton(
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                    title: Text("Kartani o'chirish"),
                                    actions: [
                                      TextButton(
                                          onPressed: () {
                                            context
                                                .read<CardProvider>()
                                                .deleteCar(cardModel!.cardId);
                                            Navigator.pushNamedAndRemoveUntil(
                                              context,
                                              RouteName.main,
                                              (route) => false,
                                            );
                                          },
                                          child: Text("Ha")),
                                      TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: Text("Yo'q")),
                                    ],
                                  ),
                                );
                              },
                              icon: const Icon(
                                Icons.delete,
                                color: Colors.white,
                              ))),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
