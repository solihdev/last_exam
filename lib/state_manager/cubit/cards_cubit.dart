import 'package:bloc/bloc.dart';
import 'package:last_exam/data/models/response/response_model.dart';
import 'package:last_exam/data/repositories/cards_repository.dart';
import 'package:last_exam/state_manager/cubit/cards_state.dart';
import 'package:last_exam/utils/assistants/get_it/get_it.dart';

import '../../data/models/cards/card_model.dart';

class CardsCubit extends Cubit<CardsState> {
  CardsCubit() : super(InitialState());


  fetchAllCards() {
    emit(LoadCardsInProgress());
    MyResponse myResponse = getIt<CardRepository>().getCard() as MyResponse;
    if (myResponse.error.isEmpty) {
      emit(LoadCardsInSuccess(cardModel: myResponse.data as List<CardModel>));
    } else {
      emit(LoadCardsInFailure(errorText: myResponse.error));
    }
  }
}
