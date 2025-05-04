import 'package:bank_app_practice/core/colors.dart';
import 'package:flutter/material.dart';

ThemeData appTheme() {
  return ThemeData(
    dialogTheme: const DialogTheme(surfaceTintColor: ColorsPallete.white),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        shape: MaterialStatePropertyAll<OutlinedBorder>(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        ),
      ),
    ),
    cardTheme: CardTheme(
      elevation: 10,
      color: ColorsPallete.white,
      surfaceTintColor: ColorsPallete.white,
    ),
    appBarTheme: AppBarTheme(
      iconTheme: IconThemeData(color: ColorsPallete.iconColor),
    ),
  );
}
