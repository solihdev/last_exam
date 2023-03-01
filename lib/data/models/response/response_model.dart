import 'package:last_exam/data/models/cards/card_model.dart';

class MyResponse {
  String error;
  List<CardModel>? data;
  MyResponse({this.data, required this.error});
}