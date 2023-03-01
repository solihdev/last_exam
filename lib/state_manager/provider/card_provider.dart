import 'package:flutter/material.dart';
import 'package:last_exam/data/models/cards/card_model.dart';
import 'package:last_exam/data/models/cards/device_id_model.dart';
import 'package:last_exam/data/repositories/cards_repository.dart';
import 'package:last_exam/utils/assistants/get_it/get_it.dart';

class CardProvider extends ChangeNotifier {
  CardProvider() {
    listenCards();
  }

  List<CardModel> cards = [];

  addCard(CardModel cardModel) async {
    await getIt<CardRepository>().addCard(cardModel: cardModel);
  }

  updateCar(CardModel cardModel) async {
    await getIt<CardRepository>().updateCard(cardModel: cardModel);
  }

  deleteCar(String id) async {
    await getIt<CardRepository>().deleteCard(docId: id);
  }

  listenCards() async {
    var result = getIt<CardRepository>().getCard(userId: DeviceId.deviceId);
    result.listen((event) {
      cards = event;
      notifyListeners();
    });
  }
}
