import 'package:bank_app_practice/core/colors.dart';
import 'package:bank_app_practice/core/images.dart';
import 'package:bank_app_practice/utils/titleText.dart';
import 'package:bank_app_practice/views/dashboard/activity/widgets/overallIncomingChart.dart';
import 'package:flutter/material.dart';

class OverAllIncomingChart extends StatelessWidget {
  final List<Map<String, dynamic>> data;
  const OverAllIncomingChart({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            blurRadius: 10,
            offset: Offset(2, 6),
            blurStyle: BlurStyle.outer,
            spreadRadius: 4,
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
              child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: ColorsPallete.iconColor,
                        borderRadius: BorderRadius.circular(12)),
                    child: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.calendar_month_rounded,
                          color: ColorsPallete.white,
                        )),
                  ),
                  const SizedBox(width: 4),
                  TitleText(title: '09-12 July')
                ],
              ),
              Image.asset(
                ImageAssets.overAllIncomingChart,
                fit: BoxFit.cover,
              )
            ],
          )),
          OverAllIncomingTransactionLineChart(data: data),
        ],
      ),
    );
  }
}
