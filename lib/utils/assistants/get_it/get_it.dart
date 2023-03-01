import 'package:get_it/get_it.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:last_exam/data/repositories/cards_repository.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerLazySingleton(
      () => CardRepository(firebaseFirestore: FirebaseFirestore.instance));
}
