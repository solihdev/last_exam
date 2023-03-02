import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:last_exam/data/models/cards/card_model.dart';
import 'package:last_exam/data/repositories/cards_repository.dart';
import 'package:last_exam/utils/assistants/get_it/get_it.dart';

part 'cards_event.dart';

part 'cards_state.dart';

class SingleCardsBloc extends Bloc<SingleCardsEvent, SingleCardsState> {
  SingleCardsBloc()
      : super(
          SingleCardsState(
            cardModel: CardModel(
                cardId: "",
                cardName: "",
                cardNumber: "",
                expireDate: "",
                gradient: [],
                iconImage: "",
                moneyAmount: "",
                owner: ""),
          ),
        ) {
    on<AddCardEvent>(_addCardScreen);
    on<UpdateCardEvent>(_updateCardScreen);
    on<DeleteCardEvent>(_deleteCardScreen);
  }

  _addCardScreen(AddCardEvent event, Emitter<SingleCardsState> emit) {
    emit(state.copyWith(status: Status.loading));
    getIt<CardRepository>().addCard(cardModel: event.cardModel);
    emit(state.copyWith(status: Status.cardAdded));
  }

  _updateCardScreen(UpdateCardEvent event, Emitter<SingleCardsState> emit) {
    emit(state.copyWith(status: Status.loading));
    CardModel cardModel = state.cardModel.copyWith(
      cardName: event.cardName,
      owner: event.owner,
    );
    emit(state.copyWith(cardModel: cardModel, status: Status.cardUpdated));
  }

  _deleteCardScreen(DeleteCardEvent event, Emitter<SingleCardsState> emit) {
    getIt<CardRepository>().deleteCard(docId: event.id);
    emit(state.copyWith(status: Status.cardDeleted));
  }
}
