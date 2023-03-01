import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:last_exam/state_manager/bloc/cards_bloc/cards_bloc.dart';
import 'package:last_exam/state_manager/cubit/cards_cubit.dart';
import 'package:last_exam/state_manager/cubit/cards_state.dart';

class AllCardsPage extends StatelessWidget {
  const AllCardsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Alll Cards Page'),
        actions: [
          IconButton(
              onPressed: () {
                BlocProvider.of<CardsCubit>(context).fetchAllCards();
              },
              icon: const Icon(Icons.download))
        ],
      ),
      body: BlocBuilder<SingleCardsBloc, SingleCardsState>(
        builder: (context, state) {
          if (state.status == Status.SUCCESS) {
            return ListView.builder(
              itemCount: state.cards!.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Color(hexColor(state.cards![index].colors.colorA)),
                            Color(hexColor(state.cards![index].colors.colorB)),
                          ])),
                  height: 160,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          state.cards![index].bankName,
                          style: const TextStyle(
                              fontSize: 30, color: Colors.white),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 18, top: 15),
                        child: Text(
                          hexCardNumber(
                            state.cards![index].cardNumber,
                          ),
                          style: const TextStyle(
                              fontSize: 14,
                              color: Colors.white,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          }
          if (state.status == Status.LOADING) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state.status == Status.ERROR) {
            return Center(
              child: Text(state.error.toString()),
            );
          }
          return const SizedBox();
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.download_for_offline_outlined),
        onPressed: () {
          context.read<SingleStateBloc>().add(SingleCardEvent());
        },
      ),
    );
  }
}
