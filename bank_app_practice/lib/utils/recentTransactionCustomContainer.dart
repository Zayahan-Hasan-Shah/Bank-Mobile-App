import 'package:bank_app_practice/utils/titleText.dart';
import 'package:flutter/material.dart';

class RecentTransactionCustomContainer extends StatelessWidget {
  final String? cardImage;
  final String? cardType;
  final String? cardName;
  final double? amount;
  final Color borderColor;
  final Color color;
  final String transactionMoney;
  final Color transactionMoneyColor;

  const RecentTransactionCustomContainer({
    this.cardImage,
    this.cardType,
    this.cardName,
    this.amount,
    required this.borderColor,
    required this.color,
    required this.transactionMoney,
    required this.transactionMoneyColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      width: 350,
      height: 80,
      decoration: BoxDecoration(
        border: Border.all(color: borderColor, width: 1.5),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image.asset(cardImage!),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TitleText(
                    title: cardName!,
                    fontSize: 14,
                    weight: FontWeight.w600,
                    color: color,
                  ),
                  TitleText(
                    title: cardType!,
                    fontSize: 14,
                    weight: FontWeight.w600,
                    color: color,
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(width: 10),
          TitleText(
            title: transactionMoney,
            color: transactionMoneyColor,
            fontSize: 16,
            weight: FontWeight.bold,
          )
        ],
      ),
    );
  }
}
