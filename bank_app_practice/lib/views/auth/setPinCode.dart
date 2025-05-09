import 'package:bank_app_practice/core/colors.dart';
import 'package:bank_app_practice/core/constants.dart';
import 'package:bank_app_practice/navigation/navigationHelper.dart';
import 'package:bank_app_practice/routes/appRoutes.dart';
import 'package:bank_app_practice/utils/customAppBar.dart';
import 'package:bank_app_practice/utils/customButton.dart';
import 'package:bank_app_practice/utils/titleText.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class PinCodeScreen extends StatefulWidget {
  const PinCodeScreen({super.key});

  @override
  State<PinCodeScreen> createState() => _PinCodeScreenState();
}

class _PinCodeScreenState extends State<PinCodeScreen> {
  String _pin = '';

  void _savePin(String value) {
    print("Entered PIN: $value");
    setState(() {
      _pin = value;
    });

    // Proceed with next step or validation
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: spc),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TitleText(title: spcd),
            const SizedBox(height: 20,),
            PinCodeTextField(
              enableActiveFill: true,
              appContext: context,
              length: 5,
              keyboardType: TextInputType.number,
              cursorColor: ColorsPallete.iconColor,
              obscureText: false,
              textStyle: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: ColorsPallete.iconColor,
              ),
              pinTheme: PinTheme(
                shape: PinCodeFieldShape.box,
                borderRadius: BorderRadius.circular(12),
                fieldHeight: 55,
                fieldWidth: 55,
                activeColor: ColorsPallete.iconColor,
                inactiveColor: ColorsPallete.iconColor.withOpacity(0.6),
                selectedColor: ColorsPallete.white,
                activeFillColor: ColorsPallete.iconColor.withOpacity(0.1),
                inactiveFillColor: ColorsPallete.iconColor.withOpacity(0.6),
                selectedFillColor: ColorsPallete.iconColor.withOpacity(0.2),
                borderWidth: 2,
              ),
              animationType: AnimationType.scale,
              animationDuration: const Duration(milliseconds: 250),
              onChanged: (value) => _pin = value,
              onCompleted: _savePin,
            ),
            const SizedBox(height: 40),
            _setButton(),
          ],
        ),
      ),
    );
  }

  Widget _setButton() {
    return SizedBox(
      height: 30,
      child: Center(
        child: CustomButton(
          heightFactor: 1.8,
          widthFactor: 0.6,
          borderRadiusButton: 20,
          alignmentButton: Alignment.center,
          onTap: () {
            if (_pin.isNotEmpty) {
              print("Form is valid. Proceed with phone number update.");
              pushNamed(AppRoutes.loginScreen);
            } else {
              print("Form is invalid. PHone number is invalid.");
            }
          },
          child: TitleText(
            title: s,
            fontSize: 22,
            textAlign: TextAlign.center,
            color: ColorsPallete.white,
          ),
        ),
      ),
    );
  }

}
