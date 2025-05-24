import 'package:bank_app_practice/core/colors.dart';
import 'package:bank_app_practice/navigation/navigationHelper.dart';
import 'package:flutter/material.dart';

class BackButton extends StatelessWidget {
  const BackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(left: 12),
        width: 90,
        height: 60,
        decoration: BoxDecoration(
          color: ColorsPallete.buttonColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: IconButton(
          onPressed:() => pop(),
          icon: const Icon(Icons.arrow_back, color: Colors.white),
        ),
      );
  }
}