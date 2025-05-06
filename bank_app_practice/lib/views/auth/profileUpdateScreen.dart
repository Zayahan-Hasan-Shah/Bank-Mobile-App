import 'dart:io';

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
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProfileUpdateScreen extends StatefulWidget {
  const ProfileUpdateScreen({super.key});

  @override
  State<ProfileUpdateScreen> createState() => _ProfileUpdateScreenState();
}

class _ProfileUpdateScreenState extends State<ProfileUpdateScreen> {
  File? image;
  bool isEmailValid = false;
  final picker = ImagePicker();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    firstNameController.addListener(() {
      final isValid =
          AppValidations.nameValidation(firstNameController.text) == null;
      if (isEmailValid != isValid) {
        setState(() {
          isEmailValid = isValid;
        });
      }
    });
    lastNameController.addListener(() {
      final isValid =
          AppValidations.nameValidation(lastNameController.text) == null;
      if (isEmailValid != isValid) {
        setState(() {
          isEmailValid = isValid;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: profileTitle),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Form(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buildProfileImagePicker(image: image, onTap: _pickImage),
              SizedBox(height: 30),
              _buildFirstNameField(),
              SizedBox(height: 20),
              _buildLastNameField(),
              SizedBox(height: 60),
              _setButton()
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _pickImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        image = File(pickedFile.path);
      });
    }
  }

  Widget buildProfileImagePicker({
    required File? image,
    required VoidCallback onTap,
    double radius = 70,
  }) {
    return Center(
      child: GestureDetector(
          onTap: onTap,
          child: Column(
            children: [
              TitleText(
                title: psuyp,
                fontSize: 16,
                color: ColorsPallete.black.withOpacity(0.4),
              ),
              SizedBox(height: 20),
              CircleAvatar(
                radius: radius,
                backgroundColor: ColorsPallete.buttonColor,
                backgroundImage: image != null ? FileImage(image) : null,
                child:
                    image == null ? Image.asset(ImageAssets.uploadIcon) : null,
              ),
            ],
          )),
    );
  }

  Widget _buildFirstNameField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TitleText(
          title: fn,
          color: ColorsPallete.black.withOpacity(0.4),
        ),
        CustomTextField(
          controller: firstNameController,
          validator: AppValidations.nameValidation,
          obsText: false,
          suffixIcon: isEmailValid
              ? const Icon(Icons.check_circle, color: ColorsPallete.titleColor)
              : null,
        ),
        const SizedBox(height: 10),
      ],
    );
  }

  Widget _buildLastNameField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TitleText(
          title: ln,
          color: ColorsPallete.black.withOpacity(0.4),
        ),
        CustomTextField(
          controller: lastNameController,
          validator: AppValidations.nameValidation,
          obsText: false,
          suffixIcon: isEmailValid
              ? const Icon(Icons.check_circle, color: ColorsPallete.titleColor)
              : null,
        ),
        const SizedBox(height: 40),
      ],
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
            if (formKey.currentState!.validate()) {
              print("Form is valid. Proceed with profile update.");
              pushNamed(AppRoutes.profileUpdateScreen);
            } else {
              print("Form is invalid. Show errors.");
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
