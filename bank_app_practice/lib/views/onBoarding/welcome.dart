import 'package:bank_app_practice/core/colors.dart';
import 'package:bank_app_practice/core/constants.dart';
import 'package:bank_app_practice/core/images.dart';
import 'package:bank_app_practice/navigation/navigationHelper.dart';
import 'package:bank_app_practice/routes/appRoutes.dart';
import 'package:bank_app_practice/utils/customButton.dart';
import 'package:bank_app_practice/utils/titleText.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Welcome extends ConsumerStatefulWidget {
  const Welcome({Key? key}) : super(key: key);
  @override
  ConsumerState<Welcome> createState() => _Welcome();
}

class _Welcome extends ConsumerState<Welcome> {
  void initialization() async {
    try {} catch (e) {}
  }

  @override
  void initState() {
    super.initState();
    initialization();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorsPallete.white,
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              ImageAssets.splashLogoImage,
              width: MediaQuery.of(context).size.width * 0.8,
            ),
            const SizedBox(height: 10),
            TitleText(
              title: welcome,
              fontSize: 32,
              color: ColorsPallete.titleColor,
              weight: FontWeight.w700,
            ),
            const SizedBox(height: 10),
            TitleText(
              title: line1,
              fontSize: 14,
              color: ColorsPallete.black,
              weight: FontWeight.w700,
            ),
            const SizedBox(height: 20),
            CustomButton(
              onTap: () {
                pushNamed(AppRoutes.onBoardingScreen);
              },
              child: TitleText(
                title: 'Get Started',
                color: ColorsPallete.white,
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
