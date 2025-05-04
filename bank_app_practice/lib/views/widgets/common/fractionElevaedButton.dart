import 'package:bank_app_practice/core/colors.dart';
import 'package:flutter/material.dart';

class FractionallyElevatedButton extends StatelessWidget {
  const FractionallyElevatedButton({
    super.key,
    required this.onTap,
    this.widthFactor,
    this.child,
  });

  final Widget? child;
  final double? widthFactor;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: widthFactor ?? 0.7,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: ColorsPallete.buttonColor,
          elevation: 0,
          side: const BorderSide(color: ColorsPallete.black),
          visualDensity: const VisualDensity(
            vertical: 2,
            horizontal: 2,
          ),
        ),
        onPressed: onTap,
        child: child,
      ),
    );
  }
}
