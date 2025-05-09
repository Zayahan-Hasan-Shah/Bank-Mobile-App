import 'package:bank_app_practice/core/colors.dart';
import 'package:bank_app_practice/core/constants.dart';
import 'package:bank_app_practice/navigation/navigationHelper.dart';
import 'package:bank_app_practice/routes/appRoutes.dart';
import 'package:bank_app_practice/utils/customAppBar.dart';
import 'package:bank_app_practice/utils/customButton.dart';
import 'package:bank_app_practice/utils/customTextField.dart';
import 'package:bank_app_practice/utils/titleText.dart';
import 'package:bank_app_practice/utils/validations.dart';
import 'package:flutter/material.dart';

class PhoneNumberScreen extends StatefulWidget {
  const PhoneNumberScreen({super.key});

  @override
  State<PhoneNumberScreen> createState() => _PhoneNumberScreenState();
}

class _PhoneNumberScreenState extends State<PhoneNumberScreen> {
  TextEditingController phoneNumberController = TextEditingController();
  bool isEmailValid = false;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    phoneNumberController.addListener(() {
      final isValid =
          AppValidations.nameValidation(phoneNumberController.text) == null;
      if (isEmailValid != isValid) {
        setState(() {
          isEmailValid = isValid;
        });
      }
    });
  }
  
  @override
  void dispose() {
    phoneNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: phoneNumberTitle),
      body: Padding(
        padding: const EdgeInsets.all(40),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TitleText(
                title: paymn,
                textAlign: TextAlign.center,
                fontSize: 16,
              ),
              const SizedBox(height: 40),
              _buildPhoneNumberField(),
              _confirmButton()
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPhoneNumberField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TitleText(
          title: phoneNumberTitle,
          color: ColorsPallete.black.withOpacity(0.4),
        ),
        CustomTextField(
          controller: phoneNumberController,
          validator: AppValidations.phoneNumberValidation,
          obsText: false,
          suffixIcon: isEmailValid
              ? const Icon(Icons.check_circle, color: ColorsPallete.titleColor)
              : null,
        ),
                const SizedBox(height: 40,),
      ],
    );
  }

  Widget _confirmButton() {
    return SizedBox(
      height: 30,
      child: Center(
        child: CustomButton(
          heightFactor: 1.8,
          widthFactor: 0.6,
          borderRadiusButton: 20,
          alignmentButton: Alignment.center,
          onTap: () {
            if (formKey.currentState!.validate()) {
              print("Form is valid. Proceed with phone number update.");
              pushNamed(AppRoutes.setPinCodeScreen);
            } else {
              print("Form is invalid. PHone number is invalid.");
            }
          },
          child: TitleText(
            title: c,
            fontSize: 22,
            textAlign: TextAlign.center,
            color: ColorsPallete.white,
          ),
        ),
      ),
    );
  }

}
