part of 'cards_bloc.dart';

abstract class SingleCardsEvent {}

class UpdateCardEvent extends SingleCardsEvent {
  final String cardName;
  final String owner;

  UpdateCardEvent({
    required this.cardName,
    required this.owner,
  });
}

class AddCardEvent extends SingleCardsEvent {}

class DeleteCardEvent extends SingleCardsEvent {
  final String id;

  DeleteCardEvent({
    required this.id,
  });
}
