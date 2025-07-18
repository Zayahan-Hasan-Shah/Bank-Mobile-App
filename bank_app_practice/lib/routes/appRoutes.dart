import 'package:bank_app_practice/views/auth/loginScreen.dart';
import 'package:bank_app_practice/views/auth/phoneNumbrtScreen.dart';
import 'package:bank_app_practice/views/auth/profileUpdateScreen.dart';
import 'package:bank_app_practice/views/auth/setPinCode.dart';
import 'package:bank_app_practice/views/auth/signupScreen.dart';
import 'package:bank_app_practice/views/dashboard/activity/activityScreen.dart';
import 'package:bank_app_practice/views/dashboard/bottomNavigation/bottomNavigationMain.dart';
import 'package:bank_app_practice/views/dashboard/home/homeScreen.dart';
import 'package:bank_app_practice/views/onBoarding/onBoarding.dart';
import 'package:bank_app_practice/views/onBoarding/welcome.dart';
import 'package:bank_app_practice/views/splash.dart';
import 'package:flutter/material.dart';


class AppRoutes {
  static const mainRoute = '/';
  static const welcomScreen = '/welcome';
  static const loginScreen = '/loginscreen';
  static const onBoardingScreen = '/onboardingscreen';
  static const signupScreen = '/signupscreen';
  static const profileUpdateScreen = '/profileupdatescreen';
  static const phoneNumberScreen = '/phonenumberscreen';
  static const setPinCodeScreen = '/setpincodescreen';
  static const homeScreen = '/homescreen';
  static const bottomNavigation = '/bottomnavigation';
  static const activityScreen = '/activityscreen';

  static Map<String, Widget Function(BuildContext _)> routes = {
    mainRoute : (_) => const SplashScreen(),
    welcomScreen : (_) => const Welcome(),
    onBoardingScreen : (_) => const OnBoarding(),
    signupScreen : (_) => SignUpScreen(),
    loginScreen : (_) => LoginScreen(),
    profileUpdateScreen : (_) => ProfileUpdateScreen(),
    phoneNumberScreen : (_) => PhoneNumberScreen(),
    setPinCodeScreen : (_) => PinCodeScreen(),
    homeScreen : (_) => HomeScreen(),
    bottomNavigation : (_) => BottomNavigaationMain(),
    activityScreen : (_) => ActivityScreen(),
  };
}