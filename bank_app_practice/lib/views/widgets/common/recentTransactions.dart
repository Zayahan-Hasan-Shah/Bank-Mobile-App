import 'package:bank_app_practice/core/colors.dart';
import 'package:bank_app_practice/core/constants.dart';
import 'package:bank_app_practice/core/images.dart';
import 'package:bank_app_practice/utils/recentTransactionCustomContainer.dart';
import 'package:flutter/material.dart';

class RecentTransactions extends StatefulWidget {
  const RecentTransactions({super.key});

  @override
  State<RecentTransactions> createState() => _RecentTransactionsState();
}

class _RecentTransactionsState extends State<RecentTransactions> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: RecentTransactionCustomContainer(
          cardImage: ImageAssets.visaCardImage,
          borderColor: ColorsPallete.titleColor,
          cardName: cardName,
          cardType: cardType,
          color: ColorsPallete.black.withOpacity(0.6),
          transactionMoney: transactionMoney,
          transactionMoneyColor: ColorsPallete.titleColor,
        ));
  }
}
