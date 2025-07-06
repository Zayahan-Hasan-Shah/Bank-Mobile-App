import 'package:bank_app_practice/core/colors.dart';
import 'package:bank_app_practice/core/constants.dart';
import 'package:bank_app_practice/core/images.dart';
import 'package:bank_app_practice/utils/customAppBar.dart';
import 'package:bank_app_practice/utils/customButton.dart';
import 'package:bank_app_practice/utils/titleText.dart';
import 'package:bank_app_practice/views/dashboard/cardDetails/widgets/cashBacksWidget.dart';
import 'package:bank_app_practice/views/dashboard/cardDetails/widgets/currencyRate.dart';
import 'package:bank_app_practice/views/widgets/common/notificationWidget.dart';
import 'package:bank_app_practice/views/widgets/common/recentTransactions.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CardDetails extends StatefulWidget {
  const CardDetails({super.key});

  @override
  State<CardDetails> createState() => _CardDetailsState();
}

class _CardDetailsState extends State<CardDetails> {
  final String formatedTime = DateFormat('hh:mm a').format(DateTime.now());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsPallete.backgroundColor,
      appBar: CustomAppBar(
        title: cardDetails,
        backButtonWidget: Builder(
          builder: (context) => IconButton(
            icon: Icon(Icons.menu),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
        actionWidget: NotificationWidget(
          onTap: () {},
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _recentTransactionUI(),
              const SizedBox(height: 10),
              _currencyRateUI(),
              const SizedBox(height: 40),
              Container(
                height: 30,
                alignment: Alignment.center,
                decoration: BoxDecoration(),
                child: CustomButton(
                  heightFactor: 1.8,
                  widthFactor: 0.5,
                  onTap: () {},
                  child: TitleText(
                    title: ac,
                    fontSize: 22,
                    color: ColorsPallete.white,
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TitleText(
                      title: cashBacks,
                      fontSize: 18,
                      color: ColorsPallete.black.withOpacity(0.6)),
                  TextButton(
                      onPressed: () {},
                      child: TitleText(
                          title: '$seeAll >',
                          fontSize: 14,
                          color: ColorsPallete.titleColor))
                ],
              ),
              const SizedBox(height: 10),
              _cashBacksminorList(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _recentTransactionUI() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          RecentTransactions(),
          SizedBox(width: 10),
          RecentTransactions(),
        ],
      ),
    );
  }

  Widget _currencyRateUI() {
    return Container(
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
    );
  }

  Widget _cashBacksminorList() {
    return Column(
      children: [
        CashBacksWidget(
            icon: ImageAssets.incomingTransactionArrow,
            image: ImageAssets.cashBackFemale1,
            title: 'Entertainment',
            time: formatedTime,
            money: 4.67,
            cashBackArrow: ImageAssets.incomingTransactionArrow),
        const SizedBox(height: 10),
        CashBacksWidget(
            icon: ImageAssets.incomingTransactionArrow,
            image: ImageAssets.cashBackFemale1,
            title: 'Entertainment',
            time: formatedTime,
            money: 4.67,
            cashBackArrow: ImageAssets.incomingTransactionArrow),
        const SizedBox(height: 10),
        CashBacksWidget(
            icon: ImageAssets.incomingTransactionArrow,
            image: ImageAssets.cashBackFemale1,
            title: 'Entertainment',
            time: formatedTime,
            money: 4.67,
            cashBackArrow: ImageAssets.incomingTransactionArrow),
      ],
    );
  }
}
