import 'package:bank_app_practice/core/colors.dart';
import 'package:bank_app_practice/core/constants.dart';
import 'package:bank_app_practice/core/images.dart';
import 'package:bank_app_practice/navigation/navigationHelper.dart';
import 'package:bank_app_practice/routes/appRoutes.dart';
import 'package:bank_app_practice/utils/customAppBar.dart';
import 'package:bank_app_practice/utils/customButton.dart';
import 'package:bank_app_practice/utils/customTextField.dart';
import 'package:bank_app_practice/utils/titleText.dart';
import 'package:bank_app_practice/utils/validations.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool isEmailValid = false;

  final TextEditingController emailAddressController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  final ValueNotifier<bool> obscurePassword = ValueNotifier<bool>(true);
  final ValueNotifier<bool> obscureConfirmPassword = ValueNotifier<bool>(true);

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    emailAddressController.addListener(() {
      final isValid =
          AppValidations.emailValidation(emailAddressController.text) == null;
      if (isEmailValid != isValid) {
        setState(() {
          isEmailValid = isValid;
        });
      }
    });
  }

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
        appBar: CustomAppBar(title: ''),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildHeader(),
                  _buildEmailField(),
                  _buildPasswordField(),
                  _buildConfirmPasswordField(),
                  _signupButton(),
                  const SizedBox(height: 40),
                  _orLine(),
                  const SizedBox(height: 20),
                  _signupOptions(),
                  const SizedBox(height: 40),
                  _loginTagLine(),
                ],
              ),
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
          title: signUpTitle,
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
          title: emailAddressLabel,
          color: ColorsPallete.black.withOpacity(0.4),
        ),
        CustomTextField(
          controller: emailAddressController,
          validator: AppValidations.emailValidation,
          obsText: false,
          suffixIcon: isEmailValid
              ? const Icon(Icons.check_circle, color: ColorsPallete.titleColor)
              : null,
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
          title: passwordLabel,
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
          title: confirmPasswordLabel,
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
        const SizedBox(height: 50),
      ],
    );
  }

  Widget _signupButton() {
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
              print("Form is valid. Proceed with signup.");
              pushNamed(AppRoutes.profileUpdateScreen);
            } else {
              print("Form is invalid. Show errors.");
            }
          },
          child: TitleText(
            title: signUpTitle,
            fontSize: 22,
            textAlign: TextAlign.center,
            color: ColorsPallete.white,
          ),
        ),
      ),
    );
  }

  Widget _orLine() {
    return Center(
      child: SizedBox(
        width: 250,
        height: 20,
        child: Row(
          children: [
            Expanded(
              child: Divider(
                color: ColorsPallete.black.withOpacity(0.4),
                thickness: 1.5,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: TitleText(
                title: 'or',
                fontSize: 16,
                color: ColorsPallete.black.withOpacity(0.4),
              ),
            ),
            Expanded(
              child: Divider(
                color: ColorsPallete.black.withOpacity(0.4),
                thickness: 1.5,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _signupOptions() {
    return Center(
      child: SizedBox(
        height: 60,
        width: 250,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 60,
              height: 120,
              decoration: BoxDecoration(
                color: ColorsPallete.googleSignupBgColor,
                borderRadius: BorderRadius.circular(30),
                boxShadow: const [
                  BoxShadow(
                    color: ColorsPallete.googleSignupBgColor,
                  ),
                ],
              ),
              child: IconButton(
                onPressed: () {},
                icon: Image.asset(
                  ImageAssets.googleSignupImage,
                  width: 60,
                  height: 80,
                ),
              ),
            ),
            Container(
              width: 60,
              height: 180,
              decoration: BoxDecoration(
                color: ColorsPallete.googleSignupBgColor,
                borderRadius: BorderRadius.circular(30),
              ),
              child: IconButton(
                onPressed: () {},
                icon: Image.asset(
                  ImageAssets.facebookImage,
                  width: 60,
                  height: 140,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _loginTagLine() {
    return Center(
      child: RichText(
        text: TextSpan(
            text: ahac,
            style: TextStyle(color: ColorsPallete.black),
            children: [
              TextSpan(
                text: ' $loginTitle',
                style: TextStyle(
                  color: ColorsPallete.titleColor,
                ),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    pushNamedReplace(AppRoutes.loginScreen);
                  },
              ),
            ]),
      ),
    );
  }
}
