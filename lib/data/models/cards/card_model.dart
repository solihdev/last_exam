class CardModel {
  CardModel(
      {required this.cardId,
      required this.gradient,
      required this.cardNumber,
      required this.moneyAmount,
      required this.owner,
      required this.expireDate,
      required this.iconImage,
      required this.cardName});

  String cardId;
  String cardName;
  List<String> gradient;
  String cardNumber;
  String moneyAmount;
  String owner;
  String expireDate;
  String iconImage;

  factory CardModel.fromJson(Map<String, dynamic> json) => CardModel(
        cardId: json["cardId"],
        cardName: json["cardName"],
        gradient: List<String>.from(json["gradient"].map((x) => x)),
        cardNumber: json["cardNumber"],
        moneyAmount: json["moneyAmount"],
        owner: json["owner"],
        expireDate: json["expireDate"],
        iconImage: json["iconImage"],
      );

  Map<String, dynamic> toJson() => {
        "cardId": cardId,
        "cardName": cardName,
        "gradient": List<dynamic>.from(gradient.map((x) => x)),
        "cardNumber": cardNumber,
        "moneyAmount": moneyAmount,
        "owner": owner,
        "expireDate": expireDate,
        "iconImage": iconImage,
      };

  CardModel copyWith({
    String? cardId,
    String? cardName,
    List<String>? gradient,
    String? cardNumber,
    String? moneyAmount,
    String? owner,
    String? expireDate,
    String? iconImage,
  }) {
    return CardModel(
      cardId: cardId ?? this.cardId,
      cardName: cardName ?? this.cardName,
      gradient: gradient ?? this.gradient,
      cardNumber: cardNumber ?? this.cardNumber,
      moneyAmount: moneyAmount ?? this.moneyAmount,
      owner: owner ?? this.owner,
      expireDate: expireDate ?? this.expireDate,
      iconImage: iconImage ?? this.iconImage,
    );
  }
}
