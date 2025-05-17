import 'package:bank_app_practice/core/colors.dart';
import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  final String? cardImage;
  final String? cardType;
  final String? cardName;
  final double? amount;
  final Color? borderColor;
  final bool widgetType;

  const CustomContainer({
    this.cardImage,
    this.cardType,
    this.cardName,
    this.amount,
    this.borderColor,
    required this.widgetType,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: ColorsPallete.titleColor),
        borderRadius: BorderRadius.circular(8),
      ),
      child: widgetType ? Row(
        children: [
          Image.asset(cardImage!),
        ],
      ) : Column(),
    );
  }
}
