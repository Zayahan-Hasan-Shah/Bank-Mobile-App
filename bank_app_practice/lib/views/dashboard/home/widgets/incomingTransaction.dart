import 'package:bank_app_practice/core/colors.dart';
import 'package:bank_app_practice/core/constants.dart';
import 'package:bank_app_practice/core/images.dart';
import 'package:bank_app_practice/utils/titleText.dart';
import 'package:bank_app_practice/utils/validations.dart';
import 'package:flutter/material.dart';

class IncomingTransaction extends StatelessWidget {
  final String incomingTransactionPersonImage;
  final String incomingTransactionPersonName;
  final String incomingTransactionAmount;
  final String incomingTransactionDate;

  const IncomingTransaction(
      {required this.incomingTransactionPersonImage,
      required this.incomingTransactionPersonName,
      required this.incomingTransactionAmount,
      required this.incomingTransactionDate,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220,
      width: 170,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(ImageAssets.homeScreenVector1),
          fit: BoxFit.contain,
          alignment: Alignment.bottomCenter,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 24,
                    backgroundImage: AssetImage(incomingTransactionPersonImage),
                  ),
                  const SizedBox(width: 12),
                  TitleText(
                    title: f,
                    color: ColorsPallete.black.withOpacity(0.5),
                  ),
                  TitleText(
                    title: AppValidations()
                        .splitName(incomingTransactionPersonName),
                    weight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Image.asset(
                    ImageAssets.incomingTransactionArrow,
                    height: 40,
                    alignment: Alignment.centerRight,
                  ),
                  const SizedBox(height: 6),
                  TitleText(
                    title: '+ $incomingTransactionAmount',
                    fontSize: 14,
                    color: ColorsPallete.incomingTransactionColor,
                    weight: FontWeight.bold,
                  ),
                ],
              ),
            ],
          ),
          const Spacer(),
          TitleText(
            title: incomingTransactionDate,
            fontSize: 12,
            color: ColorsPallete.black.withOpacity(0.6),
          ),
        ],
      ),
    );
  }
}
