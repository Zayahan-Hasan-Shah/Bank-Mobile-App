import 'package:bank_app_practice/core/colors.dart';
import 'package:bank_app_practice/core/constants.dart';
import 'package:bank_app_practice/core/images.dart';
import 'package:bank_app_practice/utils/titleText.dart';
import 'package:flutter/material.dart';

class ProfileUpdateScreen extends StatefulWidget {
  const ProfileUpdateScreen({super.key});

  @override
  State<ProfileUpdateScreen> createState() => _ProfileUpdateScreenState();
}

class _ProfileUpdateScreenState extends State<ProfileUpdateScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: TitleText(title: profileTitle, fontSize: 20,),
        centerTitle: true,
        leading: Container(
          margin: EdgeInsets.only(left: 12),
          width: 80,
          decoration: BoxDecoration(
            color: ColorsPallete.buttonColor,
            borderRadius: BorderRadius.circular(20),
          ),
          child: IconButton(
              onPressed: () {}, icon: Image.asset(ImageAssets.backArrowIcon)),
        ),
      ),
    );
  }
}
