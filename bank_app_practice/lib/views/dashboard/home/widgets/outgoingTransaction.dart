import 'package:bank_app_practice/core/colors.dart';
import 'package:bank_app_practice/core/constants.dart';
import 'package:bank_app_practice/core/images.dart';
import 'package:bank_app_practice/utils/titleText.dart';
import 'package:bank_app_practice/utils/validations.dart';
import 'package:flutter/material.dart';

class Outgoingtransaction extends StatelessWidget {
  final String outgoingTransactionPersonImage;
  final String outgoingTransactionPersonName;
  final String outgoingTransactionAmount;
  final String outgoingTransactionDate;
  const Outgoingtransaction(
      {required this.outgoingTransactionPersonImage,
      required this.outgoingTransactionPersonName,
      required this.outgoingTransactionAmount,
      required this.outgoingTransactionDate,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220,
      width: 180,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(ImageAssets.homeScreenVector2),
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
                    backgroundImage: AssetImage(outgoingTransactionPersonImage),
                  ),
                  const SizedBox(width: 12),
                  TitleText(
                    title: t,
                    color: ColorsPallete.black.withOpacity(0.5),
                  ),
                  TitleText(
                    title: AppValidations()
                        .splitName(outgoingTransactionPersonName),
                    weight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Image.asset(
                    ImageAssets.outgoingTransactionArrow,
                    height: 40,
                    alignment: Alignment.centerRight,
                  ),
                  const SizedBox(height: 6),
                  TitleText(
                    title: '- $outgoingTransactionAmount',
                    fontSize: 14,
                    color: ColorsPallete.titleColor,
                    weight: FontWeight.bold,
                  ),
                ],
              ),
            ],
          ),
          const Spacer(),
          TitleText(
            title: outgoingTransactionDate,
            fontSize: 12,
            color: ColorsPallete.black.withOpacity(0.6),
          ),
        ],
      ),
    );
  }
}
