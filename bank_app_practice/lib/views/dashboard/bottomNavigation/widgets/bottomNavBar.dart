import 'package:bank_app_practice/controllers/BottomNavigationController/bottomNavigationController.dart';
import 'package:bank_app_practice/core/colors.dart';
import 'package:bank_app_practice/core/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BottomNavBar extends ConsumerWidget {
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(bottomNavProvider);
    final size = MediaQuery.of(context).size;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      height: 70,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(35),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 15,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildNavItem(context, ref, 0, ImageAssets.homeActive,
              ImageAssets.homeInActive, currentIndex == 0),
          _buildNavItem(context, ref, 1, ImageAssets.walletActive,
              ImageAssets.walletInActive, currentIndex == 1),
          // _buildNavItem(context, ref, 2, ImageAssets.chartInActive,
          //     ImageAssets.chartActive, currentIndex == 2),
          // _buildNavItem(context, ref, 3, ImageAssets.profileInActive,
          //     ImageAssets.profileActive, currentIndex == 3),
        ],
      ),
    );
  }

  Widget _buildNavItem(BuildContext context, WidgetRef ref, int index,
      String activeImage, String inActiveImage, bool isSelected) {
    return GestureDetector(
      onTap: () => ref.read(bottomNavProvider.notifier).state = index,
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color:
              isSelected ? ColorsPallete.activeIconColor : Colors.transparent,
          shape: isSelected ? BoxShape.rectangle : BoxShape.circle,
          borderRadius: isSelected ? BorderRadius.circular(30) : null,
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 10,
                    offset: Offset(0, 5),
                  )
                ]
              : null,
        ),
        child:
            Image.asset(isSelected ? activeImage : inActiveImage, height: 30),
      ),
    );
  }
}
