import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/cards/card_model.dart';

class CardRepository {
  final FirebaseFirestore _firestore;

  CardRepository({required FirebaseFirestore firebaseFirestore})
      : _firestore = firebaseFirestore;

  Future<void> addCard({required CardModel cardModel}) async {
    try {
      DocumentReference newCard =
          await _firestore.collection("cards").add(cardModel.toJson());
      await _firestore.collection("cards").doc(newCard.id).update({
        "cardId": newCard.id,
      });
    } on FirebaseException catch (er) {
      // MyUtils.getMyToast(message: er.message.toString());
    }
  }

  Future<void> deleteCard({required String docId}) async {
    try {
      await _firestore.collection("cards").doc(docId).delete();

      // MyUtils.getMyToast(message: "Mahsulot muvaffaqiyatli o'chirildi!");
    } on FirebaseException catch (er) {
      // MyUtils.getMyToast(message: er.message.toString());
    }
  }

  Future<void> updateCard({required CardModel cardModel}) async {
    try {
      await _firestore
          .collection("cards")
          .doc(cardModel.cardId)
          .update(cardModel.toJson());

      // MyUtils.getMyToast(message: "Mahsulot muvaffaqiyatli yangilandi!");
    } on FirebaseException catch (er) {
      // MyUtils.getMyToast(message: er.message.toString());
    }
  }

  Stream<List<CardModel>> getCard() async* {
    yield* _firestore.collection("cards").snapshots().map(
          (querySnapshot) => querySnapshot.docs
              .map((doc) => CardModel.fromJson(doc.data()))
              .toList(),
        );
  }
}
