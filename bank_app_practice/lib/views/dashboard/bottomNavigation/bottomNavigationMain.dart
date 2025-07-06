import 'package:bank_app_practice/controllers/BottomNavigationController/bottomNavigationController.dart';
import 'package:bank_app_practice/views/dashboard/activity/activityScreen.dart';
import 'package:bank_app_practice/views/dashboard/bottomNavigation/widgets/bottomNavBar.dart';
import 'package:bank_app_practice/views/dashboard/cardDetails/cardDetails.dart';
import 'package:bank_app_practice/views/dashboard/home/homeScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BottomNavigaationMain extends ConsumerWidget {
  const BottomNavigaationMain({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(bottomNavProvider);

    final screens = [
      HomeScreen(),
      CardDetails(),
      ActivityScreen()
    ];

    return Stack(
      children: [
        Scaffold(
          body: screens[currentIndex],
          backgroundColor: Color(0xFFF9F7FB),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          heightFactor: 8,
          child: BottomNavBar(),
        ),
      ],
    );
  }
}
