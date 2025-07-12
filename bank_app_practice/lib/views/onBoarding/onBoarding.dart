import 'package:bank_app_practice/core/colors.dart';
import 'package:bank_app_practice/core/constants.dart';
import 'package:bank_app_practice/navigation/navigationHelper.dart';
import 'package:bank_app_practice/routes/appRoutes.dart';
import 'package:bank_app_practice/views/onBoarding/widgets/onBaordingScreen4.dart';
import 'package:bank_app_practice/views/onBoarding/widgets/onBaordingScreen6.dart';
import 'package:bank_app_practice/views/onBoarding/widgets/onBoardingScreen1.dart';
import 'package:bank_app_practice/views/onBoarding/widgets/onBoardingScreen2.dart';
import 'package:bank_app_practice/views/onBoarding/widgets/onBoardingScreen3.dart';
import 'package:bank_app_practice/views/onBoarding/widgets/onBoardingScreen5.dart';
import 'package:bank_app_practice/utils/customButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoarding extends ConsumerStatefulWidget {
  const OnBoarding({Key? key}) : super(key: key);
  @override
  ConsumerState<OnBoarding> createState() => _OnBoarding();
}

class _OnBoarding extends ConsumerState<OnBoarding> {
  static final PageController _pageController = PageController(initialPage: 0);
  final List<Widget> _onBoardingScreenList = [
    OnBoardingScreen1(),
    OnBoardingScreen2(),
    OnBoardingScreen3(),
    OnBoardingScreen4(),
    OnBoardingScreen5(),
    OnBoardingScreen6(),
  ];

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
    return Scaffold(
      backgroundColor: ColorsPallete.backgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: PageView(
                controller: _pageController,
                children: _onBoardingScreenList,
              ),
            ),
            SmoothPageIndicator(
                controller: _pageController,
                count: _onBoardingScreenList.length),
            const SizedBox(height: 30),
            CustomButton(
              onTap: () {
                pushNamedRemoveAll(AppRoutes.signupScreen);
              },
              title: skip,
            )
          ],
        ),
      ),
    );
  }
}
