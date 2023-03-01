import 'package:flutter/foundation.dart';

class EditCardProvider extends ChangeNotifier{
  String cardId = "";
  List<String> gradient = ["0xFF2196F3", "0xFFFFEB3B"];
  String cardNumber = "";
  String moneyAmount = "";
  String owner = "";
  String expireDate = "";
  String iconImage = "UzCard";
  String userId = "";
  String cardName="";
  bool isLoading=false;

  refreshFields(){
    cardId = "";
    isLoading=false;
    gradient = ["0xFF2196F3", "0xFFFFEB3B"];
    cardNumber = "";
    expireDate = "";
    iconImage = "UzCard";
    moneyAmount = "";
    cardName="";
    owner ="";
    notifyListeners();
  }

  changeFields({
    String? cardId1,
    List<String>? gradient1,
    String? cardNumber1,
    String? moneyAmount1,
    String? owner1,
    String? expireDate1,
    String? iconImage1,
    String? userId1,
    String? cardName1,
    bool? isLoading1
}){
    cardId = cardId1??cardId;
    isLoading=isLoading1??isLoading;
    gradient = gradient1??gradient;
    cardNumber = cardNumber1??cardNumber;
    expireDate = expireDate1??expireDate;
    iconImage = iconImage1??iconImage;
    moneyAmount = moneyAmount1??moneyAmount;
    cardName=cardName1??cardName;
    owner = owner1??owner;
    notifyListeners();
  }

  validateAllFields(){
    print(cardName);
    print(owner);
    print(expireDate);
    print(cardNumber);
        if(cardNumber.length>16 && owner.isNotEmpty && expireDate.length>3 && cardName.isNotEmpty){
          return true;
        }
        return false;

  }
}