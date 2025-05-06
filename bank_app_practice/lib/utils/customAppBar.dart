import 'package:bank_app_practice/core/colors.dart';
import 'package:bank_app_practice/navigation/navigationHelper.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final VoidCallback? onBack;
  final Color backgroundColor;
  final Widget? backIcon;

  const CustomAppBar({
    Key? key,
    required this.title,
    this.onBack,
    this.backgroundColor = Colors.transparent,
    this.backIcon,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: backgroundColor,
      centerTitle: true,
      title: Text(
        title,
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
      ),
      leading: Container(
        margin: const EdgeInsets.only(left: 12),
        width: 90,
        height: 60,
        decoration: BoxDecoration(
          color: ColorsPallete.buttonColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: IconButton(
          onPressed: onBack ?? () => pop(),
          icon: backIcon ?? const Icon(Icons.arrow_back, color: Colors.white),
        ),
      ),
    );
  }
}
