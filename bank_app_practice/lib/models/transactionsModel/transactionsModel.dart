class TransactionModel {
  final int senderId; // userId,
  final int recieverId; // userId,
  final String amount;
  final String accountNumber;
  final int cardId; // sender's card
  final String transactionType;
  final String transactionTime;

  TransactionModel({
    required this.accountNumber,
    required this.amount,
    required this.cardId,
    required this.recieverId,
    required this.senderId,
    required this.transactionType,
    required this.transactionTime,
  });
}
