import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:last_exam/state_manager/cubit/cards_cubit.dart';
import 'package:last_exam/state_manager/cubit/cards_state.dart';
import 'package:last_exam/ui/tab_box/tabs/home/widgets/fake_cart.dart';
import 'package:last_exam/utils/constants/colors.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CardsCubit, CardsState>(
        builder: (context, state) {
          if (state is LoadCardsInProgress) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is LoadCardsInSuccess) {
            return state.cardModel.isEmpty?const FakeCardScreen():SizedBox(
              height: 240.h,
              child: ListView.builder(
                padding: const EdgeInsets.only(left: 16, right: 24).r,
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                itemCount: state.cardModel.length,
                itemBuilder: (BuildContext context, int index) {
                  var cardModel = state.cardModel[index];
                  return Padding(
                    padding: const EdgeInsets.all(16),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.8,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          gradient: LinearGradient(colors: [
                            Color(int.parse(cardModel.gradient[0])),
                            Color(int.parse(cardModel.gradient[1])),
                          ])),
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text.rich(
                                  TextSpan(children: [
                                    TextSpan(
                                      text: "Name\n",
                                      style: TextStyle(
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.white
                                              .withOpacity(0.5)),
                                    ),
                                    TextSpan(
                                      text: cardModel.owner,
                                      style: TextStyle(
                                          fontSize: 18.sp,
                                          fontWeight: FontWeight.w600,
                                          color: AppColors.white),
                                    ),
                                  ]),
                                ),
                                const Expanded(child: SizedBox()),
                                SizedBox(
                                  width: 50,
                                  height: 50,
                                  child: Image.network(cardModel
                                      .iconImage ==
                                      "UzCard"
                                      ? "https://xs.uz/upload/post/2018/09/17/ad0ec05d27d06bc55f9947547fede0480917.jpg"
                                      : "https://glance.uz/image/cache/catalog/image/catalog/demo-technics/payment/image-removebg-preview%20(5).webp"),
                                ),
                              ],
                            ),
                            Text(
                              state.cardModel[index].cardNumber.length == 19
                                  ? state.cardModel[index].cardNumber
                                  .replaceRange(5, 14, '**** ****')
                                  : state.cardModel[index].cardNumber,
                              style: TextStyle(
                                fontSize: 24.sp,
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(
                              height: 6,
                            ),
                            Text(
                              "Balance",
                              style: TextStyle(
                                fontSize: 20.sp,
                                color: Colors.white.withOpacity(0.5),
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Row(
                              children: [
                                Text(
                                  "\$ 1,200.82",
                                  style: TextStyle(
                                    fontSize: 24.sp,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const Expanded(child: SizedBox()),
                                Text(
                                  cardModel.expireDate,
                                  style: TextStyle(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            );
          } else if (state is LoadCardsInFailure) {
            return Center(
              child: Text(state.errorText),
            );
          }
          return const SizedBox();
        },
    );
  }
}
