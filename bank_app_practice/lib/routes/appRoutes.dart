import 'package:bank_app_practice/views/auth/loginScreen.dart';
import 'package:bank_app_practice/views/auth/signupScreen.dart';
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

  static Map<String, Widget Function(BuildContext _)> routes = {
    mainRoute : (_) => const SplashScreen(),
    welcomScreen : (_) => const Welcome(),
    onBoardingScreen : (_) => const OnBoarding(),
    signupScreen : (_) => SignUpScreen(),
    loginScreen : (_) => LoginScreen(),
    
  };
}