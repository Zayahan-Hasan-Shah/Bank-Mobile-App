import 'package:bank_app_practice/core/colors.dart';
import 'package:bank_app_practice/utils/titleText.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final customButtonController = StateProvider<bool>((ref) {
  return false;
});

class CustomButton extends StatelessWidget {
  final String? title;
  final double? widthFactor;
  final VoidCallback onTap;
  final bool? hasPadding;
  final double? heightFactor;
  final Widget? child;
  final bool? showLoader;
  final FontWeight? titleWeight;
  final double? titleSize;
  final Color? titleColor;
  final Alignment? alignmentButton;
  final double? borderRadiusButton;
  final MaterialStateProperty<Color?>? color;

  const CustomButton({
    Key? key,
    this.title,
    this.titleColor,
    required this.onTap,
    this.child,
    this.color,
    this.widthFactor,
    this.hasPadding,
    this.showLoader = false,
    this.titleSize,
    this.titleWeight,
    this.heightFactor,
    this.alignmentButton,
    this.borderRadiusButton,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, widget) {
        final showLoading = ref.watch(customButtonController);
        return FractionallySizedBox(
          heightFactor: heightFactor,
          widthFactor: widthFactor ?? 0.8,
          child: ElevatedButton(
            onPressed: onTap,
            style: ButtonStyle(
              shape: MaterialStatePropertyAll(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(borderRadiusButton ?? 16), // 👈 Set your desired radius
                ),
              ),
              elevation: const MaterialStatePropertyAll(10.0),
              shadowColor: MaterialStatePropertyAll(
                MaterialStateColor.resolveWith(
                  (states) => Colors.blueAccent,
                ),
              ),
              backgroundColor: color ??
                  MaterialStatePropertyAll(
                    MaterialStateColor.resolveWith(
                      (states) => ColorsPallete.titleColor,
                    ),
                  ),
            ),
            child: (showLoader ?? false) && showLoading
                ? Center(
                    child: Transform.scale(
                      scale: 0.6,
                      child: const CircularProgressIndicator.adaptive(
                        valueColor:
                            AlwaysStoppedAnimation<Color>(ColorsPallete.white),
                      ),
                    ),
                  )
                : title != null
                    ? TitleText(
                        title: title!,
                        weight: titleWeight ?? FontWeight.w400,
                        fontSize: titleSize ?? 15,
                        color: titleColor ?? ColorsPallete.white,
                      )
                    : child,
          ),
        );
      },
    );
  }
}
