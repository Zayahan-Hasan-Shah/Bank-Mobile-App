import 'package:bank_app_practice/core/colors.dart';
import 'package:bank_app_practice/core/constants.dart';
import 'package:bank_app_practice/utils/titleText.dart';
import 'package:flutter/material.dart';

class CurrentBalance extends StatefulWidget {
  const CurrentBalance({super.key});

  @override
  State<CurrentBalance> createState() => _CurrentBalanceState();
}

class _CurrentBalanceState extends State<CurrentBalance> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TitleText(title: cb, color: ColorsPallete.black.withOpacity(0.4),),
        TitleText(title: balance, color: ColorsPallete.titleColor, fontSize: 34, weight: FontWeight.bold,),
      ],
    );
  }
}