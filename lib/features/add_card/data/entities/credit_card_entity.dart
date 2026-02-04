class CreditCardEntity {
  final String cardNumber;
  final String expiryDate;
  final String cardHolderName;
  final String cvvCode;
  final bool isShow;

  CreditCardEntity({
    required this.cardNumber,
    required this.expiryDate,
    required this.cardHolderName,
    required this.cvvCode,
    required this.isShow,
  });

  Map<String, dynamic> toMap() {
    return {
      'cardNumber': cardNumber,
      'expiryDate': expiryDate,
      'cardHolderName': cardHolderName,
      'cvvCode': cvvCode,
      'isShow': isShow,
    };
  }

  factory CreditCardEntity.fromMap(Map<String, dynamic> map) {
    return CreditCardEntity(
      cardNumber: map['cardNumber'],
      expiryDate: map['expiryDate'],
      cardHolderName: map['cardHolderName'],
      cvvCode: map['cvvCode'],
      isShow: map['isShow'],
    );
  }
}
