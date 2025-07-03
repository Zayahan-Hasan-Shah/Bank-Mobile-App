import 'package:bank_app_practice/core/colors.dart';
import 'package:bank_app_practice/core/images.dart';
import 'package:bank_app_practice/utils/titleText.dart';
import 'package:flutter/material.dart';

class CurrencyRate extends StatelessWidget {
  String currencyName;
  int currencyCurrentRate;
  int currencyPrevRate;

  CurrencyRate({
    super.key,
    required this.currencyName,
    required this.currencyCurrentRate,
    required this.currencyPrevRate,
  });

  @override
  Widget build(BuildContext context) {
    final double currPercent = (currencyCurrentRate) / 100;
    final double prevPercent = (currencyPrevRate) / 100;
    final double difference =
        currPercent > prevPercent ? currPercent : prevPercent;
    return Container(
      padding: const EdgeInsets.all(4),
      width: 100,
      decoration: BoxDecoration(
        color: currencyCurrentRate > currencyPrevRate
            ? ColorsPallete.incomingTransactionColor
            : ColorsPallete.titleColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TitleText(
            title: currencyName,
            fontSize: 16,
            color: ColorsPallete.white,
          ),
          const SizedBox(width: 20),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(
                currencyCurrentRate > currencyPrevRate
                    ? ImageAssets.incomingTransactionArrow
                    : ImageAssets.outgoingTransactionArrow,
                color: Colors.white,
                height: currencyCurrentRate > currencyPrevRate ? 25 : 25,
              ),
              const SizedBox(height: 10),
              TitleText(
                title: difference.toString(),
                fontSize: 14,
                color: ColorsPallete.white,
              ),
            ],
          )
        ],
      ),
    );
  }
}
