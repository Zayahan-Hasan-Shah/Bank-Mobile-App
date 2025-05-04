import 'package:bank_app_practice/core/colors.dart';
import 'package:bank_app_practice/core/images.dart';
import 'package:bank_app_practice/utils/customButton.dart';
import 'package:bank_app_practice/utils/customTextField.dart';
import 'package:bank_app_practice/utils/titleText.dart';
import 'package:bank_app_practice/utils/validations.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController emailAddressController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  final ValueNotifier<bool> obscurePassword = ValueNotifier<bool>(true);
  final ValueNotifier<bool> obscureConfirmPassword = ValueNotifier<bool>(true);

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailAddressController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    obscurePassword.dispose();
    obscureConfirmPassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildHeader(),
                _buildEmailField(),
                _buildPasswordField(),
                _buildConfirmPasswordField(),
                _signupButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(ImageAssets.splashLogoImage, width: 100),
        TitleText(
          title: 'Sign Up',
          color: ColorsPallete.black,
          fontSize: 40,
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  Widget _buildEmailField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TitleText(
          title: 'Email Address',
          color: ColorsPallete.black.withOpacity(0.4),
        ),
        CustomTextField(
          controller: emailAddressController,
          validator: AppValidations.emailValidation,
          obsText: false,
        ),
        const SizedBox(height: 10),
      ],
    );
  }

  Widget _buildPasswordField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TitleText(
          title: 'Password',
          color: ColorsPallete.black.withOpacity(0.4),
        ),
        ValueListenableBuilder<bool>(
          valueListenable: obscurePassword,
          builder: (_, value, __) {
            return CustomTextField(
              controller: passwordController,
              obsText: value,
              toggle: () => obscurePassword.value = !value,
              validator: AppValidations.passwordValidation,
            );
          },
        ),
        const SizedBox(height: 10),
      ],
    );
  }

  Widget _buildConfirmPasswordField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TitleText(
          title: 'Confirm Password',
          color: ColorsPallete.black.withOpacity(0.4),
        ),
        ValueListenableBuilder<bool>(
          valueListenable: obscureConfirmPassword,
          builder: (_, value, __) {
            return CustomTextField(
              controller: confirmPasswordController,
              obsText: value,
              toggle: () => obscureConfirmPassword.value = !value,
              validator: (value) => AppValidations.confirmPasswordValidation(
                value,
                passwordController.text.trim(),
              ),
            );
          },
        ),
        const SizedBox(height: 30),
      ],
    );
  }

  Widget _signupButton() {
    return Center(
      child: CustomButton(
        heightFactor: 20,
        onTap: () {},
        child: TitleText(
          title: 'Sign Up',
          fontSize: 22,
          textAlign: TextAlign.center,
          color: ColorsPallete.white,
        ),
      
      ),
    );
  }
}
