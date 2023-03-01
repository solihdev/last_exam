import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
      body: BlocBuilder<CardsCubit, CardsState>(
        builder: (context, state) {
          if (state is LoadCardsInProgress) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is LoadCardsInSuccess) {
            return ListView(
              children: List.generate(
                state.cardModel.length,
                (index) => ListTile(
                  title: Text(state.cardModel[index].cardName),
                ),
              ),
            );
          } else if (state is LoadCardsInFailure) {
            return Center(
              child: Text(state.errorText),
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
