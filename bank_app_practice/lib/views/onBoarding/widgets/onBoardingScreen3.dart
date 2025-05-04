import 'package:bank_app_practice/core/colors.dart';
import 'package:bank_app_practice/core/constants.dart';
import 'package:bank_app_practice/core/images.dart';
import 'package:bank_app_practice/utils/titleText.dart';
import 'package:flutter/material.dart';

class OnBoardingScreen3 extends StatelessWidget {
  const OnBoardingScreen3({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              ImageAssets.ftImage,
              width: MediaQuery.of(context).size.width * 0.8,
            ),
            const SizedBox(height: 10),
            TitleText(
              title: ft,
              fontSize: 32,
              color: ColorsPallete.titleColor,
              weight: FontWeight.w700,
            ),
            const SizedBox(height: 10),
            TitleText(
              title: line4,
              fontSize: 14,
              textAlign: TextAlign.center,
              color: ColorsPallete.black.withOpacity(0.4),
              weight: FontWeight.w700,
            ),
            const SizedBox(height: 20), 
          ],
        ),
      );
  }
}