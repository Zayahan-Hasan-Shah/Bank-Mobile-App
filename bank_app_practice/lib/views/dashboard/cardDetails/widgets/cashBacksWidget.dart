import 'package:bank_app_practice/core/colors.dart';
import 'package:bank_app_practice/utils/titleText.dart';
import 'package:flutter/material.dart';

class CashBacksWidget extends StatelessWidget {
  String icon;
  bool check;
  String image;
  String title;
  String time;
  double money;
  String cashBackArrow;
  CashBacksWidget({
    super.key,
    required this.icon,
    this.check = false,
    required this.image,
    required this.title,
    required this.time,
    required this.money,
    required this.cashBackArrow,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        color: ColorsPallete.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [BoxShadow(
          blurStyle: BlurStyle.outer,
          blurRadius: 1,
          offset: Offset(1, 1)
          )],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Row(
              children: [
                check
                    ? Center(
                        child: Image.asset(icon),
                      )
                    : CircleAvatar(
                        radius: 24,
                        backgroundImage: AssetImage(image),
                      ),
                const SizedBox(width: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TitleText(title: title, fontSize: 18),
                    const SizedBox(height: 10),
                    TitleText(title: time.toString(), fontSize: 14),
                  ],
                ),
              ],
            ),
          ),
          Column(
            children: [
              Image.asset(icon),
              TitleText(title: '\$$money', fontSize: 16),
            ],
          )
        ],
      ),
    );
  }
}
