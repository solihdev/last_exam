import 'package:last_exam/data/models/cards/card_model.dart';

abstract class CardsState {}

class InitialState extends CardsState {}

class LoadCardsInProgress extends CardsState {}

class LoadCardsInSuccess extends CardsState {
  LoadCardsInSuccess({required this.cardModel});

  final List<CardModel> cardModel;
}

class LoadCardsInFailure extends CardsState {
  String errorText;

  LoadCardsInFailure({required this.errorText});
}
