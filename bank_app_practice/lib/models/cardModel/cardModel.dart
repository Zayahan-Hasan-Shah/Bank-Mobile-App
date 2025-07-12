class CardModel {
  final String cardName;
  final String cardType;
  final String amount;
  final String dueDate;
  final int userId;

  CardModel({
    required this.cardName,
    required this.cardType,
    required this.dueDate,
    required this.amount,
    required this.userId,
  });
}