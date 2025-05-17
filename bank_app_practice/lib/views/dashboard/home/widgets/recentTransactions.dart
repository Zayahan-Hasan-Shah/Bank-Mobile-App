import 'package:bank_app_practice/core/images.dart';
import 'package:bank_app_practice/views/widgets/common/customContainer.dart';
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
      child: CustomContainer(widgetType: true, cardImage: ImageAssets.visaCardImage,)
    );
  }
}