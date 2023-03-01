import 'package:bloc/bloc.dart';
import 'package:last_exam/data/models/cards/card_model.dart';
import 'package:last_exam/data/repositories/cards_repository.dart';
import 'package:last_exam/state_manager/cubit/cards_state.dart';
import 'package:last_exam/utils/assistants/get_it/get_it.dart';

class CardsCubit extends Cubit<CardsState> {
  CardsCubit() : super(InitialState());

  fetchAllCards() {
    emit(LoadCardsInProgress());
    getIt<CardRepository>().getCard().listen((List<CardModel> cardModel) {
      emit(LoadCardsInSuccess(cardModel: cardModel));
    });
  }
}
