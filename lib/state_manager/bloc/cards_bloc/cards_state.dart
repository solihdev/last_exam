part of 'cards_bloc.dart';

class SingleCardsState extends Equatable {
  final CardModel cardModel;
  Status? status;

  SingleCardsState({
    this.status,
    required this.cardModel,
  });

  SingleCardsState copyWith({CardModel? cardModel, Status? status}) =>
      SingleCardsState(
        status: status ?? this.status,
        cardModel: cardModel ?? this.cardModel,
      );

  @override
  List<Object?> get props => [cardModel];
}

enum Status {
  pure,
  loading,
  cardAdded,
  cardDeleted,
  cardUpdated,
}
