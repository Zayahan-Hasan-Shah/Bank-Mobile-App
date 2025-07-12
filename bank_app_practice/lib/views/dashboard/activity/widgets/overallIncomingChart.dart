import 'package:bank_app_practice/core/colors.dart';
import 'package:bank_app_practice/utils/titleText.dart';
import 'package:flutter/material.dart';

class OverAllIncomingChart extends StatelessWidget {
  const OverAllIncomingChart({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
              child: Row(
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
              
            
            ],
          )),
        ],
      ),
    );
  }
}
