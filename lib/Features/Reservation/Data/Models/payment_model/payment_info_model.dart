class PaymentInfoModel {
  final String cardHolderName;
  final String cardNumber;
  final int expMonth;
  final int expYear;
  final String cvc;

  PaymentInfoModel({
    required this.cardHolderName,
    required this.cardNumber,
    required this.expMonth,
    required this.expYear,
    required this.cvc,
  });
}
