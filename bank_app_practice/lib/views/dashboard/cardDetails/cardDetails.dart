import 'package:bank_app_practice/core/colors.dart';
import 'package:bank_app_practice/core/constants.dart';
import 'package:bank_app_practice/utils/customAppBar.dart';
import 'package:bank_app_practice/views/dashboard/cardDetails/widgets/currencyRate.dart';
import 'package:bank_app_practice/views/widgets/common/recentTransactions.dart';
import 'package:flutter/material.dart';

class CardDetails extends StatefulWidget {
  const CardDetails({super.key});

  @override
  State<CardDetails> createState() => _CardDetailsState();
}

class _CardDetailsState extends State<CardDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: cardDetails),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    RecentTransactions(),
                    SizedBox(width: 10),
                    RecentTransactions(),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.all(12),
                margin: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                    color: ColorsPallete.banksCardBackgroundColor,
                    borderRadius: BorderRadius.circular(16)),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  physics: BouncingScrollPhysics(),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CurrencyRate(
                        currencyName: currency1,
                        currencyCurrentRate: currRate1,
                        currencyPrevRate: prevRate1,
                      ),
                      const SizedBox(width: 8),
                      CurrencyRate(
                        currencyName: currency2,
                        currencyCurrentRate: currRate2,
                        currencyPrevRate: prevRate2,
                      ),
                      const SizedBox(width: 8),
                      CurrencyRate(
                        currencyName: currency3,
                        currencyCurrentRate: currRate3,
                        currencyPrevRate: prevRate3,
                      ),
                      const SizedBox(width: 8),
                      CurrencyRate(
                        currencyName: currency4,
                        currencyCurrentRate: currRate4,
                        currencyPrevRate: pervRate4,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 40),
              
            ],
          ),
        ),
      ),
    );
  }
}
